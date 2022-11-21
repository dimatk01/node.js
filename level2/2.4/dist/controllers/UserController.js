"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const dataBaseConnect_1 = require("./dataBaseConnect");
const bcrypt = require('bcrypt');
class UserController {
    addUser(user, res) {
        return __awaiter(this, void 0, void 0, function* () {
            if ((yield dataBaseConnect_1.collection.findOne({ login: user === null || user === void 0 ? void 0 : user.login })) !== null) {
                res.sendStatus(400);
                return;
            }
            user.items = [];
            user.lastItemsId = 0;
            bcrypt.hash(user.pass, 7).then((hashUserPassword) => __awaiter(this, void 0, void 0, function* () {
                user.pass = hashUserPassword;
                yield dataBaseConnect_1.collection.insertOne(user);
                res.send({ ok: true });
            }));
        });
    }
    checkUser(user, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const findUser = yield dataBaseConnect_1.collection.findOne({ login: user === null || user === void 0 ? void 0 : user.login });
            if (findUser !== null)
                bcrypt.compare(user.pass, findUser.pass).then((resultCheck) => {
                    resultCheck ? res.send({ ok: true }) : res.sendStatus(400);
                });
        });
    }
    logOut(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            req.session.destroy((err) => {
                res.clearCookie('uniqueSessionID').send({ ok: true });
            });
        });
    }
}
exports.default = new UserController();

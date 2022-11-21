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
class Controller {
    findItems(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            res.send(yield dataBaseConnect_1.collection.findOne(req.body.login));
        });
    }
    deleteItem(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const task = req.body.id;
            const login = req.body.login;
            let data = yield dataBaseConnect_1.collection.findOne(req.body.login);
            if (data !== null) {
                const resultOfDelete = yield dataBaseConnect_1.collection.updateOne(data, { $pull: { items: { id: task } } });
                return res.json({ ok: resultOfDelete.acknowledged });
            }
            res.sendStatus(404);
        });
    }
    addItems(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const task = req.body.text;
            let data = yield dataBaseConnect_1.collection.findOne(req.body.login);
            let lastId = (data.items.length);
            lastId++;
            if (data !== null) {
                yield dataBaseConnect_1.collection.updateOne(data, { $push: { items: { id: lastId, text: task, checked: false } } });
                return res.send({ id: lastId });
            }
            res.sendStatus(400);
        });
    }
    updateItems(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const task = req.body;
            let data = yield dataBaseConnect_1.collection.findOne(req.body.login);
            if (data !== null) {
                const resultUpd = yield dataBaseConnect_1.collection.updateOne(data, {
                    $set: {
                        'items.$[item].text': task.text,
                        'items.$[item].checked': task.checked,
                    }
                }, { arrayFilters: [{ "item.id": task.id }] });
                return res.json({ ok: resultUpd.acknowledged });
            }
            res.sendStatus(404);
        });
    }
}
exports.default = new Controller();

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
const DBModel = require('../model/DBModel');
const path = require('path');
const fileModel = require('../model/fileModel');
class adminControllers {
    addBook(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            Promise.all([fileModel.save(req.files), DBModel.addAtDatabase(req)])
                .then(() => res.redirect('/admin/api/v1/admin'))
                .catch((err) => {
                console.log(err);
                res.status(400).json({ error: "error save to DB! Check input" });
            });
        });
    }
    adminBooks(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const offset = req.query.offset ? +req.query.offset : 0;
            const count = req.query.count && +req.query.count < 5 ? +req.query.count : 5;
            const page = offset && offset !== 0 ? (offset / 5) + 1 : 1;
            DBModel.getFromDB(offset, count)
                .then((items) => res.render(path.resolve(__dirname, "../views", 'admin-page.ejs'), { items, page }))
                .catch((err) => {
                console.log(err);
                res.status(400).json({ error: "Some error. Check enter or try later" });
            });
        });
    }
    deleteBook(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            DBModel.deleteBook(req.query.id)
                .then(() => res.redirect('/admin/api/v1/admin/'))
                .catch((err) => {
                console.log(err);
                res.status(400).json({ error: "Error, cant delete" });
            });
        });
    }
}
module.exports = new adminControllers();

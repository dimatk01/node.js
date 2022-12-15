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
class userControllers {
    getBooks(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            if (req.query.search) {
                getBooksByName(req, res);
            }
            else {
                getBooksWithPagination(req, res);
            }
        });
    }
    getBook(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            DBModel.getBookByID(req.params.id)
                .then((item) => res.render(path.resolve(__dirname, "../views", 'book-page.ejs'), { item }))
                .catch((error) => {
                console.log(error);
                res.sendStatus(400);
            });
        });
    }
    addWantsCount(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            DBModel.updateWantsCount(req.params.id)
                .then(() => res.sendStatus(200))
                .catch((error) => {
                console.log(error);
                res.sendStatus(400);
            });
        });
    }
}
module.exports = new userControllers();
function getBooksWithPagination(req, res) {
    const offset = req.query.offset ? +req.query.offset : 0;
    const count = req.query.count && +req.query.count < 20 ? +req.query.count : 20;
    const page = offset && offset !== 0 ? (offset / 20) + 1 : 1;
    DBModel.getFromDB(offset, count)
        .then((items) => {
        res.render(path.resolve(__dirname, "../views", 'books-page.ejs'), { items, page });
    })
        .catch((error) => {
        console.log(error);
        res.sendStatus(400);
    });
}
function getBooksByName(req, res) {
    if (typeof req.query.search === 'string') {
        const searchData = req.query.search ? req.query.search : "";
        DBModel.searchBookByName(searchData)
            .then((items) => {
            res.render(path.resolve(__dirname, "../views", 'results-page.ejs'), { items, searchData });
        })
            .catch((error) => {
            console.log(error);
            res.sendStatus(400);
        });
    }
}

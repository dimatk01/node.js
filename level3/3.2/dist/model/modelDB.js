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
const mysql = require('mysql');
const pool = mysql.createPool({
    connectionLimit: 10,
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'library'
});
module.exports = {
    addAtDatabase: function (req) {
        var _a;
        return __awaiter(this, void 0, void 0, function* () {
            const dataBook = req.body;
            const book_img = (_a = req.files) === null || _a === void 0 ? void 0 : _a.book_img.name;
            return new Promise((resolve, reject) => {
                pool.query(`INSERT INTO books (book_name, book_authors, book_description, book_img, book_year, count_pages)  VALUES ('${dataBook === null || dataBook === void 0 ? void 0 : dataBook.book_name}', '${dataBook === null || dataBook === void 0 ? void 0 : dataBook.book_authors}', '${dataBook === null || dataBook === void 0 ? void 0 : dataBook.book_description}', '${book_img}', '${dataBook === null || dataBook === void 0 ? void 0 : dataBook.book_year}', '${dataBook === null || dataBook === void 0 ? void 0 : dataBook.count_pages}')`, function (error, results) {
                    console.log(error);
                    results ? resolve(true) : reject(false);
                });
            });
        });
    },
    getFromDB: function (offset, count) {
        return __awaiter(this, void 0, void 0, function* () {
            return new Promise((resolve, reject) => {
                pool.query(`SELECT * FROM books WHERE book_isDelete is null LIMIT ${offset}, ${count}`, function (error, results) {
                    results ? resolve(results) : reject(error);
                });
            });
        });
    },
    getBookByID: function (id) {
        return __awaiter(this, void 0, void 0, function* () {
            return new Promise((resolve, reject) => {
                pool.query(`SELECT * FROM books WHERE book_isDelete is null AND book_id = ${id}`, function (error, results) {
                    results ? resolve(results) : reject(error);
                });
            });
        });
    },
    deleteBook: function (id) {
        return __awaiter(this, void 0, void 0, function* () {
            return new Promise((resolve, reject) => {
                pool.query(`UPDATE books SET book_isDelete = ${Date.now()} WHERE book_id = ${id}`, function (error, results) {
                    results ? resolve(results) : reject(error);
                });
            });
        });
    }
};

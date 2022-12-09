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
var sqlQuery;
(function (sqlQuery) {
    sqlQuery["addBook"] = "INSERT INTO books SET book_name= ?, book_authors= ?, book_description= ?, book_img= ?, book_year= ?, count_pages= ?";
    sqlQuery["getBooks"] = "SELECT * FROM books WHERE book_isDelete is null LIMIT  ?, ?";
    sqlQuery["getBook"] = "SELECT * FROM books WHERE book_isDelete is null AND book_id =?";
    sqlQuery["addWantsCount"] = "UPDATE books SET book_views =?  WHERE book_id =?";
    sqlQuery["deleteBook"] = "UPDATE books SET book_isDelete = ? WHERE book_id =?";
    sqlQuery["updateWantsCount"] = "UPDATE books SET book_wants = ? WHERE book_id = ?";
    sqlQuery["search"] = "SELECT * FROM books WHERE book_isDelete is null AND book_name LIKE ?";
})(sqlQuery || (sqlQuery = {}));
module.exports = {
    addAtDatabase: function (req) {
        var _a;
        return __awaiter(this, void 0, void 0, function* () {
            const dataBook = req.body;
            const book_img = (_a = req.files) === null || _a === void 0 ? void 0 : _a.book_img.name;
            return new Promise((resolve, reject) => {
                pool.query(sqlQuery.addBook, [dataBook === null || dataBook === void 0 ? void 0 : dataBook.book_name, dataBook === null || dataBook === void 0 ? void 0 : dataBook.book_authors, dataBook === null || dataBook === void 0 ? void 0 : dataBook.book_description, book_img, dataBook === null || dataBook === void 0 ? void 0 : dataBook.book_year, dataBook === null || dataBook === void 0 ? void 0 : dataBook.count_pages], (error) => {
                    error ? reject(error) : resolve(true);
                });
            });
        });
    },
    getFromDB: function (offset, count) {
        return __awaiter(this, void 0, void 0, function* () {
            return new Promise((resolve, reject) => {
                pool.query(sqlQuery.getBooks, [offset, count], function (error, results) {
                    results ? resolve(results) : reject(error);
                });
            });
        });
    },
    getBookByID: function (id) {
        return __awaiter(this, void 0, void 0, function* () {
            return new Promise((resolve, reject) => {
                pool.query(sqlQuery.getBook, [id], (error, results) => __awaiter(this, void 0, void 0, function* () {
                    const res = yield addViewsCount(id, results[0].book_views);
                    results && res ? resolve(results) : reject(error);
                }));
            });
        });
    },
    deleteBook: function (id) {
        return __awaiter(this, void 0, void 0, function* () {
            return new Promise((resolve, reject) => {
                pool.query(sqlQuery.deleteBook, [Date.now(), id], function (error, results) {
                    results ? resolve(results) : reject(error);
                });
            });
        });
    },
    updateWantsCount: (id) => __awaiter(void 0, void 0, void 0, function* () {
        return new Promise((resolve, reject) => {
            pool.query(sqlQuery.getBook, [id], (error, results) => __awaiter(void 0, void 0, void 0, function* () {
                const wants = ++results[0].book_wants;
                pool.query(sqlQuery.updateWantsCount, [wants, id], function (error, results) {
                    results ? resolve(results) : reject(error);
                });
            }));
        });
    }),
    searchBookByName: (searchData) => __awaiter(void 0, void 0, void 0, function* () {
        console.log(searchData);
        return new Promise((resolve, reject) => {
            pool.query(sqlQuery.search, ["%" + searchData + "%"], function (error, results) {
                results ? resolve(results) : reject(error);
            });
        });
    })
};
function addViewsCount(id, book_views) {
    return __awaiter(this, void 0, void 0, function* () {
        return new Promise((resolve, reject) => {
            book_views = book_views ? ++book_views : 1;
            pool.query(sqlQuery.addWantsCount, [book_views, id], function (error) {
                error ? reject(error) : resolve(true);
            });
        });
    });
}

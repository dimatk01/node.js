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
const sqlQuery = require('../types/sql');
const pool = mysql.createPool({
    connectionLimit: 10,
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'library',
    multipleStatements: true
});
module.exports = {
    addAtDatabase: function (req) {
        var _a;
        return __awaiter(this, void 0, void 0, function* () {
            const data = req.body;
            const book_img = (_a = req.files) === null || _a === void 0 ? void 0 : _a.book_img.name;
            const book_id = yield addBook(data, book_img);
            const authors_id = yield addAuthors(data.book_authors.split(', '));
            yield addIn_book_authors(book_id, authors_id);
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
                pool.query(sqlQuery.deleteBook, [Date.now(), id, Date.now(), id], function (error, results) {
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
function addBook(data, book_img) {
    return new Promise((resolve, reject) => {
        pool.query(sqlQuery.addBook, [data === null || data === void 0 ? void 0 : data.book_name, data === null || data === void 0 ? void 0 : data.book_description, book_img, data === null || data === void 0 ? void 0 : data.book_year, data === null || data === void 0 ? void 0 : data.count_pages], (error, results) => {
            error ? reject(error) : resolve(results.insertId);
        });
    });
}
function addAuthors(book_authors) {
    return __awaiter(this, void 0, void 0, function* () {
        return yield book_authors.map((item) => __awaiter(this, void 0, void 0, function* () {
            const author = yield searchAuthor(item);
            if (author)
                return author;
            return addAuthor(item);
        }));
    });
}
function searchAuthor(item) {
    return new Promise((resolve, reject) => {
        pool.query(sqlQuery.searchAuthor, ["%" + item + "%"], function (error, results) {
            typeof results[0] !== 'undefined' ? resolve(results[0].author_id) : resolve('');
        });
    });
}
function addAuthor(item) {
    return new Promise((resolve, reject) => {
        pool.query(sqlQuery.addAuthor, [item], function (error, results) {
            error ? reject(error) : resolve(results.insertId);
        });
    });
}
function addIn_book_authors(book_id, authors_id) {
    return __awaiter(this, void 0, void 0, function* () {
        yield authors_id.map((item) => __awaiter(this, void 0, void 0, function* () {
            return new Promise((resolve, reject) => __awaiter(this, void 0, void 0, function* () {
                console.log(item);
                pool.query(sqlQuery.addBook_author, [book_id, yield item], function (error, results) {
                    console.log(error);
                });
            }));
        }));
    });
}

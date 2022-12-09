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
const fs = require('fs');
const connect = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'library'
});
connect.query("SELECT * FROM `migrations`", function (error, results) {
    return __awaiter(this, void 0, void 0, function* () {
        if (error)
            console.log(error);
        yield results.map((item) => __awaiter(this, void 0, void 0, function* () {
            if (item.migration_isDo !== 1) {
                const res = yield connect.query(fs.readFileSync('./' + item.migration_up, { encoding: 'utf8', flag: 'r' }), function (error, results) {
                    if (error)
                        console.log(error);
                    return true;
                });
                if (res)
                    yield connect.query(`UPDATE migrations SET migration_isDo = 1 WHERE ${item.migration_id}`, function (error, results) {
                        if (error)
                            console.log(error);
                    });
            }
        }));
        connect.end();
    });
});

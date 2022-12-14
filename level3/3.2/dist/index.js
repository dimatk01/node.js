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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const app = (0, express_1.default)();
const port = 3000;
const backup = require('./cronFiles/backup.js');
const softDelete = require('./cronFiles/softDelete.js');
const router = require('./routers/router.js');
const db = require('./model/DBModel.js');
var cors = require('cors');
const fileUpload = require('express-fileupload');
const cron = require('node-cron');
cron.schedule('46 16 * * *', () => __awaiter(void 0, void 0, void 0, function* () {
    backup.dump();
    softDelete();
}));
app.use(fileUpload());
app.use(cors({
    origin: true,
    credentials: true
}));
app.set('view engine', 'ejs');
app.use((express_1.default.static(`${__dirname}/views`)));
app.use(router);
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});

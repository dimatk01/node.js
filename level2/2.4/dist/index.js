"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const dataBaseConnect_1 = require("./controllers/dataBaseConnect");
const controllers_1 = __importDefault(require("./controllers/controllers"));
const UserController_1 = __importDefault(require("./controllers/UserController"));
const session = require('express-session');
const fs = require('fs');
const app = (0, express_1.default)();
const port = 3000;
const bodyParser = require('body-parser');
app.use(bodyParser.json({ limit: '50mb' }));
app.use('/', express_1.default.static('static'));
app.use(session({
    secret: 'someSecretWord',
    name: 'uniqueSessionID',
    resave: true,
    saveUninitialized: false,
    cookie: {
        maxAge: 2628000000,
    },
}));
app.post('/api/v2/router?', (req, res) => {
    const action = req.query.action;
    switch (action) {
        case 'login':
            if (!req.session.key)
                req.session.key = req.sessionID;
            return UserController_1.default.checkUser(req.body, res);
        case 'register': return UserController_1.default.addUser(req.body, res);
        case 'logout': return UserController_1.default.logOut(req, res);
        case 'getItems':
            if (req.session.key === req.sessionID)
                return controllers_1.default.findItems(req, res);
        case 'deleteItem':
            if (req.session.key === req.sessionID)
                return controllers_1.default.deleteItem(req, res);
        case 'createItem':
            if (req.session.key === req.sessionID)
                return controllers_1.default.addItems(req, res);
        case 'editItem':
            if (req.session.key === req.sessionID)
                return controllers_1.default.updateItems(req, res);
    }
});
(0, dataBaseConnect_1.dataBaseConnect)()
    .then(() => {
    app.listen(port, () => {
        console.log(`listening on port ${port}`);
    });
})
    .catch((error) => {
    console.error("Database connection failed", error);
});

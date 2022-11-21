import express, { Express } from 'express';
import { dataBaseConnect } from './controllers/dataBaseConnect';
import controllers from './controllers/controllers';
import UserController from './controllers/UserController';
const session = require('express-session')
export { Item } from "./types/types"
const fs = require('fs');
const app: Express = express()
const port: number = 3000
const bodyParser = require('body-parser');
app.use(bodyParser.json({ limit: '50mb' }));
app.use('/', express.static('static'))

app.use(
    session({
        secret: 'someSecretWord',
        name: 'uniqueSessionID',
        resave: true,
        saveUninitialized: false,
        cookie: {
            maxAge: 2628000000,
        },
    }));

declare module "express-session" {
    interface SessionData {
        key: string
    }
}

app.post('/api/v2/router?', (req, res) => {
    const action = req.query.action
    switch (action) {
        case 'login':
            if (!req.session.key) req.session.key = req.sessionID
            return UserController.checkUser(req.body, res);
        case 'register': return UserController.addUser(req.body, res);
        case 'logout': return UserController.logOut(req, res);
        case 'getItems':
            if (req.session.key === req.sessionID)
                return controllers.findItems(req, res);
        case 'deleteItem':
            if (req.session.key === req.sessionID)
                return controllers.deleteItem(req, res);
        case 'createItem':
            if (req.session.key === req.sessionID)
                return controllers.addItems(req, res)
        case 'editItem':
            if (req.session.key === req.sessionID)
                return controllers.updateItems(req, res)
    }
})

dataBaseConnect()
    .then(() => {
        app.listen(port, () => {
            console.log(`listening on port ${port}`)
        })
    })
    .catch((error: Error) => {
        console.error("Database connection failed", error);
    });

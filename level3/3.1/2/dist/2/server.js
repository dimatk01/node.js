"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express = require("express");
const bodyParser = require('body-parser');
const app = express();
const port = 3000;
app.use('/', express.static('static'));
var Button;
(function (Button) {
    Button["add"] = "add";
    Button["remove"] = "remove";
})(Button || (Button = {}));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
let countOfAdd = 0;
let countOfRemove = 0;
app.post('/', (req, res) => {
    const body = req.body;
    console.log(body);
    if (body.button === Button.add)
        res.send({ count: ++countOfAdd });
    else
        res.send({ count: ++countOfRemove });
});
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});

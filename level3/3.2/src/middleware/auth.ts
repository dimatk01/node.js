import { NextFunction, Request, Response } from "express"
require('dotenv').config()
var auth = require('basic-auth')
function authBasic(req: Request, res: Response, next: NextFunction) {
    var user = auth(req)
    if (!user ||
        user.name !== process.env.ADMIN_LOGIN ||
        user.pass !== process.env.ADMIN_PASS) {
        res.statusCode = 401
        res.setHeader('WWW-Authenticate', 'Basic realm="example"')
        res.end('Access denied')
    }
    next()
}
module.exports = authBasic;

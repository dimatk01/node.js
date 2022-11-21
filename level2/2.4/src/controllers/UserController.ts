import { collection } from './dataBaseConnect';
import { User } from '../types/types'
import { Request, Response } from 'express'
const bcrypt = require('bcrypt');
class UserController {
    async addUser(user: User, res: Response) {
        if (await collection.findOne({ login: user?.login }) !== null) {
            res.sendStatus(400)
            return
        }
        user.items = [];
        user.lastItemsId = 0
        bcrypt.hash(user.pass, 7).then(async (hashUserPassword: string) => {
            user.pass = hashUserPassword
            await collection.insertOne(user)
            res.send({ ok: true })
        });
    }
    async checkUser(user: User, res: Response) {
        const findUser = await collection.findOne({ login: user?.login })
        if (findUser !== null)
            bcrypt.compare(user.pass, findUser.pass).then((resultCheck: boolean) => {
                resultCheck ? res.send({ ok: true }) : res.sendStatus(400)
            });
    }
    async logOut(req: Request, res: Response) {
        req.session.destroy((err) => {
            res.clearCookie('uniqueSessionID').send({ ok: true })
        })
    }
}
export default new UserController()
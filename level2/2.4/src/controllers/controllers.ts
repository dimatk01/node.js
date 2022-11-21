import { collection } from './dataBaseConnect';
import { Item } from '../types/types'
import { Request, Response } from "express"

class Controller {
    async findItems(req: Request, res: Response) {
        res.send(await collection.findOne(req.body.login))
    }
    async deleteItem(req: Request, res: Response) {
        const task = req.body.id
        const login = req.body.login
        let data: any = await collection.findOne(req.body.login)
        if (data !== null) {
            const resultOfDelete = await collection.updateOne(data, { $pull: { items: { id: task } } })
            return res.json({ ok: resultOfDelete.acknowledged })
        }
        res.sendStatus(404)
    }
    async addItems(req: Request, res: Response) {
        const task = req.body.text;
        let data: any = await collection.findOne(req.body.login)
        let lastId: number = (data.items.length)
        lastId++
        if (data !== null) {
            await collection.updateOne(data, { $push: { items: { id: lastId, text: task, checked: false } } })
            return res.send({ id: lastId })
        }
        res.sendStatus(400)
    }
    async updateItems(req: Request, res: Response) {
        const task: Item = req.body
        let data: any = await collection.findOne(req.body.login)
        if (data !== null) {
            const resultUpd = await collection.updateOne(data, {
                $set: {
                    'items.$[item].text': task.text,
                    'items.$[item].checked': task.checked,
                }
            },
                { arrayFilters: [{ "item.id": task.id }] }
            )
            return res.json({ ok: resultUpd.acknowledged })
        }
        res.sendStatus(404)
    }
}

export default new Controller()



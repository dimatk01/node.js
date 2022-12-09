import { Request, Response } from "express";
import { Book } from "../types/Book";
const DBModel = require('../model/DBModel')
const path = require('path');
const fileModel = require('../model/fileModel')

class adminControllers {
  async addBook(req: Request, res: Response) {
    Promise.all([fileModel.save(req.files), DBModel.addAtDatabase(req)])
      .then(() => res.redirect('/admin/api/v1/admin'))
      .catch((err: string) => {
        console.log(err);
        res.status(400).json({ error: "error save to DB! Check input" })
      })
  }
  async adminBooks(req: Request, res: Response) {
    const offset: number = req.query.offset ? +req.query.offset : 0
    const count: number = req.query.count && +req.query.count < 5 ? +req.query.count : 5
    const page: number = offset && offset !== 0 ? (offset / 5) + 1 : 1;
    DBModel.getFromDB(offset, count)
      .then((items: Array<Book>) => res.render(path.resolve(__dirname, "../views", 'admin-page.ejs'), { items, page }))
      .catch((err: string) => {
        console.log(err);
        res.status(400).json({ error: "Some error. Check enter or try later" })
      })

  }
  async deleteBook(req: Request, res: Response) {
    DBModel.deleteBook(req.query.id)
      .then(() => res.redirect('/admin/api/v1/admin/'))
      .catch((err: string) => {
        console.log(err);
        res.status(400).json({ error: "Error, cant delete" })
      })
  }
}
module.exports = new adminControllers()
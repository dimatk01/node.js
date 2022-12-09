import { Request, Response } from "express";
import { Book } from "../types/Book";
const DBModel = require('../model/DBModel')
const path = require('path');

class userControllers {
  async getBooks(req: Request, res: Response) {
   if(req.query.search){
    getBooksByName(req,res)
   }else{
    getBooksWithPagination(req,res)
   }

  }
  async getBook(req: Request, res: Response) {
    DBModel.getBookByID(req.params.id)
      .then((item: Book) => res.render(path.resolve(__dirname, "../views", 'book-page.ejs'), { item }))
      .catch((error: string) => {
        console.log(error);
        res.sendStatus(400)
      })
  }
  async addWantsCount(req: Request, res: Response) {
    DBModel.updateWantsCount(req.params.id)
      .then(() => res.sendStatus(200))
      .catch((error: string) => {
        console.log(error);
        res.sendStatus(400)
      })
  }
}
module.exports = new userControllers()



function getBooksWithPagination(req:Request,res:Response) {
  const offset: number = req.query.offset ? +req.query.offset : 0
  const count: number = req.query.count && +req.query.count < 20 ? +req.query.count : 20
  const page = offset && offset !== 0 ? (offset / 20) + 1 : 1;
  DBModel.getFromDB(offset, count)
    .then((items: Book[]) => {
      res.render(path.resolve(__dirname, "../views", 'books-page.ejs'), { items, page })
    })
    .catch((error: string) => {
      console.log(error);
      res.sendStatus(400)
    })
}

function getBooksByName(req: Request, res: Response) {
  if(typeof req.query.search==='string'){
    const searchData: string = req.query.search?req.query.search:""
         DBModel.searchBookByName(searchData)
   .then((items: Book[]) => {
    console.log(items);
     res.render(path.resolve(__dirname, "../views", 'results-page.ejs'), { items, searchData })
   })
   .catch((error: string) => {
     console.log(error);
     res.sendStatus(400)
   })}
}


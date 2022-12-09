const mysql = require('mysql');
import { Book } from "../types/Book";
const pool = mysql.createPool({
    connectionLimit: 10,
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'library'
})
enum sqlQuery {
    addBook = `INSERT INTO books SET book_name= ?, book_authors= ?, book_description= ?, book_img= ?, book_year= ?, count_pages= ?`,
    getBooks = `SELECT * FROM books WHERE book_isDelete is null LIMIT  ?, ?`,
    getBook = 'SELECT * FROM books WHERE book_isDelete is null AND book_id =?',
    addWantsCount = 'UPDATE books SET book_views =?  WHERE book_id =?',
    deleteBook = 'UPDATE books SET book_isDelete = ? WHERE book_id =?',
    updateWantsCount  = `UPDATE books SET book_wants = ? WHERE book_id = ?`,
    search = 'SELECT * FROM books WHERE book_isDelete is null AND book_name LIKE ?',
}

module.exports = {
    addAtDatabase: async function (req: any) {
        const dataBook: Book = req.body
        const book_img = req.files?.book_img.name
        return new Promise<boolean | string>((resolve, reject) => {
            pool.query(sqlQuery.addBook,
                [dataBook?.book_name, dataBook?.book_authors, dataBook?.book_description, book_img, dataBook?.book_year, dataBook?.count_pages],
                (error: string) => {
                    error ? reject(error) : resolve(true);
                })
        })
    },
    getFromDB: async function (offset: number, count: number): Promise<Book[]> {
        return new Promise<Book[]>((resolve, reject) => {
            pool.query(sqlQuery.getBooks, [offset, count],
                function (error: string, results: Array<Book>) {
                    results ? resolve(results) : reject(error);
                })
        })
    },

    getBookByID: async function (id: string) {
        return new Promise<Book[] | boolean>((resolve, reject) => {
            pool.query(sqlQuery.getBook, [id],
                async (error: string, results: Book[]) => {
                    const res = await addViewsCount(id, results[0].book_views)
                    results && res ? resolve(results) : reject(error);
                })
        })
    },
    deleteBook: async function (id: string) {
        return new Promise<Book>((resolve, reject) => {
            pool.query(sqlQuery.deleteBook, [Date.now(),id],
                function (error: string, results: Book) {
                    results ? resolve(results) : reject(error);
                })
        })
    },

    updateWantsCount:async (id:number) => {
        return new Promise<Book>((resolve, reject) => {
            pool.query(sqlQuery.getBook, [id],
                async (error: string, results: Book[]) => {
                    const wants =++results[0].book_wants
            pool.query(sqlQuery.updateWantsCount, [wants, id],
                function (error: string, results: Book) {
                    results ? resolve(results) : reject(error);
                })
        })  })
    },
    searchBookByName:async(searchData:string)=>{
        console.log(searchData);
        
        return new Promise<Book[]>((resolve, reject) => {
            pool.query(sqlQuery.search, ["%"+searchData+"%"],
                function (error: string, results: Array<Book>) {
                    results ? resolve(results) : reject(error);
                })
        })
    }
}

async function addViewsCount(id: string, book_views: number | undefined) {
    return new Promise<boolean | string>((resolve, reject) => {
        book_views = book_views ? ++book_views : 1;
        pool.query(sqlQuery.addWantsCount, [book_views, id],
            function (error: string) {
                error ? reject(error) : resolve(true);
            })
    })

}


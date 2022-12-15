const mysql = require('mysql');
const sqlQuery = require('../types/sql')
import { Book } from "../types/Book";
const pool = mysql.createPool({
    connectionLimit: 10,
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'library',
    multipleStatements:true
})

module.exports = {
    addAtDatabase: async function (req: any) {
        const data: Book = req.body
        const book_img = req.files?.book_img.name
        const book_id = await addBook(data, book_img)
        const authors_id = await addAuthors(data.book_authors.split(', '))
        await addIn_book_authors(book_id, authors_id)

    },
    getFromDB: async function (offset: number, count: number): Promise<Book[]> {
        return new Promise<Book[]>((resolve, reject) => {
            pool.query(sqlQuery.getBooks, [offset, count],
                function (error: string, results: any) {
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
            pool.query(sqlQuery.deleteBook, [Date.now(), id,Date.now(), id],
                function (error: string, results: Book) {
                    results ? resolve(results) : reject(error);
                })
        })
    },

    updateWantsCount: async (id: number) => {
        return new Promise<Book>((resolve, reject) => {
            pool.query(sqlQuery.getBook, [id],
                async (error: string, results: Book[]) => {
                    const wants = ++results[0].book_wants
                    pool.query(sqlQuery.updateWantsCount, [wants, id],
                        function (error: string, results: Book) {
                            results ? resolve(results) : reject(error);
                        })
                })
        })
    },
    searchBookByName: async (searchData: string) => {
        return new Promise<Book[]>((resolve, reject) => {
            pool.query(sqlQuery.search, ["%" + searchData + "%"],
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

function addBook(data: Book, book_img: string) {
    return new Promise<number | string>((resolve, reject) => {
        pool.query(sqlQuery.addBook,
            [data?.book_name, data?.book_description, book_img, data?.book_year, data?.count_pages],
            (error: string, results: { insertId: number }) => {
                error ? reject(error) : resolve(results.insertId);
            })
    })
}

async function addAuthors(book_authors: string[]) {
    return await book_authors.map(async (item) => {
        const author = await searchAuthor(item)
        if (author)  return author
            return addAuthor(item);
    })
}

function searchAuthor(item: string) {
    return new Promise<string>((resolve, reject) => {
        pool.query(sqlQuery.searchAuthor, ["%" + item + "%"],
            function (error: string, results: [{ author_id: string }]) {
                typeof results[0] !== 'undefined' ? resolve(results[0].author_id) : resolve('');
            })
    })
}

function addAuthor(item: string) {
    return new Promise<string>((resolve, reject) => {
        pool.query(sqlQuery.addAuthor,
            [item],
            function (error: string, results: { insertId: string }) {
                error ? reject(error) : resolve(results.insertId);
            })
    })
}

async function addIn_book_authors(book_id: string | number, authors_id: Promise<string>[]) {
    await authors_id.map(async (item) => {
        return new Promise<string>(async (resolve, reject) => {
            console.log(item)
            pool.query(sqlQuery.addBook_author,
                [book_id, await item],
                function (error: string, results: { insertId: string }) {
                    console.log(error);
                })
        })
    })
}

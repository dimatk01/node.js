const mysql = require('mysql');
const fs = require('fs')
const connect = mysql.createPool({
    
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'library'
});
module.exports= function softDelete(){
   deleteFrom_books_authors()
    deleteFrom_books()
}
function deleteFrom_books() {
    return new Promise<string>((resolve, reject) => {
    connect.query(`DELETE  FROM books WHERE book_isDelete IS NOT NULL`,
    function <T>(error: string, results:string) {
    error? reject(error):
     resolve(results) 
    })})
}
function deleteFrom_books_authors() {
    return new Promise<string>((resolve, reject) => {
    connect.query(`DELETE  FROM books_authors WHERE book_isDelete IS NOT NULL`,
    function <T>(error: string, results:string) {
        error? reject(error):
        resolve(results) 
    })})
}


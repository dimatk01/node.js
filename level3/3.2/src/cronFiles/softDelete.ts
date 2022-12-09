const mysql = require('mysql');
const fs = require('fs')
const connect = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'library'
});
module.exports= function softDelete(){
    connect.query(`DELETE  FROM books WHERE book_isDelete IS NOT NULL`,
    function <T>(error: string, results: Array<T>) {
     if(error) console.log(error);
     return results
    })
}
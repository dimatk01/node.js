"use strict";
var sqlQuery;
(function (sqlQuery) {
    sqlQuery["addBook"] = "INSERT INTO books SET book_name= ?, book_description= ?, book_img= ?, book_year= ?, count_pages= ?";
    sqlQuery["addAuthor"] = "INSERT INTO authors SET author_name= ?";
    sqlQuery["addBook_author"] = "INSERT INTO books_authors SET book=?, author= ?";
    sqlQuery["getBooks"] = "SELECT *, GROUP_CONCAT(authors.author_name SEPARATOR ', ') as authors_names FROM books LEFT JOIN books_authors ON books.book_id = books_authors.book LEFT JOIN authors ON authors.author_id = books_authors.author WHERE books.book_isDelete IS NULL GROUP BY books.book_id LIMIT ?, ?";
    sqlQuery["getBook"] = "SELECT *, GROUP_CONCAT(authors.author_name SEPARATOR ', ') as authors_names FROM books LEFT JOIN books_authors ON books.book_id = books_authors.book LEFT JOIN authors ON authors.author_id = books_authors.author WHERE books.book_id = ? GROUP BY books.book_id";
    sqlQuery["addWantsCount"] = "UPDATE books SET book_views =?  WHERE book_id =?";
    sqlQuery["deleteBook"] = "UPDATE books_authors SET book_isDelete = ? WHERE book =?; UPDATE books SET book_isDelete = ? WHERE books.book_id =?";
    sqlQuery["updateWantsCount"] = "UPDATE books SET book_wants = ? WHERE book_id = ?";
    sqlQuery["search"] = "SELECT *, GROUP_CONCAT(authors.author_name SEPARATOR ', ') as authors_names FROM books LEFT JOIN books_authors ON books.book_id = books_authors.book LEFT JOIN authors ON authors.author_id = books_authors.author WHERE books_authors.book_isDelete IS NULL AND book_name LIKE   ? GROUP BY books.book_id";
    sqlQuery["searchAuthor"] = "SELECT * FROM authors WHERE author_name LIKE ?";
})(sqlQuery || (sqlQuery = {}));
module.exports = sqlQuery;

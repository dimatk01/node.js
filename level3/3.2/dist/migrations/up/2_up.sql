ALTER TABLE books DROP COLUMN book_authors; 

 CREATE TABLE authors (
 author_id  INTEGER PRIMARY KEY AUTO_INCREMENT,
 author_name VARCHAR(500) NOT NULL
);
 CREATE TABLE books_authors (
book INTEGER NOT NULL,
author INTEGER NOT NULL,
book_isDelete BIGINT,
FOREIGN KEY (book) REFERENCES books(book_id) ,
FOREIGN KEY (author) REFERENCES authors(author_id) 
);
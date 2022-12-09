CREATE TABLE books (
 book_id SERIAL PRIMARY KEY,
 book_name VARCHAR(300) NOT NULL,
 book_authors VARCHAR(300) NOT NULL,
 book_description TEXT,
 book_img VARCHAR(300),
 book_year VARCHAR(10) ,
 count_pages VARCHAR(5) ,
 book_views int DEFAULT 0,
book_wants int DEFAULT 0,
book_isDelete BIGINT
);
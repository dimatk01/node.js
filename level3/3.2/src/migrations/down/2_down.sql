 ALTER TABLE books ADD  COLUMN book_authors VARCHAR(300) NOT NULL;
 ALTER TABLE books ADD  COLUMN book_isDelete BIGINT;
DROP TABLE books_authors;
DROP TABLE authors;
USE bookshop;

DROP VIEW IF EXISTS books_with_user_disconts;
CREATE VIEW books_with_user_disconts AS 
SELECT 
	books.id AS book_id, 
	price - (price * books.discont / 100) - (price * promos.discont / 100), 
	users.id AS user_id  
FROM 
	books, 
	users 
		JOIN promos ON promos.id = users.promo_id;
	
	
DROP VIEW IF EXISTS audio_books;
CREATE VIEW audio_books AS
SELECT books.name, audio_metadata.duration, authors.first_name, authors.second_name 
FROM books 
	JOIN audio_metadata ON books.id = audio_metadata.book_id
	JOIN book_authors ON book_authors.book_id 
	JOIN authors ON authors.id = book_authors.author_id;

DROP VIEW IF EXISTS text_books;
CREATE VIEW text_books AS
SELECT books.name, text_metadata.page_count, authors.first_name, authors.second_name 
FROM books 
	JOIN text_metadata ON books.id = text_metadata.book_id
	JOIN book_authors ON book_authors.book_id 
	JOIN authors ON authors.id = book_authors.author_id;
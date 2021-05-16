USE bookshop;

-- количество книг по жанрам
SELECT genres.name, COUNT(*) 
	FROM books 
	JOIN book_genres ON books.id = book_genres.book_id
	JOIN genres ON book_genres.genre_id = genres.id
GROUP BY genres.name;

-- какие жанры издаются в этом году
SELECT genres.name, COUNT(*) AS cnt
	FROM books 		
	JOIN book_genres ON books.id = book_genres.book_id
	JOIN genres ON book_genres.genre_id = genres.id
	WHERE books.publication_year = YEAR(NOW())
GROUP BY genres.name
ORDER BY cnt DESC;

-- самый активный пользователь (по комеентариям)
SELECT email, COUNT(*) AS cnt
	FROM users
	JOIN comments ON users.id = comments.user_id
	GROUP BY email
	ORDER BY cnt DESC
	LIMIT 1;

-- самая комментируемая в этом году книга
SELECT books.name, COUNT(*) AS cnt
	FROM books 
	JOIN comments ON books.id = comments.book_id 
	WHERE YEAR(comments.created_at) = YEAR(NOW())
	GROUP BY books.name 
	ORDER BY cnt DESC
	LIMIT 1;

-- 10 самых продаваемых авторов
SELECT authors.second_name, COUNT(*) AS cnt
	FROM user_purchased_books
	JOIN books ON user_purchased_books.book_id = books.id 
	JOIN book_authors ON books.id = book_authors.book_id
	JOIN authors ON authors.id = book_authors.book_id 
	GROUP BY authors.second_name 
	ORDER BY cnt DESC
	LIMIT 10;

-- 10 самых рейтинговых книг в жанре фантастики
SELECT * 
	FROM books 
	JOIN book_genres ON books.id = book_genres.book_id
	JOIN genres ON genres.id = book_genres.genre_id 
	WHERE genres.name = 'фантастика'
	ORDER BY books.rating DESC 
	LIMIT 10;

-- самая дорогая книга с более чем 3 покупками
SELECT book_id, price 
FROM (
		SELECT book_id, count(*) AS cnt
		FROM user_purchased_books
		GROUP BY book_id 
	) AS purch
	JOIN books ON books.id = purch.book_id
	WHERE purch.cnt > 2
	ORDER BY price DESC
	LIMIT 1;
	
	
	
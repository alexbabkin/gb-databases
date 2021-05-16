USE bookshop;

DROP TRIGGER IF EXISTS delete_old_promos;
DELIMITER //
CREATE TRIGGER delete_old_promos AFTER INSERT ON promos
FOR EACH ROW
BEGIN 
	DELETE FROM promos WHERE available_until < NOW();
END //

DROP TRIGGER IF EXISTS delete_book_from_marked_after_purchasing;
DELIMITER //
CREATE TRIGGER delete_book_from_marked_after_purchasing AFTER INSERT ON user_purchased_books
FOR EACH ROW
BEGIN 
	DECLARE m_book_id INT;
	SET m_book_id = (SELECT id FROM user_marked_books WHERE user_id = NEW.user_id AND id = NEW.id);
	IF p_book_id IS NOT NULL THEN
		DELETE FROM user_marked_books WHERE id = m_book_id;
	END IF;
END //


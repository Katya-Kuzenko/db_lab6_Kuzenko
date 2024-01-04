-- після вставки нового відгуку оновлює рейтинг книги на основі цього відгуку

CREATE OR REPLACE FUNCTION update_book_rating() RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  UPDATE Book SET Rating = (
      SELECT AVG(Review_Rating::numeric) FROM Review
      WHERE Book_ID = NEW.Book_ID
  )
  WHERE Book.Book_ID = NEW.Book_ID;
  RETURN NEW;
END;
$$;

CREATE TRIGGER update_book_rating_trigger
AFTER INSERT OR UPDATE OR DELETE ON Review
FOR EACH ROW EXECUTE FUNCTION update_book_rating();

-- Додавання нового відгуку, що викличе спрацювання тригера
INSERT INTO Review (Review_ID, Sno, Review_Title, Review_Description, Review_Rating, Is_Verified, Date, Book_ID, Reviewer_ID)
VALUES (0000000006, 5, 'Excellent Book!', 'I really enjoyed reading this book. It deserves a high rating.', 5, true, '2024-01-04', 1000000001, 1);
-- Перевірка оновленого рейтингу книги
SELECT * FROM Book WHERE Book_ID = 1000000001;

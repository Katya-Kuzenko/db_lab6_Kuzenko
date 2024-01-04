-- Виклик процедури get_reviewer_info
CALL get_reviewer_info('Murderess Marbie');

-- Вставка нового відгуку, що викличе спрацювання тригера
INSERT INTO Review (Review_ID, Sno, Review_Title, Review_Description, Review_Rating, Is_Verified, Date, Book_ID, Reviewer_ID)
VALUES (0000000007, 5, 'Excellent Book!', 'I really enjoyed reading this book. It deserves a high rating.', 5, true, '2024-01-04', 1000000001, 1);

-- Перевірка оновленого рейтингу книги
SELECT * FROM Book WHERE Book_ID = 1000000001;

-- Виклик функції get_books_by_year
SELECT * FROM get_books_by_year(2023);
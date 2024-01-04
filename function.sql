-- повертає назву книги та її автора за роком випуску

CREATE OR REPLACE FUNCTION get_books_by_year(year_arg INT)
  RETURNS TABLE (book_title VARCHAR(350), author_name VARCHAR(100))
LANGUAGE plpgsql
AS $$
BEGIN
  RETURN QUERY
    SELECT b.Title AS book_title, b.Author AS author_name FROM Book b
    WHERE b.Year = year_arg;
END;
$$;
SELECT * FROM get_books_by_year(2023);
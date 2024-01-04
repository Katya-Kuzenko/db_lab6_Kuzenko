-- надає інформацію про рецензента (його відгук та для якої саме книги він призначений)

CREATE OR REPLACE PROCEDURE get_reviewer_info(reviewer_name_arg VARCHAR(100))
LANGUAGE plpgsql
AS $$
DECLARE
  review_title_var VARCHAR(500);
  book_title_var VARCHAR(350);
BEGIN
  SELECT r.Review_Title, b.Title INTO review_title_var, book_title_var 
  FROM Review r
    JOIN Reviewer rev ON r.Reviewer_ID = rev.Reviewer_ID
    JOIN Book b ON r.Book_ID = b.Book_ID
  WHERE rev.Reviewer_Name = reviewer_name_arg;

  RAISE INFO 'Reviewer Name: %, Review Title: %, Book Title: %',
             reviewer_name_arg, review_title_var, book_title_var;
END;
$$;

CALL get_reviewer_info('Murderess Marbie');

CREATE OR ALTER PROCEDURE bookHub.spInsertBook
  @authorName VARCHAR(100),
  @gender VARCHAR(20),
  @title VARCHAR(255),
  @publication_year CHAR(4),
  @price DECIMAL(10, 2)
AS
BEGIN
  DECLARE @author_Id INT,
  @gender_id INT;

  -- Verifica se o autor já existe
  SELECT @author_Id =
    CASE
      WHEN EXISTS (SELECT 1 FROM bookHub.Authors WHERE name = @authorName)
      THEN (SELECT author_Id FROM bookHub.Authors WHERE name = @authorName)
      ELSE NULL
    END;

  -- Se o autor não existir, realiza o insert
  IF @author_Id IS NULL
  BEGIN
    INSERT INTO bookHub.Authors (name)
    VALUES (@authorName);

    SET @author_Id = 
      (SELECT SCOPE_IDENTITY() AS newAuthorId);
  END;

  SELECT @gender_id = gender_id FROM bookHub.gender WHERE name LIKE '%'+@gender+'%';

  -- Insere o livro
  INSERT INTO bookHub.Books (gender, title, publication_year, price)
  VALUES (@gender_id, @title, @publication_year, @price);

  -- Associa o livro ao autor na tabela BookAuthors
  INSERT INTO bookHub.BookAuthors (book_id, author_Id)
  VALUES ((SELECT SCOPE_IDENTITY() AS newBookId), @author_Id);
END;





EXEC bookHub.spInsertBook 
  @authorName = 'Dante Alighieri', 
  @gender = 1, 
  @title = 'Divina Comédia', 
  @publication_year = '1304', 
  @price = 29.99





  SELECT * from bookHub.Books
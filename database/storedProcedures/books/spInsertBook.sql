
CREATE OR ALTER PROCEDURE bookHub.spInsertBook
  @authorName VARCHAR(100),
  @gender INT,
  @title VARCHAR(255),
  @publication_year DATETIME,
  @price DECIMAL(10, 2),
  @available BIT
AS
BEGIN
  DECLARE @author_Id INT;

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
    EXEC bookHub.spInsertAuthor @authorName

    -- INSERT INTO bookHub.Authors (name)
    -- VALUES (@authorName);

    -- SET @author_Id = 
    --   (SELECT SCOPE_IDENTITY() AS newAuthorId);
  END;

  -- Insere o livro
  INSERT INTO bookHub.Books (gender, title, publication_year, price, available)
  VALUES (@gender, @title, @publication_year, @price, @available);

  -- Associa o livro ao autor na tabela BookAuthors
  INSERT INTO bookHub.BookAuthors (book_id, author_Id)
  VALUES ((SELECT SCOPE_IDENTITY() AS newBookId), @author_Id);
END;

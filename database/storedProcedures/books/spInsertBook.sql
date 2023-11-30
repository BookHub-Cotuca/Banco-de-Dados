
CREATE OR ALTER PROCEDURE bookHub.spInsertBook
  @authorName VARCHAR(100),
  @gender VARCHAR(20),
  @title VARCHAR(255),
  @publication_year CHAR(4),
  @price DECIMAL(10, 2)
AS
BEGIN
  BEGIN TRAN
  BEGIN TRY
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

    COMMIT TRAN;
  END TRY
  BEGIN CATCH 
      ROLLBACK TRAN;
  END CATCH
END;

EXEC bookHub.spInsertBook 
  @authorName = 'Jane Austen', 
  @gender = 'Romance', 
  @title = 'Orgulho e Preconceito', 
  @publication_year = '1813', 
  @price = 24.99


EXEC bookHub.spInsertBook 
  @authorName = 'Isaac Asimov', 
  @gender = 'Ficção Científica', 
  @title = 'Eu, Robô', 
  @publication_year = '1950', 
  @price = 22.99


EXEC bookHub.spInsertBook 
  @authorName = 'Eric Hobsbawm', 
  @gender = 'História', 
  @title = 'A Era das Revoluções', 
  @publication_year = '1962', 
  @price = 28.99


EXEC bookHub.spInsertBook 
  @authorName = 'Agatha Christie', 
  @gender = 'Mistério', 
  @title = 'O Assassinato no Expresso Oriente', 
  @publication_year = '1934', 
  @price = 25.99


EXEC bookHub.spInsertBook 
  @authorName = 'Jules Verne', 
  @gender = 'Aventura', 
  @title = 'Vinte Mil Léguas Submarinas', 
  @publication_year = '1870', 
  @price = 26.99


EXEC bookHub.spInsertBook 
  @authorName = 'Walter Isaacson', 
  @gender = 'Biografia', 
  @title = 'Steve Jobs', 
  @publication_year = '2011', 
  @price = 30.99


EXEC bookHub.spInsertBook 
  @authorName = 'Pablo Neruda', 
  @gender = 'Poesia', 
  @title = 'Cem Sonetos de Amor', 
  @publication_year = '1959', 
  @price = 20.99


EXEC bookHub.spInsertBook 
  @authorName = 'Dale Carnegie', 
  @gender = 'Autoajuda', 
  @title = 'Como Fazer Amigos e Influenciar Pessoas', 
  @publication_year = '1936', 
  @price = 23.99


EXEC bookHub.spInsertBook 
  @authorName = 'Tennessee Williams', 
  @gender = 'Drama', 
  @title = 'Um Bonde Chamado Desejo', 
  @publication_year = '1947', 
  @price = 32.99


EXEC bookHub.spInsertBook 
  @authorName = 'George Orwell', 
  @gender = 'Ficção Científica', 
  @title = '1984', 
  @publication_year = '1949', 
  @price = 27.99

EXEC bookHub.spInsertBook 
  @authorName = 'J.K. Rowling', 
  @gender = 'Fantasia',  
  @title = 'Harry Potter e a Pedra Filosofal', 
  @publication_year = '1997', 
  @price = 34.99

EXEC bookHub.spInsertBook 
  @authorName = 'Gabriel Garcia Marquez', 
  @gender = 'Romance', 
  @title = 'Cem Anos de Solidão', 
  @publication_year = '1967', 
  @price = 29.99

EXEC bookHub.spInsertBook 
  @authorName = 'Isabel Allende', 
  @gender = 'Romance', 
  @title = 'A Casa dos Espíritos', 
  @publication_year = '1982', 
  @price = 26.99

EXEC bookHub.spInsertBook 
  @authorName = 'Arthur C. Clarke', 
  @gender = 'Ficção Científica', 
  @title = '2001: Uma Odisseia no Espaço', 
  @publication_year = '1968', 
  @price = 31.99

EXEC bookHub.spInsertBook 
  @authorName = 'Haruki Murakami', 
  @gender = 'Ficção',  
  @title = 'Norwegian Wood', 
  @publication_year = '1987', 
  @price = 22.99

EXEC bookHub.spInsertBook 
  @authorName = 'Charles Dickens', 
  @gender = 'Clássico', 
  @title = 'Grandes Esperanças', 
  @publication_year = '1861', 
  @price = 30.99

EXEC bookHub.spInsertBook 
  @authorName = 'Stephen King', 
  @gender = 'Terror',  
  @title = 'O Iluminado', 
  @publication_year = '1977', 
  @price = 35.99

EXEC bookHub.spInsertBook 
  @authorName = 'Kazuo Ishiguro', 
  @gender = 'Drama', 
  @title = 'Os Despojados', 
  @publication_year = '2010', 
  @price = 33.99



SELECT * FROM bookHub.books





  
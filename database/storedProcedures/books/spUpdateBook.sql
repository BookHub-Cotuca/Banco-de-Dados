CREATE OR ALTER PROCEDURE bookHub.spUpdateBook
  @bookId INT,
  @newTitle VARCHAR(255),
  @newAuthorName VARCHAR(100),
  @newGenreName VARCHAR(20),
  @newPublicationYear CHAR(4),
  @newAvailable BIT,
  @newPrice DECIMAL(10, 2)
AS
BEGIN
    BEGIN TRAN
  -- Update authors table
    DECLARE 
    @authorId INT, 
    @genreId INT;
    
    SELECT @authorId = author_id FROM bookHub.authors WHERE name = @newAuthorName;
    IF @authorId IS NULL
    BEGIN
        INSERT INTO bookHub.Authors (name)
        VALUES (@newAuthorName);
        SET @authorId = (SELECT SCOPE_IDENTITY() AS newAuthorId);
    END;

    -- Update gender table
    SELECT @genreId = gender_id FROM bookHub.gender WHERE name = @newGenreName;
    IF @genreId IS NULL
    BEGIN
        ROLLBACK TRAN;
        THROW 51000, 'Gênero não encontrado',1;
        RETURN;
    END;
    
    -- Update books table
    UPDATE bookHub.books
    SET
        title = @newTitle,
        gender = @genreId,
        publication_year = @newPublicationYear,
        available = @newAvailable,
        price = @newPrice
    WHERE
        book_id = @bookId;

    -- Update bookAuthors table
    UPDATE bookHub.bookAuthors
    SET
        author_id = @authorId
    WHERE
        book_id = @bookId;

        COMMIT TRAN
END;

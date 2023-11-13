CREATE OR ALTER PROCEDURE bookHub.spDeleteBook
  @book_id INT
AS
BEGIN
    BEGIN TRAN
    BEGIN TRY
        DELETE FROM bookHub.BookAuthors WHERE book_id = @book_id;

        DELETE FROM bookHub.Books WHERE book_id = @book_id;
        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        THROW 51000,'Delete Error',1
    END CATCH
END;
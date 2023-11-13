CREATE OR ALTER PROCEDURE UpdateAuthor
  @author_Id INT,
  @name VARCHAR(100)
AS
BEGIN
  BEGIN TRAN
  BEGIN TRY
    UPDATE bookHub.Authors
    SET name = @name
    WHERE author_Id = @author_Id;
    COMMIT
  END TRY
  BEGIN CATCH
    ROLLBACK TRAN;
    THROW 51000,'Update Error',1
  END CATCH
END;
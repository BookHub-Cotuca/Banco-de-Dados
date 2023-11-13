CREATE OR ALTER PROCEDURE bookHub.spDeleteAuthor
  @author_Id INT
AS
BEGIN
    BEGIN TRAN
    BEGIN TRY
        DELETE FROM bookHub.Authors
        WHERE author_Id = @author_Id;
        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        THROW 51000,'Delete error',1
    END CATCH
END;
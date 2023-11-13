CREATE OR ALTER PROCEDURE bookHub.spInsertAuthor
  @name VARCHAR(100)
AS
BEGIN
    BEGIN TRAN
    BEGIN TRY
        INSERT INTO bookHub.Authors (name)
        VALUES (@name);
        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        THROW 51000,'Insert Error',1
    END CATCH
END;


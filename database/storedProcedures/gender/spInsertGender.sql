CREATE OR ALTER PROCEDURE bookHub.spInsertGender
  @name VARCHAR(20)
AS
BEGIN
    BEGIN TRAN
    BEGIN TRY
        INSERT INTO bookHub.Gender (name)
        VALUES (@name);
        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        THROW 51000,'Insert Error',1
    END CATCH
END;
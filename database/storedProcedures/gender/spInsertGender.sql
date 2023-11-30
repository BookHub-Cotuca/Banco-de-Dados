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

EXEC bookHub.spInsertGender
    @name = "Romance"

    EXEC bookHub.spInsertGender
    @name = "Ficção Científica"

    EXEC bookHub.spInsertGender
    @name = "História"

    EXEC bookHub.spInsertGender
    @name = "Mistério"

    EXEC bookHub.spInsertGender
    @name = "Aventura"

EXEC bookHub.spInsertGender
    @name = "Biografia"

EXEC bookHub.spInsertGender
    @name = "Poesia"

EXEC bookHub.spInsertGender
    @name = "Autoajuda"

EXEC bookHub.spInsertGender
    @name = "Drama"




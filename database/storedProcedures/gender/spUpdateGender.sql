CREATE OR ALTER PROCEDURE bookHub.spUpdateGender
  @gender_id INT,
  @name VARCHAR(20)
AS
BEGIN
    BEGIN TRAN
    BEGIN TRY
        UPDATE bookHub.Gender
        SET name = @name
        WHERE gender_id = @gender_id;
        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        THROW 51000,'Update Error',1
    END CATCH
END;

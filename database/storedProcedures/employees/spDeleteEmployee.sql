CREATE PROCEDURE bookHub.spDeleteEmployee
  @fun_id INT
AS
BEGIN
    BEGIN TRAN
    BEGIN TRY
        DELETE FROM bookHub.Employees
        WHERE fun_id = @fun_id;
        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        THROW 51000,'Delete error',1;
    END CATCH
END;
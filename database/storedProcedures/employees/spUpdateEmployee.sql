CREATE OR ALTER PROCEDURE bookHub.UpdateEmployee
  @fun_id INT,
  @first_name VARCHAR(50),
  @last_name VARCHAR(50),
  @email VARCHAR(100),
  @password CHAR(64)
AS
BEGIN
    BEGIN TRAN 
    BEGIN TRY
        UPDATE bookHub.Employees
        SET first_name = @first_name,
            last_name = @last_name,
            email = @email,
            password = @password
        WHERE fun_id = @fun_id;
        COMMIT TRAN
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        THROW 51000,'Update Error',1
    END CATCH
END;
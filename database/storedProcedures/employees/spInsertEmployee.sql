CREATE OR ALTER PROCEDURE bookHub.spInsertEmployee
  @first_name VARCHAR(50),
  @last_name VARCHAR(50),
  @email VARCHAR(100),
  @password CHAR(64)
AS
BEGIN
    BEGIN TRAN
    BEGIN TRY 
        INSERT INTO bookHub.Employees (first_name, last_name, email, password)
        VALUES (@first_name, @last_name, @email, @password);
        COMMIT TRAN
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        THROW 51000,'Insertion Error.',1;
    END CATCH
END;

EXEC bookHub.spInsertEmployee
  @first_name = "Vitor",
  @last_name = "Henrique",
  @email = "teste@gmail.com",
  @password= "12345"
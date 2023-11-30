CREATE OR ALTER PROCEDURE bookHub.spAuthEmployee 
    @email VARCHAR(100),
    @senha CHAR(64)
AS
BEGIN
  SET NOCOUNT ON;
  SELECT COUNT(*) AS EXIST FROM bookHub.vAuthEmployee WHERE email = @email and password = @senha;
END;
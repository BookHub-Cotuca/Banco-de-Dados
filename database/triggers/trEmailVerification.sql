CREATE TRIGGER trEmailVerification
ON bookHub.Employees
FOR INSERT, UPDATE
AS 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM INSERTED WHERE email LIKE '%@%' and email like '%.com')
    BEGIN
        ROLLBACK TRANSACTION;
        THROW 51000,'Invalid Email',1;
    END
END;
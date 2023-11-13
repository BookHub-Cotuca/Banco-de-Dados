CREATE TRIGGER trPriceVerification
ON bookHub.books 
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE 
    @price money

    SELECT @price = price FROM INSERTED 

    IF (@price < 0)
    BEGIN
        ROLLBACK TRAN;
        THROW 51000,'Price error',1
    END
END

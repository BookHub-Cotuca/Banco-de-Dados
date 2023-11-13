ALTER TABLE bookHub.Employees NOCHECK CONSTRAINT ALL;
ALTER TABLE bookHub.Authors NOCHECK CONSTRAINT ALL;
ALTER TABLE bookHub.Gender NOCHECK CONSTRAINT ALL;
ALTER TABLE bookHub.Books NOCHECK CONSTRAINT ALL;
ALTER TABLE bookHub.Books NOCHECK CONSTRAINT ALL;


-- Exclusão dos dados da tabela bookHub.user
DELETE FROM bookHub.Employees;

-- Exclusão dos dados da tabela bookHub.Authors
DELETE FROM bookHub.Authors;

-- Exclusão dos dados da tabela bookHub.Gender
DELETE FROM bookHub.Gender;

-- Exclusão dos dados da tabela bookHub.Books
DELETE FROM bookHub.Books;

-- Exclusão dos dados da tabela bookHub.BookAuthors
DELETE FROM bookHub.BookAuthors;


-- Habilitar as restrições de chave estrangeira novamente
ALTER TABLE bookHub.Employees WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE bookHub.Authors WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE bookHub.Gender WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE bookHub.Books WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE bookHub.BookAuthors WITH CHECK CHECK CONSTRAINT ALL;


--Comando para apaagar as Tabelas

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[bookHub].[Gender]') AND type in (N'U'))
DROP TABLE [bookHub].[Gender]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[bookHub].[Authors]') AND type in (N'U'))
DROP TABLE [bookHub].[Authors]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[bookHub].[Employees]') AND type in (N'U'))
DROP TABLE [bookHub].[Employees]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[bookHub].[Books]') AND type in (N'U'))
DROP TABLE [bookHub].[Books]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[bookHub].[BookAuthors]') AND type in (N'U'))
DROP TABLE [bookHub].[BookAuthors]
GO
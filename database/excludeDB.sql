ALTER TABLE bookHub.employees NOCHECK CONSTRAINT ALL;
ALTER TABLE bookHub.authors NOCHECK CONSTRAINT ALL;
ALTER TABLE bookHub.gender NOCHECK CONSTRAINT ALL;
ALTER TABLE bookHub.books NOCHECK CONSTRAINT ALL;
ALTER TABLE bookHub.bookAuthors NOCHECK CONSTRAINT ALL;


-- Exclusão dos dados da tabela bookHub.user
DELETE FROM bookHub.employees;

-- Exclusão dos dados da tabela bookHub.authors
DELETE FROM bookHub.authors;

-- Exclusão dos dados da tabela bookHub.gender
DELETE FROM bookHub.gender;

-- Exclusão dos dados da tabela bookHub.books
DELETE FROM bookHub.books;

-- Exclusão dos dados da tabela bookHub.bookAuthors
DELETE FROM bookHub.bookAuthors;


-- Habilitar as restrições de chave estrangeira novamente
ALTER TABLE bookHub.employees WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE bookHub.authors WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE bookHub.gender WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE bookHub.books WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE bookHub.bookAuthors WITH CHECK CHECK CONSTRAINT ALL;


--Comando para apaagar as Tabelas

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[bookHub].[gender]') AND type in (N'U'))
DROP TABLE [bookHub].[gender]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[bookHub].[authors]') AND type in (N'U'))
DROP TABLE [bookHub].[authors]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[bookHub].[employees]') AND type in (N'U'))
DROP TABLE [bookHub].[employees]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[bookHub].[books]') AND type in (N'U'))
DROP TABLE [bookHub].[books]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[bookHub].[bookAuthors]') AND type in (N'U'))
DROP TABLE [bookHub].[bookAuthors]
GO
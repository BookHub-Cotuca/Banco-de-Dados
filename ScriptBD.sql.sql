CREATE SCHEMA library;

-- Tabela de Funcionários (Employees)
CREATE TABLE library.Employees (
  fun_id INT PRIMARY KEY,                 -- Identificador único do funcionário
  first_name VARCHAR(50) NOT NULL,        -- Primeiro nome do funcionário (não pode ser nulo)
  last_name VARCHAR(50) NOT NULL,         -- Sobrenome do funcionário (não pode ser nulo)
  email VARCHAR(100) UNIQUE NOT NULL,     -- Email do funcionário (único e não pode ser nulo)
  password VARCHAR(255) NOT NULL         -- Senha do funcionário (não pode ser nula)
);

-- Tabela de Autores (Authors)
CREATE TABLE library.Authors (
  author_Id INT PRIMARY KEY,             -- Identificador único do autor
  name VARCHAR(100) NOT NULL            -- Nome do autor (não pode ser nulo)
);

-- Tabela de Gênero (Gender)
CREATE TABLE library.Gender (
  gender_id INT PRIMARY KEY,             -- Identificador único do gênero
  name VARCHAR(20) NOT NULL             -- Nome do gênero (não pode ser nulo)
);

-- Tabela de Livros (Books) com chaves estrangeiras
CREATE TABLE library.Books (
  book_id INT PRIMARY KEY,               -- Identificador único do livro
  gender INT,                            -- Chave estrangeira para o gênero
  title VARCHAR(255) NOT NULL,           -- Título do livro (não pode ser nulo)
  publication_year DATETIME,             -- Ano de publicação do livro
  price DECIMAL(10, 2) NOT NULL,                  -- Preço do livro
  available BIT,                         -- Indicador de disponibilidade do livro
  FOREIGN KEY (gender) REFERENCES Gender (gender_id)  -- Chave estrangeira para o gênero
);

-- Tabela de Junção para associar livros a autores (BookAuthors)
CREATE TABLE library.BookAuthors (
  book_id INT,                           -- Chave estrangeira para o livro
  author_Id INT,                         -- Chave estrangeira para o autor
  PRIMARY KEY (book_id, author_Id),      -- Chave primária composta
  FOREIGN KEY (book_id) REFERENCES Books (book_id),    -- Chave estrangeira para o livro
  FOREIGN KEY (author_Id) REFERENCES Authors (author_Id)  -- Chave estrangeira para o autor
);

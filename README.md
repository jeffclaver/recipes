Para rodar o backend, os scripts do banco de dados é:

CREATE DATABASE recipes

CREATE TABLE receitas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    texto_receita TEXT NOT NULL
);

CREATE DATABASE foods;
USE foods;

CREATE TABLE recipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(70),
    prepTime INT,
    difficulty VARCHAR(20),
    serving INT,
    introPlate TEXT,
    ingredients TEXT,
    steps TEXT,
    imagePath VARCHAR(255)
);
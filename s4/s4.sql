-- Crear base de datos
CREATE DATABASE IF NOT EXISTS TECP0013ADDAOL2112;

-- Eliminar base de datos
DROP Database TECP0013ADDAOL2112;

USE TECP0013ADDAOL2112;

-- Crear tabla usuarios
CREATE TABLE IF NOT EXISTS users (
	id INT PRIMARY KEY,
    genero VARCHAR(1),
    edad INT,
    ocup INT,
    cp VARCHAR(20)
);

-- Eliminar tabla
DROP Database PruebaAndres;

-- Reto 1
-- Movies
CREATE TABLE IF NOT EXISTS movies (
	id INT PRIMARY KEY,
    title VARCHAR(80),
    genero VARCHAR(80)
);

-- Ratings
CREATE TABLE IF NOT EXISTS ratings (
	user_id INT,
    movie_id INT,
    rating INT,
    time_stamp BIGINT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

-- Ejemplo 3
Select count(*) from users;

-- Reto 2

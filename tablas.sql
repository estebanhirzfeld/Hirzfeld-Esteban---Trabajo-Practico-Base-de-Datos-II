-- Creacion de tablas

USE `videoclub`;

-- Tabla Generos 
CREATE TABLE
  `Generos` (
    `genero_id` INT PRIMARY KEY AUTO_INCREMENT,
    `nombre` VARCHAR(50) NOT NULL UNIQUE
  );

-- Tabla Actores
CREATE TABLE
  `Actores` (
    `actor_id` INT PRIMARY KEY AUTO_INCREMENT,
    `nombre` VARCHAR(50) NOT NULL,
    `apellido` VARCHAR(50) NOT NULL,
    `fecha_nacimiento` DATE NULL
  );

-- Tabla Socios
CREATE TABLE
  `Socios` (
    `socio_id` INT PRIMARY KEY AUTO_INCREMENT,
    `nombre` VARCHAR(50) NOT NULL,
    `apellido` VARCHAR(50) NOT NULL,
    `direccion` VARCHAR(150),
    `telefono` VARCHAR(20) UNIQUE,
    `email` VARCHAR(100) UNIQUE,
    `fecha_registro` DATE NOT NULL
  );

-- Tabla Peliculas (Relación 1:N con Generos)
CREATE TABLE
  `Peliculas` (
    `pelicula_id` INT PRIMARY KEY AUTO_INCREMENT,
    `titulo` VARCHAR(100) NOT NULL,
    `director` VARCHAR(100),
    `anio_lanzamiento` INT,
    `duracion_min` INT,
    `sinopsis` TEXT,
    `genero_id` INT,
    FOREIGN KEY (`genero_id`) REFERENCES `Generos` (`genero_id`)
  );

-- Tabla Peliculas_Actores (Relación N:M entre Peliculas y Actores) 
CREATE TABLE
  `Peliculas_Actores` (
    `pelicula_actor_id` INT PRIMARY KEY AUTO_INCREMENT,
    `pelicula_id` INT NOT NULL,
    `actor_id` INT NOT NULL,
    FOREIGN KEY (`pelicula_id`) REFERENCES `Peliculas` (`pelicula_id`),
    FOREIGN KEY (`actor_id`) REFERENCES `Actores` (`actor_id`),
    UNIQUE KEY `uq_pelicula_actor` (`pelicula_id`, `actor_id`) -- Evita duplicados
  );

-- Tabla Copias (Relación 1:N con Peliculas)
CREATE TABLE
  `Copias` (
    `copia_id` INT PRIMARY KEY AUTO_INCREMENT,
    `pelicula_id` INT NOT NULL,
    `formato` VARCHAR(20) DEFAULT 'DVD', 
    `disponible` BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (`pelicula_id`) REFERENCES `Peliculas` (`pelicula_id`)
  );

-- Tabla Alquileres (Relación 1:N con Copias y Socios)
CREATE TABLE
  `Alquileres` (
    `alquiler_id` INT PRIMARY KEY AUTO_INCREMENT,
    `copia_id` INT NOT NULL,
    `socio_id` INT NOT NULL,
    `fecha_alquiler` DATE NOT NULL,
    `fecha_devolucion_prevista` DATE NOT NULL,
    `fecha_devolucion_real` DATE NULL, -- NULL si no ha sido devuelta
    `costo_alquiler` FLOAT NOT NULL,
    FOREIGN KEY (`copia_id`) REFERENCES `Copias` (`copia_id`),
    FOREIGN KEY (`socio_id`) REFERENCES `Socios` (`socio_id`)
  );
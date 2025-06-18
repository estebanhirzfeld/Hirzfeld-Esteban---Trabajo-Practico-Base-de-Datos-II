-- Modificaciones de datos
-- Socios
UPDATE `Socios` SET `telefono` = '11-5555-9999', `direccion` = 'Av. de Mayo 555' WHERE `socio_id` = 1;
UPDATE `Socios` SET `email` = 'carlitos_rdz@email.com' WHERE `socio_id` = 3;

-- Peliculas
UPDATE `Peliculas` SET `anio_lanzamiento` = 1998, `sinopsis` = 'Un programador de computadoras descubre que el mundo que percibe es una realidad simulada.' WHERE `pelicula_id` = 3;
UPDATE `Peliculas` SET `director` = 'James Gunn' WHERE `titulo` = 'Guardians of the Galaxy';

-- Actores
UPDATE `Actores` SET `fecha_nacimiento` = '1964-09-03' WHERE `actor_id` = 6;
UPDATE `Actores` SET `nombre` = 'Robert' WHERE `nombre` = 'Roberto'; -- Suponiendo un error de tipeo

-- Copias
UPDATE `Copias` SET `disponible` = FALSE WHERE `copia_id` = 1;
UPDATE `Copias` SET `formato` = '4K Ultra HD' WHERE `copia_id` = 2;

-- Alquileres
UPDATE `Alquileres` SET `fecha_devolucion_real` = '2024-05-14' WHERE `alquiler_id` = 1;
UPDATE `Alquileres` SET `costo_alquiler` = 1650.50 WHERE `alquiler_id` = 10;

-- Generos
UPDATE `Generos` SET `nombre` = 'Sci-Fi' WHERE `genero_id` = 1;
UPDATE `Generos` SET `nombre` = 'Thriller' WHERE `genero_id` = 8;

-- Peliculas_Actores
UPDATE `Peliculas_Actores` SET `actor_id` = 11 WHERE `pelicula_actor_id` = 4;
UPDATE `Peliculas_Actores` SET `pelicula_id` = 8 WHERE `pelicula_actor_id` = 2;
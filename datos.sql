-- Datos 
-- Generos
INSERT INTO `Generos` (`nombre`) VALUES
('Ciencia Ficción'), ('Comedia'), ('Drama'), ('Terror'), ('Acción'),
('Aventura'), ('Fantasía'), ('Suspenso'), ('Animación'), ('Crimen');

-- Actores
INSERT INTO `Actores` (`nombre`, `apellido`, `fecha_nacimiento`) VALUES
('Tom', 'Hanks', '1956-07-09'),
('Leonardo', 'DiCaprio', '1974-11-11'),
('Scarlett', 'Johansson', '1984-11-22'),
('Robert', 'Downey Jr.', '1965-04-04'),
('Meryl', 'Streep', '1949-06-22'),
('Keanu', 'Reeves', '1964-09-02'),
('Zoe', 'Saldana', '1978-06-19'),
('Chris', 'Pratt', '1979-06-21'),
('Cillian', 'Murphy', '1976-05-25'),
('Margot', 'Robbie', '1990-07-02'),
('Brad', 'Pitt', '1963-12-18');

-- Socios
INSERT INTO `Socios` (`nombre`, `apellido`, `direccion`, `telefono`, `email`, `fecha_registro`) VALUES
('Juan', 'Perez', 'Av. Rivadavia 1234', '11-5555-1001', 'juan.perez@email.com', '2023-01-15'),
('Maria', 'Gomez', 'Calle Falsa 123', '11-5555-1002', 'maria.gomez@email.com', '2023-02-20'),
('Carlos', 'Rodriguez', 'Belgrano 567', '11-5555-1003', 'carlos.r@email.com', '2023-03-10'),
('Ana', 'Martinez', 'San Martin 890', '11-5555-1004', 'ana.martinez@email.com', '2023-04-05'),
('Luis', 'Fernandez', 'Corrientes 2345', '11-5555-1005', 'luis.f@email.com', '2023-05-12'),
('Laura', 'Lopez', 'Cordoba 3456', '11-5555-1006', 'laura.lopez@email.com', '2023-06-18'),
('Pedro', 'Sanchez', 'Santa Fe 4567', '11-5555-1007', 'pedro.s@email.com', '2023-07-22'),
('Sofia', 'Diaz', 'Pueyrredon 1122', '11-5555-1008', 'sofia.diaz@email.com', '2023-08-30'),
('Diego', 'Alvarez', '9 de Julio 789', '11-5555-1009', 'diego.a@email.com', '2023-09-14'),
('Valentina', 'Romero', 'Guemes 555', '11-5555-1010', 'valentina.r@email.com', '2023-10-25');

-- Peliculas
INSERT INTO `Peliculas` (`titulo`, `director`, `anio_lanzamiento`, `duracion_min`, `sinopsis`, `genero_id`) VALUES
('Forrest Gump', 'Robert Zemeckis', 1994, 142, 'La historia de un hombre con un IQ bajo pero buenas intenciones.', 3),
('Inception', 'Christopher Nolan', 2010, 148, 'Un ladrón que roba información infiltrándose en los sueños.', 1),
('The Matrix', 'Hermanas Wachowski', 1999, 136, 'Un programador descubre que su mundo es una simulación.', 1),
('Pulp Fiction', 'Quentin Tarantino', 1994, 154, 'Varias historias de criminales en Los Ángeles.', 10),
('The Avengers', 'Joss Whedon', 2012, 143, 'Un equipo de superhéroes salva al mundo.', 5),
('Avatar', 'James Cameron', 2009, 162, 'Un marine parapléjico es enviado a la luna Pandora.', 7),
('Guardians of the Galaxy', 'James Gunn', 2014, 121, 'Un grupo de inadaptados intergalácticos protege la galaxia.', 6),
('Oppenheimer', 'Christopher Nolan', 2023, 180, 'La historia del físico J. Robert Oppenheimer y la creación de la bomba atómica.', 3),
('Barbie', 'Greta Gerwig', 2023, 114, 'Barbie sufre una crisis existencial y se aventura en el mundo humano.', 2),
('John Wick', 'Chad Stahelski', 2014, 101, 'Un ex-asesino a sueldo busca venganza.', 5),
('El Silencio de los Inocentes', 'Jonathan Demme', 1991, 118, 'Una joven cadete del FBI busca la ayuda de un asesino manipulador.', 8);

-- Peliculas_Actores (Esta tabla estaba correcta porque solo usa números)
INSERT INTO `Peliculas_Actores` (`pelicula_id`, `actor_id`) VALUES
(1, 1), (2, 2), (2, 9), (3, 6), (4, 3), (5, 3), (5, 4), (6, 7), (7, 8), (7, 7),
(8, 9), (9, 10), (10, 6), (4, 11);

-- Copias
INSERT INTO `Copias` (`pelicula_id`, `formato`, `disponible`) VALUES
(1, 'DVD', TRUE), (1, 'Blu-Ray', TRUE), (2, 'DVD', TRUE), (2, 'Blu-Ray', FALSE), (3, 'DVD', TRUE),
(4, 'DVD', FALSE), (5, 'Blu-Ray', TRUE), (6, 'Blu-Ray', TRUE), (7, 'DVD', TRUE), (8, 'Blu-Ray', FALSE),
(9, 'DVD', TRUE), (10, 'Blu-Ray', TRUE), (10, 'DVD', TRUE), (11, 'DVD', TRUE), (8, 'DVD', TRUE);

-- Alquileres
INSERT INTO `Alquileres` (`copia_id`, `socio_id`, `fecha_alquiler`, `fecha_devolucion_prevista`, `fecha_devolucion_real`, `costo_alquiler`) VALUES
(4, 1, '2024-05-10', '2024-05-13', NULL, 1200.50),
(6, 2, '2024-05-12', '2024-05-15', '2024-05-14', 1000.00),
(10, 3, '2024-05-15', '2024-05-18', NULL, 1500.00),
(2, 4, '2024-04-20', '2024-04-23', '2024-04-23', 1500.00),
(5, 5, '2024-04-25', '2024-04-28', '2024-04-30', 1000.00),
(7, 6, '2024-05-01', '2024-05-04', '2024-05-03', 1500.00),
(1, 7, '2024-05-05', '2024-05-08', '2024-05-08', 1000.00),
(9, 8, '2024-05-08', '2024-05-11', '2024-05-11', 1000.00),
(12, 9, '2024-05-11', '2024-05-14', '2024-05-15', 1500.00),
(14, 10, '2024-05-14', '2024-05-17', NULL, 1000.00);
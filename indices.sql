-- Índices
-- Películas por título
CREATE INDEX `idx_pelicula_titulo` ON `Peliculas` (`titulo`);

-- Alquileres por socio
CREATE INDEX `idx_alquiler_socio` ON `Alquileres` (`socio_id`);
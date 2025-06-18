-- Consultas Analíticas
-- Cuántos socios se registraron en 2023.
SELECT
  COUNT(`socio_id`) AS `total_socios_2023`
FROM
  `Socios`
WHERE
  YEAR (`fecha_registro`) = 2023;

-- Calcular el ingreso total por alquileres registrados.
SELECT
  SUM(`costo_alquiler`) AS `ingresos_totales`
FROM
  `Alquileres`;

-- Calcular el costo promedio de un alquiler.
SELECT
  AVG(`costo_alquiler`) AS `costo_promedio_alquiler`
FROM
  `Alquileres`;

-- Encontrar la película con mayor duración.
SELECT
  `titulo`,
  MAX(`duracion_min`) AS `maxima_duracion`
FROM
  `Peliculas`;

-- Encontrar la película más antigua en el catálogo.
SELECT
  `titulo`,
  MIN(`anio_lanzamiento`) AS `anio_mas_antiguo`
FROM
  `Peliculas`;


-- Encontrar los nombres de todos los socios que han alquilado películas de 'Acción'.
SELECT
  `nombre`,
  `apellido`
FROM
  `Socios`
WHERE
  `socio_id` IN (
    SELECT
      `socio_id`
    FROM
      `Alquileres`
    WHERE
      `copia_id` IN (
        SELECT
          `copia_id`
        FROM
          `Copias`
        WHERE
          `pelicula_id` IN (
            SELECT
              `pelicula_id`
            FROM
              `Peliculas`
            WHERE
              `genero_id` = (
                SELECT
                  `genero_id`
                FROM
                  `Generos`
                WHERE
                  `nombre` = 'Acción'
              )
          )
      )
  );

-- Mostrar los títulos de las películas en las que actúa Keanu Reeves.
SELECT
  `titulo`
FROM
  `Peliculas`
WHERE
  `pelicula_id` IN (
    SELECT
      `pelicula_id`
    FROM
      `Peliculas_Actores`
    WHERE
      `actor_id` = (
        SELECT
          `actor_id`
        FROM
          `Actores`
        WHERE
          `nombre` = 'Keanu'
          AND `apellido` = 'Reeves'
      )
  );

-- Joins
-- Consulta 1: Listar todos los alquileres activos, mostrando nombre del socio, título de la película y fecha de devolución prevista.
SELECT
  s.nombre AS `nombre_socio`,
  s.apellido AS `apellido_socio`,
  p.titulo AS `titulo_pelicula`,
  a.fecha_devolucion_prevista
FROM
  `Alquileres` a
  JOIN `Socios` s ON a.socio_id = s.socio_id
  JOIN `Copias` c ON a.copia_id = c.copia_id
  JOIN `Peliculas` p ON c.pelicula_id = p.pelicula_id
WHERE
  a.fecha_devolucion_real IS NULL;

-- Consulta 2: Mostrar todas las películas del género 'Drama' y su director.
SELECT
  p.titulo,
  p.director
FROM
  `Peliculas` p
  JOIN `Generos` g ON p.genero_id = g.genero_id
WHERE
  g.nombre = 'Drama';

-- Consulta 3: Listar todos los actores que participaron en la película 'Inception'.
SELECT
  ac.nombre,
  ac.apellido
FROM
  `Actores` ac
  JOIN `Peliculas_Actores` pa ON ac.actor_id = pa.actor_id
  JOIN `Peliculas` p ON pa.pelicula_id = p.pelicula_id
WHERE
  p.titulo = 'Inception';

-- Consulta 4: Calcular el total recaudado por cada película.
SELECT
  p.titulo,
  SUM(a.costo_alquiler) AS `total_recaudado`
FROM
  `Alquileres` a
  JOIN `Copias` c ON a.copia_id = c.copia_id
  JOIN `Peliculas` p ON c.pelicula_id = p.pelicula_id
GROUP BY
  p.titulo
ORDER BY
  `total_recaudado` DESC;

-- Consulta 5: Encontrar qué socios tienen devoluciones tardías (fecha_devolucion_real > fecha_devolucion_prevista).
SELECT
  s.nombre,
  s.apellido,
  p.titulo,
  a.fecha_devolucion_prevista,
  a.fecha_devolucion_real
FROM
  `Alquileres` a
  JOIN `Socios` s ON a.socio_id = s.socio_id
  JOIN `Copias` c ON a.copia_id = c.copia_id
  JOIN `Peliculas` p ON c.pelicula_id = p.pelicula_id
WHERE
  a.fecha_devolucion_real > a.fecha_devolucion_prevista;
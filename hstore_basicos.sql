CREATE EXTENSION IF NOT EXISTS hstore;

DROP TABLE IF EXISTS productos_hstore CASCADE;

CREATE TABLE productos_hstore (
  id SERIAL PRIMARY KEY,
  nombre TEXT,
  atributos HSTORE
);

INSERT INTO productos_hstore (nombre, atributos)
VALUES 
  ('Tablet', 'marca => Apple, color => gris, peso => 1kg'),
  ('Auriculares', 'marca => Sony, color => negro, tipo => inalambrico');

-- Consulta por clave
SELECT nombre
FROM productos_hstore
WHERE atributos -> 'color' = 'negro';

-- Filtrar registros que contienen una clave
SELECT nombre
FROM productos_hstore
WHERE atributos ? 'peso';

-- Extraer todas las claves y valores
SELECT nombre, skeys(atributos) AS clave, svals(atributos) AS valor
FROM productos_hstore;

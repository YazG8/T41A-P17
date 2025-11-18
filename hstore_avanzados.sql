-- Indexar columna con GIN
CREATE INDEX IF NOT EXISTS idx_prod_hstore_gin ON productos_hstore USING GIN (atributos);

-- Validar existencia de múltiples claves
SELECT nombre
FROM productos_hstore
WHERE atributos ?& ARRAY['marca', 'color'];

-- Función personalizada
CREATE OR REPLACE FUNCTION resumen_producto(p_nombre TEXT, p_atributos HSTORE)
RETURNS TEXT AS $$
BEGIN
  RETURN p_nombre || ': ' || hstore_to_json(p_atributos);
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- Uso de la función
SELECT resumen_producto(nombre, atributos) FROM productos_hstore;

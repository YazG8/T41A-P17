-- Índice GIN para acelerar búsquedas
CREATE INDEX IF NOT EXISTS idx_clientes_info_gin ON clientes_jsonb USING GIN (info);

-- Consulta usando índice
SELECT * FROM clientes_jsonb
WHERE info @> '{"activo": true}';

-- Prueba unitaria en SQL
DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM clientes_jsonb WHERE info->>'nombre' = 'Carlos') THEN
    RAISE NOTICE 'OK: Cliente Carlos encontrado';
  ELSE
    RAISE EXCEPTION 'Fallo: Cliente Carlos no existe';
  END IF;
END;
$$;

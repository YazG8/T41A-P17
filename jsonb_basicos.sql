DROP TABLE IF EXISTS clientes_jsonb CASCADE;

CREATE TABLE clientes_jsonb (
  id SERIAL PRIMARY KEY,
  info JSONB
);

INSERT INTO clientes_jsonb (info)
VALUES 
  ('{"nombre": "Carlos", "activo": true, "edad": 22}'),
  ('{"nombre": "Lucía", "activo": false, "edad": 29}');

SELECT info->>'nombre' AS nombre
FROM clientes_jsonb
WHERE info->>'activo' = 'true';

import psycopg2
import pytest

DB_CONFIG = {
    "dbname": "test_db",
    "user": "postgres",
    "password": "postgres",
    "host": "localhost",
    "port": 5432
}

@pytest.fixture(scope="module")
def db_connection():
    conn = psycopg2.connect(**DB_CONFIG)
    yield conn
    conn.close()

def run_query(conn, query):
    with conn.cursor() as cur:
        cur.execute(query)
        return cur.fetchall()

def test_cliente_carlos(db_connection):
    result = run_query(db_connection, "SELECT info->>'nombre' FROM clientes_jsonb WHERE id = 1;")
    assert result[0][0] == "Carlos"

def test_cliente_activo(db_connection):
    result = run_query(db_connection, "SELECT info->>'activo' FROM clientes_jsonb WHERE id = 1;")
    assert result[0][0] == "true"

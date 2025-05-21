import psycopg2

# Dados do banco (ajuste usuário/senha/host/db)
conn = psycopg2.connect(
    dbname="atividadesbd",
    user="postgres",
    password="postgres",
    host="localhost",
    port="5432"
)
cursor = conn.cursor()

# Inserir uma atividade (exemplo)
cursor.execute("""
    INSERT INTO atividade (nome, descricao, projeto_id) 
    VALUES (%s, %s, %s)
""", ("Atividade Teste", "Descrição teste", 1))

# Atualizar líder do projeto (exemplo)
cursor.execute("""
    UPDATE projeto SET lider_id = %s WHERE id = %s
""", (2, 1))

# Listar projetos e suas atividades
cursor.execute("""
    SELECT p.id, p.nome, a.id, a.nome
    FROM projeto p
    LEFT JOIN atividade a ON a.projeto_id = p.id
    ORDER BY p.id;
""")

rows = cursor.fetchall()
for row in rows:
    print(f"Projeto {row[0]} - {row[1]} | Atividade {row[2]} - {row[3]}")

conn.commit()
cursor.close()
conn.close()

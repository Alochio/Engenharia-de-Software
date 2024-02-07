import mysql.connector

config = {
    'user': 'root',
    'password': 'M!nha$enha123',
    'host': 'localhost',
    'database': 'db_Treinopro',
    'port': 3306,
}

try:
    conexao = mysql.connector.connect(**config)
    print("Conexao bem-sucedida!")

except mysql.connector.Error as ex:
    print(f"Erro de conexao: {ex}")
    print("Erro ao conectar ao banco de dados")
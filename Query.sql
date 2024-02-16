CREATE DATABASE db_Treinopro;
USE db_Treinopro;

/*
	1 - admin
    2 - academia
	3 - personal
	4 - aluno
*/

CREATE TABLE administrador (
    id_administrador INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tipo_conta INT NOT NULL
);

CREATE TABLE academia (
    id_academia INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tipo_conta INT NOT NULL,
    nome_academia VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(15) UNIQUE,
    cnpj VARCHAR(14) UNIQUE,
    foto_perfil VARCHAR(255)
);

CREATE TABLE professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo_conta INT NOT NULL,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    endereco VARCHAR(255),
    telefone VARCHAR(15) UNIQUE,
    cpf VARCHAR(14) UNIQUE,
    data_nascimento DATE,
    id_academia INT,
    FOREIGN KEY (id_academia) REFERENCES academia(id_academia),
    foto_perfil VARCHAR(500)
);

CREATE TABLE aluno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo_conta INT NOT NULL,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    endereco VARCHAR(255),
    telefone VARCHAR(11) UNIQUE,
    cpf VARCHAR(11) UNIQUE,
    data_nascimento DATE,
	id_academia INT,
    FOREIGN KEY (id_academia) REFERENCES academia(id_academia),
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor),
    foto_perfil VARCHAR(500),
    avaliacao_fisica VARCHAR(500),
    plano_alimentar VARCHAR(500),
    plano_treino VARCHAR(500)
);

SHOW TABLES;
#DROP TABLE administrador;
#DROP TABLE academia, professor, aluno;

SELECT * FROM administrador;
SELECT * FROM academia;
SELECT * FROM professor;
SELECT * FROM aluno;

#INSERT INTO academia (login, senha, tipo_conta) VALUES ('academia123', '123', 2);
#INSERT INTO professor(login, senha, tipo_conta) VALUES ('prof', '123', 3);
#INSERT INTO aluno(login, senha, tipo_conta) VALUES ('aluno', '123', 4);




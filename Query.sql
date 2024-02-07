CREATE DATABASE db_Treinopro;
USE db_Treinopro;

/*
	1 - admin
	2 - personal
	3 - aluno
*/

CREATE TABLE administrador (
    id_administrador INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo_conta INT NOT NULL
);

SELECT * FROM administrador;
INSERT INTO administrador (login, senha, tipo_conta) VALUES ('dev', '123', 1);


CREATE TABLE professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    tipo_conta INT NOT NULL,
    login VARCHAR(255) NOT NULL
);

INSERT INTO professor (email, senha, cpf, telefone, tipo_conta, login) VALUES ('prof', '123', '12345678933', '12345678922', 2, 'prof');
INSERT INTO professor (email, senha, cpf, telefone, tipo_conta, login) VALUES ('professor1@example.com', 'senha123', '12345678901', '12345678901', 2, 'professor1');
INSERT INTO professor (email, senha, cpf, telefone, tipo_conta, login) VALUES ('professor2@example.com', 'senha456', '23456789012', '23456789012', 2, 'professor2');
INSERT INTO professor (email, senha, cpf, telefone, tipo_conta, login) VALUES ('professor3@example.com', 'senha789', '34567890123', '34567890123', 2, 'professor3');
INSERT INTO professor (email, senha, cpf, telefone, tipo_conta, login) VALUES ('professor4@example.com', 'senhaabc', '45678901234', '45678901234', 2, 'professor4');



SELECT * FROM professor;

CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    nome VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    tipo_conta INT NOT NULL,
    login VARCHAR(255) NOT NULL,
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

-- Alunos para o professor1
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('alunoemail@email.com', 'Vinicius Alochio Santos', '123', '28999515151', '16089023777', 3, 'Alochio', 1);
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('teste@teste.com', 'aluno teste', '123', '12345678921', '12345688901', 3, 'alunoteste_professor1', 1);
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('aluno1_professor1@example.com', 'Aluno 1 Professor 1', 'senha123', '12345678901', '12345678901', 3, 'aluno1_professor1', 1);
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('aluno2_professor1@example.com', 'Aluno 2 Professor 1', 'senha456', '23456789012', '23456789012', 3, 'aluno2_professor1', 1);
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('aluno3_professor1@example.com', 'Aluno 3 Professor 1', 'senha789', '34567890123', '34567890123', 3, 'aluno3_professor1', 1);
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('aluno4_professor1@example.com', 'Aluno 4 Professor 1', 'senhaabc', '45678901234', '45678901234', 3, 'aluno4_professor1', 1);

-- Alunos para o professor2
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('aluno1_professor2@example.com', 'Aluno 1 Professor 2', 'senha123', '12345678901', '12345678901', 3, 'aluno1_professor2', 2);
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('aluno2_professor2@example.com', 'Aluno 2 Professor 2', 'senha456', '23456789012', '23456789012', 3, 'aluno2_professor2', 2);
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('aluno3_professor2@example.com', 'Aluno 3 Professor 2', 'senha789', '34567890123', '34567890123', 3, 'aluno3_professor2', 2);
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('aluno4_professor2@example.com', 'Aluno 4 Professor 2', 'senhaabc', '45678901234', '45678901234', 3, 'aluno4_professor2', 2);

-- Alunos para o professor3
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('aluno1_professor3@example.com', 'Aluno 1 Professor 3', 'senha123', '12345678901', '12345678901', 3, 'aluno1_professor3', 3);
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('aluno2_professor3@example.com', 'Aluno 2 Professor 3', 'senha456', '23456789012', '23456789012', 3, 'aluno2_professor3', 3);
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('aluno3_professor3@example.com', 'Aluno 3 Professor 3', 'senha789', '34567890123', '34567890123', 3, 'aluno3_professor3', 3);
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('aluno4_professor3@example.com', 'Aluno 4 Professor 3', 'senhaabc', '45678901234', '45678901234', 3, 'aluno4_professor3', 3);

-- Alunos para o professor4
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('aluno1', 'Aluno 1 Professor 4', '123', '17745678901', '77345678901', 3, 'aluno1', 4);
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('aluno2_professor4@example.com', 'Aluno 2 Professor 4', 'senha456', '23456789012', '23456789012', 3, 'aluno2_professor4', 4);
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('aluno3_professor4@example.com', 'Aluno 3 Professor 4', 'senha789', '34567890123', '34567890123', 3, 'aluno3_professor4', 4);
INSERT INTO aluno (email, nome, senha, cpf, telefone, tipo_conta, login, id_professor) VALUES ('aluno4_professor4@example.com', 'Aluno 4 Professor 4', 'senhaabc', '45678901234', '45678901234', 3, 'aluno4_professor4', 4);

SELECT * FROM professor;
SELECT * FROM aluno;
SELECT * FROM Aluno WHERE id_professor = null;

ALTER TABLE Aluno
ADD COLUMN avaliacao_fisica VARCHAR(255),
ADD COLUMN plano_alimentar VARCHAR(255),
ADD COLUMN plano_treino VARCHAR(255);





-- DROP TABLE dbo.usuario;

INSERT INTO usuario (login_user, senha_user, tipo_user) VALUES ('dev', 'senha', 1);
-- UPDATE usuario SET senha_user = 'novo_hash' WHERE login_user = 'admin';


-- DELETE FROM usuario WHERE id_user = 1;

SELECT * FROM administrador;

SHOW TABLES;


UPDATE Aluno
SET avaliacao_fisica = LOAD_FILE('file:///C:/Users/ALOCHIO/Desktop/eng%20de%20soft/Slides%20CSI403_CSI485/UML-Diagrama%20de%20Atividades%20-%20[Pt-Br].pdf')
WHERE id_aluno = 21;



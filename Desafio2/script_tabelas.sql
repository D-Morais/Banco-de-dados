-- Comando para criar o banco e para utiliza-lo --
CREATE DATABASE oficina;
USE oficina;

-- Criando as tabelas --
CREATE TABLE clientes(
	Id_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Cliente VARCHAR(55),
	Rua varchar(30),
	Cidade varchar(20),
	Estado varchar(20),
	Pais varchar(20),
	CEP varchar(8),
    Fone CHAR(11),
    Email CHAR(30)
);

CREATE TABLE veiculo(
	Numero_Chassis VARCHAR(17) PRIMARY KEY,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Ano INT,
    Placa VARCHAR(10),
    Cliente_Id INT,
    FOREIGN KEY (Cliente_Id) REFERENCES clientes(Id_Cliente)
);

CREATE TABLE mecanico(
	Id_Mecanico INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Mecanico VARCHAR(55),
    Fone CHAR(11),
    Email CHAR(30),
    Especializacao VARCHAR(55)
);

CREATE TABLE ordem_de_servico(
	Numero_OS INT AUTO_INCREMENT PRIMARY KEY,
    Data_Abertura DATE,
    Descricao_Problema TEXT,
    Veiculo_Chassis VARCHAR(17),
    Mecanico INT,
    FOREIGN KEY (Veiculo_Chassis) REFERENCES veiculo(Numero_Chassis),
    FOREIGN KEY (Mecanico) REFERENCES mecanico(Id_Mecanico)
);

CREATE TABLE peca(
	Codigo INT NOT NULL PRIMARY KEY,
	Nome VARCHAR(50),
    Preco DECIMAL(10, 2),
    Estoque INT
);

CREATE TABLE Servico(
	Id_Servico INT AUTO_INCREMENT PRIMARY KEY,
    Descricao TEXT,
    Preco_Servico DECIMAL(10, 2)
);

-- Tabela de junção para relacionamento N para N entre ordem_de_servico e Servico
CREATE TABLE ordem_servico_servico (
    Ordem_Servico_Numero_OS INT,
    Servico_Codigo INT,
    PRIMARY KEY (Ordem_Servico_Numero_OS, Servico_Codigo),
    FOREIGN KEY (Ordem_Servico_Numero_OS) REFERENCES ordem_de_servico(Numero_OS),
    FOREIGN KEY (Servico_Codigo) REFERENCES Servico(Id_Servico)
);

-- Tabela de junção para relacionamento N para N entre ordem_de_servico e Peca
CREATE TABLE ordem_servico_peca_reposicao (
    Ordem_Servico_Numero_OS INT,
    Peca_Codigo INT,
    PRIMARY KEY (Ordem_Servico_Numero_OS, Peca_Codigo),
    FOREIGN KEY (Ordem_Servico_Numero_OS) REFERENCES ordem_de_servico(Numero_OS),
    FOREIGN KEY (Peca_Codigo) REFERENCES peca(Codigo)
);

-- Setando o auto incremento das tabelas em 1;
ALTER TABLE clientes AUTO_INCREMENT=1;
ALTER TABLE mecanico AUTO_INCREMENT=1;
ALTER TABLE ordem_de_servico AUTO_INCREMENT=1;
ALTER TABLE Servico AUTO_INCREMENT=1;
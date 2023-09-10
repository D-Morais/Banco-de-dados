USE oficina;

-- Inserir dados na tabela Clientes
INSERT INTO clientes (Nome_Cliente, Rua, Cidade, Estado, Pais, CEP, Fone, Email) VALUES
    ('João Silva', 'Rua Principal', 'Alegrete', 'RS', 'Brasil', '94912010', '55999999999', 'joao@email.com'),
	('Ana Santos', 'Cairu', 'Estrela', 'RS', 'Brasil', '92212010', '55999119999', 'ana@email.com'),
    ('José Maria', 'Rua Sem Fim', 'Torres', 'RS', 'Brasil', '93412010', '55999999222', 'jose@email.com'),
    ('Maria Santos', 'Avenida Secundária', 'São José', 'RS', 'Brasil', '95902010','55999999111', 'maria@email.com');

-- Inserir dados na tabela Veiculo
INSERT INTO Veiculo (Numero_Chassis, Marca, Modelo, Ano, Placa, Cliente_Id) VALUES
    ('ABC123456DEF78901', 'Ford', 'Focus', 2019, 'XYZ-1234', 1),
    ('ABC123456DEF77701', 'Ford', 'Focus', 2021, 'GYW-5689', 2),
    ('ABC123443DEF78901', 'Chevrolet', 'Cruze', 2018, 'AYF-1554', 3),
    ('XYZ987654ABC12345', 'Chevrolet', 'Cruze', 2022, 'ABC-5678', 4);
    
-- Inserir dados na tabela mecânico
INSERT INTO mecanico (Nome_Mecanico, Fone, Email, Especializacao) VALUES
    ('José Lima', '55993399999', 'jose@email.com', null),
    ('Roberto Silva', '55999559222', 'roberto@email.com', null),
    ('Antônio Santos', '55999994511', 'antonio@email.com', null);
    
-- Inserir dados na tabela ordem_de_servico
INSERT INTO ordem_de_servico (Data_Abertura, Descricao_Problema, Veiculo_Chassis, Mecanico) VALUES
    ('2023-09-01', 'Troca de óleo e filtros', 'ABC123456DEF78901', 1),
    ('2023-09-02', 'Reparo no sistema de freios', 'XYZ987654ABC12345', 2);

-- Inserir dados na tabela Peça
INSERT INTO Peca (Codigo, Nome, Preco, Estoque) VALUES
    (10112,'Filtro de Óleo', 10.99, 40),
    (10120,'Pastilhas de Freio', 29.99, 30);

-- Inserir dados na tabela Servico
INSERT INTO Servico (Descricao, Preco_Servico) VALUES
    ('Troca de óleo', 50.00),
    ('Reparo de freios', 100.00);

-- Inserir dados nas tabelas de junção OrdemServico_Servico e OrdemServico_PecaDeReposicao
INSERT INTO ordem_servico_servico (Ordem_Servico_Numero_OS, Servico_Codigo) VALUES
    (1, 1), -- Ordem de Serviço 1 está associada ao Serviço 1 (Troca de óleo)
    (2, 2); -- Ordem de Serviço 2 está associada ao Serviço 2 (Reparo de freios)

INSERT INTO ordem_servico_peca_reposicao (Ordem_Servico_Numero_OS, Peca_Codigo) VALUES
    (1, 10112), -- Ordem de Serviço 1001 está associada à Peça de Reposição 101 (Filtro de Óleo)
    (2, 10120); -- Ordem de Serviço 1002 está associada à Peça de Reposição 102 (Pastilhas de Freio)

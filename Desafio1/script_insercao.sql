-- inserção de dados e queries básicas de consultas
use ecommerce;

show tables;

-- Fname, Lname, CPF, Street, City, State, Country, CEP --
insert into clients (Fname, Lname, CPF, Street, City, State, Country, CEP) 
	   values('Mariana', 'Silva', 12346789001, 'Sem Nome', 'Torres', 'RS', 'Brasil', '00000000'),
		     ('José', 'Silveira', 98765432101, 'Sem Fim', 'Porto Alegre', 'RS', 'Brasil', '11111111'),
			 ('Mauro', 'Costa', 45678912301, 'Castelo Branco', 'Caxias do Sul', 'RS', 'Brasil', '11100011'),
			 ('Ana', 'Quevedo', 78912345601, 'Sem Limites', 'Canela', 'RS', 'Brasil', '11110011'),
			 ('Isaque', 'Lima', 98745632101, 'Pouco Espaço', 'Gramado', 'RS', 'Brasil', '00001111'),
			 ('Manuela', 'Silva', 65478912301, 'Sem Fim', 'Porto Alegre', 'RS', 'Brasil', '11111111'),
			 ('José', 'Costa', 89478912301, 'Sem Nome', 'Torres', 'RS', 'Brasil', '00000000');

-- Pname, Classification_Kids, Category, Price, Evaluation, Size --
insert into product (Pname, Classification_Kids, Category, Price, Evaluation, Size) values
							  ('Notebook', false, 'Eletrônico', 3000.00, 4.5, null),
                              ('Café', false, 'Alimentos', 18.50, 4, null),
							  ('Cafeteira', false, 'Eletrônico', 250.00, 4.7, null),
                              ('Bolacha', false, 'Alimentos', 3.50, 4.3, null),
							  ('Sofá', false, 'Móveis', 4100.00, 4.6, '3x57x80'),
                              ('Chocolate', false, 'Alimentos', 7.50, 4.9, null),
							  ('Microfone', false, 'Eletrônico', 370.00, 4.2, null),
						      ('Camiseta', true, 'Vestimenta', 70.00, 4, '2'),
                              ('Body',true,'Vestimenta', 50.00, 5, '3');

-- Storage_Location, Quantity --
insert into productStorage (Storage_Location, Quantity) values 
							('Rio Grande do Sul', 800),
                            ('Rio Grande do Sul', 200),
                            ('Santa Catarina', 100),
                            ('Santa Catarina', 500),
                            ('Paraná', 300),
                            ('Paraná', 250);

-- Id_Supplir, Social_Name, CNPJ, Contact, Email --
insert into supplier (Social_Name, CNPJ, Contact, Email) values 
							('Compre Certo', 123456789123456, '55999999999', 'comprecerto@gmail.com'),
                            ('Importados Preço Bom', 854519649143457, '55999999911', 'precobom@gmail.com'),
                            ('Eletrônicos Seu Zé', 934567893934695, '55999111999', 'seuze@gmail.com'),
							('Importados Nunca Esqueça', 854519649143422, '55988899911', 'nuncaesqueca@gmail.com');
                         
-- Social_Name, Abst_Name, CNPJ, CPF, Location, Contact, Email --
insert into seller (Social_Name, Abst_Name, CNPJ, CPF, Location, Contact, Email) values 
						('Tech Innovation', null, 123456789456321, null, 'Santa Catarina', '55988998921', 'techinnove@gmail.com'),
					    ('Tropa de Elite', null, 113152709056021, null, 'Santa Catarina', '55988998921', 'tropa@gmail.com'),
                        ('Multi', null, 456789123654485, null, 'Paraná', '60988558921', 'multi@gmail.com'),
						('My Kids', null, null, 987600301,'Paraná', '60998993121', 'techinnove@gmail.com');                         

-- Id_Client, Id_Payment, Type_Payment, limit_Available --
insert into payments (Id_Client, Id_Payment, Type_Payment, limit_Available) values
							(1, 1, 'Pix', 1000),
                            (2, 2, 'Cartão', 3000.00),
                            (3, 3, 'Boleto', 850),
                            (4, 4, 'Pix', 1000),
                            (5, 5, 'Cartão', 2500.00);
                            
-- Id_Order_Client, Payment, Order_Status, Order_Description, Send_Value, Payment_Cash --
insert into orders (Id_Order_Client, Payment, Order_Status, Order_Description, Send_Value, Payment_Cash) values 
							 (1, 1, 'Confirmado', 'compra via aplicativo', 1000, 1),
                             (2, 2, 'Em processamento', 'compra via web site', 500, 0),
                             (3, 3, 'Confirmado', 'compra via aplicativo', 425, 1),
                             (4, 4, 'Confirmado', 'compra via aplicativo', 1000, 1),
                             (5, 5, 'Em processamento','compra via web site', 500, 0);

-- Tabelas de relacionamentos M:N
-- Id_PSeller, Id_PProduct, Prod_Quantity --
insert into productSeller (Id_PSeller, Id_PProduct, Prod_Quantity) values 
						 (5, 10, 20),
                         (6, 14, 10),
                         (7, 15, 80),
                         (8, 17, 50);

-- Id_PsSupplier, Id_PsProduct, Quantity --
insert into productSupplier (Id_PsSupplier, Id_PsProduct, Quantity) values
						 (1, 17, 300),
                         (3, 10, 100),
                         (2, 15, 500),
                         (3, 12, 70),
                         (4, 13, 300);

-- Id_LProduct, Id_LStorage, Location --
insert into storageLocation (Id_LProduct, Id_LStorage, Location) values
						 (11, 1, 'RS'),
                         (14, 4, 'SC'),
                         (16, 5, 'PR');

-- Id_POProduct, Id_POOrder, PoQuantity, PoStatus --
insert into productOrder (Id_POProduct, Id_POOrder, PoQuantity, PoStatus) values
						 (12, 1, 2, 'Disponível'),
                         (15, 2, 3, 'Disponível'),
                         (13, 5, 1, 'Disponível');

-- Queries --
select * from clients;
select * from product;
select * from productStorage;
select * from supplier;
select * from seller;
select * from payments;
select * from orders;
select * from productSeller;
select * from productSupplier;
select * from storageLocation;


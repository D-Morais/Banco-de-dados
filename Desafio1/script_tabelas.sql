-- Criação do banco de dados E-commerce 
CREATE DATABASE ecommerce;
USE ecommerce;

-- Criar tabela de cliente
CREATE TABLE clients(
	Id_Client INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL UNIQUE,
    Street varchar(30),
	City varchar(20),
	State varchar(20),
	Country varchar(20),
	CEP varchar(8)
);

-- Criar tabela de estoque
CREATE TABLE productStorage(
	Id_Prod_Storage INT AUTO_INCREMENT PRIMARY KEY,
    Storage_Location VARCHAR(255),
    Quantity INT DEFAULT 0
);

-- Criar tabela produto
CREATE TABLE product(
	Id_Product INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(10) NOT NULL,
    Classification_Kids BOOL,
    Category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL,
    Price FLOAT,
    Evaluation FLOAT DEFAULT 0,
    Size VARCHAR(10)
);

-- Criar tabela de fornecedor
CREATE TABLE supplier(
	Id_Supplir INT AUTO_INCREMENT PRIMARY KEY,
    Social_Name VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    Contact CHAR(11) NOT NULL,
    Email VARCHAR(30) NOT NULL
);

-- Criar tabela de vendedor
CREATE TABLE seller(
	Id_Seller INT AUTO_INCREMENT PRIMARY KEY,
    Social_Name VARCHAR(255) NOT NULL,
    Abst_Name VARCHAR(255),
    CNPJ CHAR(15) UNIQUE,
    CPF CHAR(9) UNIQUE,
    Location VARCHAR(255),
    Contact CHAR(11) NOT NULL,
    Email VARCHAR(30) NOT NULL
);

-- Criar tabela de pagamento
CREATE TABLE payments(
	Id_Client INT,
    Id_Payment INT,
    Type_Payment ENUM('Boleto', 'Pix', 'Cartão', 'Dois Cartões'),
    limit_Available FLOAT,
    PRIMARY KEY (Id_Payment)
);

-- Criar tabela de pedido
CREATE TABLE orders(
	Id_Orders INT AUTO_INCREMENT PRIMARY KEY,
    Id_Order_Client INT,
    Payment INT,
    Order_Status ENUM('Cancelado', 'Confirmado', 'Em processamento'),
    Order_Description VARCHAR(255),
    Send_Value FLOAT DEFAULT 10,
    Payment_Cash BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_payment FOREIGN KEY (Payment) REFERENCES payments(Id_Payment),
    CONSTRAINT fk_order_client FOREIGN KEY (Id_Order_Client) REFERENCES clients(Id_Client) 
    ON UPDATE CASCADE
);

-- Setando o auto incremento das tabelas em 1;
ALTER TABLE clients AUTO_INCREMENT=1;
ALTER TABLE product AUTO_INCREMENT=1;
ALTER TABLE productStorage AUTO_INCREMENT=1;
ALTER TABLE supplier AUTO_INCREMENT=1;
ALTER TABLE seller AUTO_INCREMENT=1;
ALTER TABLE orders AUTO_INCREMENT=1;

-- Tabelas de relacionamentos M:N
CREATE TABLE productSeller(
	Id_PSeller INT,
    Id_PProduct INT,
    Prod_Quantity INT DEFAULT 1,
    PRIMARY KEY (Id_PSeller, Id_PProduct),
    CONSTRAINT fk_pseller FOREIGN KEY (Id_PSeller) REFERENCES seller(Id_Seller),
	CONSTRAINT fk_pproduct FOREIGN KEY (Id_PProduct) REFERENCES product(Id_Product)
);

CREATE TABLE productSupplier(
	Id_PsSupplier INT,
    Id_PsProduct INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (Id_PsSupplier, Id_PsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (Id_PsSupplier) REFERENCES supplier(Id_Supplir),
	CONSTRAINT fk_product_supplier_product FOREIGN KEY (Id_PsProduct) REFERENCES product(Id_Product)
);

CREATE TABLE storageLocation(
	Id_LProduct INT,
    Id_LStorage INT,
    Location VARCHAR(255) NOT NULL,
    PRIMARY KEY (Id_LProduct, Id_LStorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY (Id_LProduct) REFERENCES product (Id_Product),
    CONSTRAINT fk_storage_location_storage FOREIGN KEY (Id_LStorage) REFERENCES productStorage (Id_Prod_Storage)
);

CREATE TABLE productOrder(
	Id_POProduct INT,
    Id_POOrder INT,
    PoQuantity INT DEFAULT 1,
    PoStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (Id_POProduct, Id_POOrder),
    CONSTRAINT FOREIGN KEY fk_productorder_product (Id_POProduct) REFERENCES product (Id_Product),
    CONSTRAINT FOREIGN KEY fk_productorder_order (Id_POOrder) REFERENCES orders(Id_Orders)
);

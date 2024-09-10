-- base de dados:  loja 
CREATE DATABASE IF NOT EXISTS loja;

-- Utilização da base de dados "loja"
-- USE loja; -- só para mysql server

-- Tabela Estado
CREATE TABLE Estado (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    UF CHAR(2) NOT NULL
);

-- Tabela Municipio
CREATE TABLE Municipio (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Estado_ID INT NOT NULL,
    Nome VARCHAR(80) NOT NULL,
    CodIBGE INT, -- Pode ser NULL
    FOREIGN KEY (Estado_ID) REFERENCES Estado(ID),
    INDEX fk_Municipio_Estado1_idx (Estado_ID)
);

-- Tabela Cliente
CREATE TABLE Cliente (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(80) NOT NULL,
    CPF CHAR(11) NOT NULL,
    Celular CHAR(11), -- Pode ser NULL
    EndLogradouro VARCHAR(100) NOT NULL,
    EndNumero VARCHAR(10) NOT NULL,
    EndMunicipio INT, -- Pode ser NULL
    EndCEP CHAR(8), -- Pode ser NULL
    Municipio_ID INT NOT NULL,
    FOREIGN KEY (Municipio_ID) REFERENCES Municipio(ID),
    INDEX fk_Cliente_Municipio1_idx (Municipio_ID)
);

-- Tabela ContaReceber
CREATE TABLE ContaReceber (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Cliente_ID INT NOT NULL,
    FaturaVendaID INT, -- Pode ser NULL
    DataConta DATE NOT NULL,
    DataVencimento DATE NOT NULL,
    Valor DECIMAL(18,2) NOT NULL,
    Situacao ENUM('1', '2', '3') NOT NULL, -- Recomendo usar valores descritivos
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(ID),
    INDEX fk_ContaReceber_Cliente_idx (Cliente_ID)
);


-- inserir.sql

INSERT INTO Estado (Nome, UF) 
VALUES 
    ('São Paulo', 'SP'),
    ('Rio de Janeiro', 'RJ'),
    ('Minas Gerais', 'MG'),
    ('Paraná', 'PR'),
    ('Santa Catarina', 'SC');
    
    INSERT INTO Municipio (Estado_ID, Nome, CodIBGE) 
VALUES 
    (1, 'São Paulo', 3550308),
    (1, 'Campinas', 3509502),
    (2, 'Rio de Janeiro', 3304557),
    (3, 'Belo Horizonte', 3106200),
    (4, 'Curitiba', 4106902);
    
    
    
    INSERT INTO Cliente (Nome, CPF, Celular, EndLogradouro, EndNumero, EndMunicipio, EndCEP, Municipio_ID) 
VALUES 
    ('João Silva', '12345678901', '11987654321', 'Rua A', '100', NULL, '01001000', 1),
    ('Maria Souza', '98765432109', NULL, 'Avenida B', '250', 1, NULL, 2),
    ('Pedro Santos', '55555555555', '21912345678', 'Travessa C', '30', NULL, '20001001', 3),
    ('Ana Oliveira', '44444444444', '31977778888', 'Praça D', '15', 3, '30000000', 4),
    ('Carlos Ferreira', '11122233344', NULL, 'Alameda E', '5', NULL, NULL, 5);
    
    
    
    INSERT INTO ContaReceber (Cliente_ID, FaturaVendaID, DataConta, DataVencimento, Valor, Situacao) 
VALUES 
    (1, 1001, '2023-09-01', '2023-09-30', 500.00, '1'),
    (2, NULL, '2023-08-15', '2023-09-14', 800.50, '2'),
    (3, 1003, '2023-07-20', '2023-08-19', 1200.00, '3'),
    (4, 1004, '2023-06-10', '2023-07-10', 350.75, '1'),
    (5, NULL, '2023-05-05', '2023-06-04', 999.99, '2');
    
  
  
-- consulta.sql 
  CREATE VIEW ContasNaoPagas AS
SELECT
    CR.ID AS ID_Conta,
    C.Nome AS Nome_Cliente,
    C.CPF AS CPF_Cliente,
    CR.DataVencimento,
    CR.Valor
FROM ContaReceber CR
JOIN Cliente C ON CR.Cliente_ID = C.ID
WHERE CR.Situacao = '1'; -- Considerando '1' como o valor para "não pago"

select * from ContasNaoPagas

    

-- Criação da tabela Products
CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2),
    UnitsInStock INT
);

-- Inserção de registros de exemplo
INSERT INTO Products (ProductID, ProductName, Price, UnitsInStock)
VALUES (1, 'Product A', 10.99, 100),
       (2, 'Product B', 15.99, 50),
       (3, 'Product C', 5.99, 200),
       (4, 'Product D', 8.99, 75),
	   (5, 'Product E', 0, 0);



-- Criação da tabela Sales
CREATE TABLE Sales (
    SaleID INT,
    SaleDate DATE,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    TotalAmount DECIMAL(10, 2)
);

-- Inserção de registros falsos de exemplo
INSERT INTO Sales (SaleID, SaleDate, CustomerID, ProductID, Quantity, TotalAmount)
VALUES (1, '2022-01-01', 101, 1, 5, 54.75),
       (2, '2022-01-02', 102, 2, 3, 35.97),
       (3, '2022-01-03', 103, 1, 2, 21.90),
       (4, '2022-01-03', 104, 3, 1, 9.99),
       (5, '2021-01-04', 101, 2, 4, NULL);
	     


-- pega o registro com menor preço na coluna Price da tabela products 
SELECT MIN(Price) AS MinPrice FROM Products;

-- pega o registro com maior preço na coluna Price da tabela products 
SELECT MAX(Price) AS MaxPrice FROM Products;

-- conta o total de registros 
SELECT COUNT(*) AS TotalRows FROM Products;


-- o preco que estava cadastrado contendo pontos, irá mostrar somente os decimais em diante
SELECT CAST(Price AS INT)  AS RoundedPrice FROM Products;

-- adicionando uma string ao final do resultado 
SELECT CAST(Price AS varchar) + ' reais'  AS RoundedPrice FROM Products;



-- Quantos dias fazem desde a venda
SELECT DATEDIFF(DAY, SaleDate, getdate()) AS DaysDiff FROM Sales;
-- Quantos anos fazem desde a venda
SELECT DATEDIFF(year, SaleDate, getdate()) AS DaysDiff FROM Sales;


-- o item que estiver com preço cadastrado como "NULL" será substituido por 0.00
 SELECT SaleID, SaleDate, ISNULL(TotalAmount, 0.00) AS TotalAmount
FROM Sales;

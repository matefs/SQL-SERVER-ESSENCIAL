
-- Criação da tabela Sales
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SaleDate DATE,
    TotalAmount DECIMAL(10, 2)
);

-- Criação da tabela LogSales
CREATE TABLE LogSales (
    SaleID INT,
    SaleDate DATE,
    TotalAmount DECIMAL(10, 2),
    ActionType VARCHAR(50),
    LogDateTime DATETIME
);


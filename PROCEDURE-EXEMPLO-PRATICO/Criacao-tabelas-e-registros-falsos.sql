-- Criação da tabela Sales
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SaleDate DATE,
    TotalAmount DECIMAL(10, 2)
);

 
 INSERT INTO Sales (SaleID, SaleDate, TotalAmount) VALUES (1, '2023-05-01', 100.00), (2, '2023-05-02', 150.50), (3, '2022-05-03', 75.20);
 
 select * from Sales
  

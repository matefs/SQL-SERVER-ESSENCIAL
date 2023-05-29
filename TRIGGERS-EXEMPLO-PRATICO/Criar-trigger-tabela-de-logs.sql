
 create trigger trg_Sales_log
 on Sales
 after insert, update, delete 
 as
 begin 
	set NOCOUNT ON;
	
	Declare @ActionType  varchar(50);

	if exists (select * from inserted) and exists (select * from deleted)
		set @ActionType = 'Update';
	else if exists(select * from inserted)
		set @ActionType = 'Insert';
	else if exists (select * from deleted ) 
		set @ActionType = 'Delete';

	insert into LogSales (SaleID, SaleDate, TotalAmount, ActionType, LogDateTime)
	select SaleID, SaleDate, TotalAmount, @ActionType, GETDATE()
	from inserted;
end


-- INSERT INTO Sales (SaleID, SaleDate, TotalAmount) VALUES (1, '2023-05-01', 100.00), (2, '2023-05-02', 150.50), (3, '2023-05-03', 75.20);
-- select * from LogSales

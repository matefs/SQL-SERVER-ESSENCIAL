create procedure GetSalesByDate
	@StartDate Date,
	@EndDate Date

as 
begin
	set nocount on;

	select SaleId,SaleDate,TotalAmount 
	from Sales 
	where SaleDate between @StartDate and @EndDate
end

--drop procedure GetSalesByDate
exec GetSalesByDate '2023-01-01', '2023-12-31'

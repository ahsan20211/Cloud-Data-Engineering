CREATE PROCEDURE sp_ProductList
AS
BEGIN
	SELECT 
		product_name, 
		list_price
	FROM 
		production.products
	ORDER BY 
		product_name
end;


alter PROCEDURE sp_ProductList_param(@min_list_price AS DECIMAL)	
AS
BEGIN
	
	SELECT 
		product_name, 
		list_price
	FROM 
		production.products
	WHERE
        list_price >= @min_list_price
	ORDER BY 
		product_name
end;
EXEC  sp_ProductList_param 1000;

alter PROCEDURE sp_ProductList_double_param(
								@min_list_price AS DECIMAL
								,@max_list_price AS DECIMAL,
								  @row_count INT OUTPUT

)	
AS
BEGIN
    declare @product_name as varchar(255);
	set @product_name ='Electra Townie Commute Go! - 2018'

	declare @model_year as SMALLINT;
	SET @model_year = 2018;

	SELECT 
		product_name, 
		list_price
	FROM 
		production.products
	WHERE
        list_price >= @min_list_price and
		list_price <= @max_list_price and
		product_name = @product_name and
		model_year = @model_year

	ORDER BY 
		product_name
	SELECT @row_count = @@ROWCOUNT;

end;

declare @count as int;
EXECUTE sp_ProductList_double_param 900, 10000, @row_count = @count output;
select @count


CREATE OR ALTER PROCEDURE sp_Customers_From_NY
(
    @row_count INT OUTPUT
)
AS
BEGIN
    
    SELECT
        customer_id,
        first_name,
        last_name,
        city,
        state
    FROM
        sales.customers
    WHERE
        state = 'NY';

    SET @row_count = @@ROWCOUNT;
END;

DECLARE @total_customers INT;

EXEC sp_Customers_From_NY 
     @row_count = @total_customers OUTPUT;

SELECT @total_customers AS CustomersFromNY;


alter PROCEDURE sp_ProductList_double_param(
								@min_list_price AS DECIMAL
								,@max_list_price AS DECIMAL)	
AS
BEGIN

	SELECT 
		product_name, 
		list_price
	FROM 
		production.products
	WHERE
        list_price >= 900 and
		list_price <= 1000

	ORDER BY 
		product_name


end;

declare @count as int;
EXECUTE sp_ProductList_double_param 900, 10000, @row_count = @count output;
select @count


DECLARE @counter INT = 0;

WHILE @counter <= 5
BEGIN
    SET @counter = @counter + 1;
    IF @counter = 2
        BREAK;
    PRINT @counter;
END


declare @product_name as varchar(255),
declare @list_price as decimal
use BikeStores;

select order_id,
		order_date,
		c.customer_id from sales.orders o
inner join sales.customers c on  c.customer_id = o.customer_id
where c.city = 'New York'


-- where year => 2019
select * from [sales].[orders];

select first_name , last_name from sales.staffs
INTERSECT
select first_name , last_name from sales.customers

SELECT 
    first_name,
    last_name,
    COUNT(*) AS total
FROM sales.customers
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;

SELECT
    product_id
FROM
    production.products
EXCEPT
SELECT
    product_id
FROM
    sales.order_items;

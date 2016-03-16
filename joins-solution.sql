--1 Get all customers and their addresses.
SELECT * FROM customers JOIN addresses ON customers.id = addresses.customer_id;

--2 Get all orders and their line items.
SELECT * FROM line_items  JOIN orders ON line_items.order_id = orders.id;

--3 Which warehouses have cheetos?
SELECT warehouse.warehouse, products.description FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id J
OIN products ON warehouse_product.product_id = products.id WHERE products.description = 'cheetos';

--4 Which warehouses have diet pepsi?

SELECT warehouse.warehouse, products.description FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON warehouse_product.product_id = products.id WHERE products.description = 'diet pepsi';


--5 Get the number of orders for each customer.
--NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, customers.last_name, COUNT (orders.order_date) AS numberOfOrders
FROM customers JOIN addresses ON customers.id = addresses.customer_id
LEFT JOIN orders ON addresses.id = orders.address_id GROUP BY customers.id;


--6 How many customers do we have?
SELECT COUNT (customers.id) AS numberOfCustomers FROM customers;


--7 How many products do we carry?
SELECT COUNT (products.id) AS numberOfProducts FROM products;


--8 What is the total available on-hand quantity of diet pepsi?
SELECT  SUM (warehouse_product.on_hand) AS total_amount_of_diet_pepsi_on_hand
 FROM products JOIN warehouse_product ON products.id = warehouse_product.product_id
 WHERE products.description = 'diet pepsi';

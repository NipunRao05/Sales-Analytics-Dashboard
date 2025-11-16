LOAD DATA LOCAL INFILE 'cleaned_sales.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
IGNORE 1 ROWS
(customer_id, product_id, order_date, quantity, unit_price, discount, gross_amount, net_amount);

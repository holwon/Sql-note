SELECT
    CONCAT(first_name, ' ', last_name),
    coalesce (phone, 'Unknown')
FROM customers;

SELECT * FROM customers WHERE first_name REGEXP "a";

SELECT * FROM customers WHERE first_name REGEXP 'a';
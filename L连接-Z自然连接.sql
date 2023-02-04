use sql_store;

SELECT
    order_id,
    first_name,
    `address`
FROM orders o
    NATURAL JOIN customers c
ORDER BY order_id;
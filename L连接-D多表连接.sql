-- Active: 1664181687457@@192.168.137.205@3306@sql_store

use sql_store;

SELECT
    o.order_id,
    order_date,
    c.first_name,
    last_name,
    order_status_id as 'status'
FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    JOIN order_statuses os ON os.order_status_id = o.status;
-- Active: 1664181687457@@192.168.137.205@3306@sql_store

USE `sql_store`;

SELECT * FROM sys.host_summary;

SELECT *
FROM order_items oi
    JOIN sql_inventory.products p ON oi.product_id = p.product_id;
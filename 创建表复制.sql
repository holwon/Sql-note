-- Active: 1664181687457@@192.168.137.205@3306@sql_store

use sql_store;

-- 如果这样创建的话 mysql 不会为这样复制的表添加 PK(主键)或 AI(AUTO_INCREMENT)自动递增

-- CREATE TABLE orders_archived AS SELECT * FROM orders

DROP TABLE orders_archived;

CREATE TABLE orders_archived AS SELECT * FROM orders;

-- 清除表数据

TRUNCATE TABLE orders_archived;

INSERT INTO orders_archived
SELECT *
FROM orders
WHERE order_date < '2019-1-1';

SELECT * FROM orders_archived;
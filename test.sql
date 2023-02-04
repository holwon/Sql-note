-- Active: 1664181687457@@192.168.137.205@3306@sql_store
use sql_store;
-- USE sql_invoicing;
SELECT `points`,
    points + 10
FROM customers
ORDER BY first_name;
SELECT *
FROM customers;
-- MySql会把 string 类型的数据当成 0, 所以下面这条语句是和上面的效果相等的
-- 有可能会被人利用来做 "sql注入攻击"
-- 例如使用 OR '1=1' 这种恒等式, OR 是 boolean(布尔) 运算
SELECT *
FROM customers
WHERE last_name = 0;
-- JOIN ON练习
-- 注意: 此处的 products的 unit_price和 order_items的 unit_price的价格不同
-- 是因为价格会变动, order_items 的是用户下单时的单价
-- products的是现在的单价.
-- 在实际情况下, 做报表的适合很重要, 不然无法计算正常的销售
SELECT *
FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id;
SELECT *
FROM products;
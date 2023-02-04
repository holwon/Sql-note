use sql_store;

-- 这种内连接查询会丢失那些没有[订单]的客户信息

SELECT
    c.customer_id,
    c.first_name,
    order_id
FROM customers c
    JOIN orders o ON o.customer_id = c.customer_id
ORDER BY c.customer_id;

-- 可使用左连接, sql有两种外连接: 左连接和右连接

SELECT
    c.customer_id,
    c.first_name,
    order_id
FROM
    customers c -- LEFT OUTER JOIN 的 `OUTER`与 `INNER`一样可有可无
    LEFT OUTER JOIN orders o ON o.customer_id = c.customer_id
ORDER BY c.customer_id;

SELECT * FROM shippers ;

SELECT * FROM orders;

-- 多表外连接

SELECT
    c.customer_id,
    c.first_name,
    order_id,
    sh.shipper_id,
    sh.name shipper_name
FROM customers c
    LEFT OUTER JOIN orders o ON o.customer_id = c.customer_id
    LEFT JOIN shippers sh ON o.shipper_id = sh.shipper_id
ORDER BY c.customer_id;
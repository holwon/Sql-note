-- Active: 1664181687457@@192.168.137.205@3306@sql_store

use sql_store;

-- 默认是对id排序的, 现在规定对 first_name 排序

SELECT * FROM customers ORDER BY first_name;

-- Desc 降序, ASC 升序

SELECT * FROM customers ORDER BY first_name DESC;

-- 也可以 ORDER BY 数字, 其表示 SELECT 的第x列. 此用法比较容易看错出现失误, 应避免使用

-- 如此例中就是第一列和第二列, 即: first_name 和 last_name

SELECT first_name,last_name,10 AS points FROM customers ORDER BY 1,2;

-- [练习] 所有 order_id=2 的 总价降序 总价=quantity * unit_price

SELECT
    *,
    quantity * unit_price AS total_price
FROM order_items
WHERE order_id = 2
ORDER BY
    quantity * unit_price DESC;
-- 笛卡儿积

-- 隐式

SELECT c.first_name, p.name
FROM products p, customers c
ORDER BY c.first_name;

-- 显式

SELECT
    customers.first_name,
    products.name
FROM customers
    CROSS JOIN products
ORDER BY customers.first_name
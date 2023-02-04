-- LIMIT 要永远放在**最后**

SELECT * FROM customers LIMIT 5;

-- 也可以进行 `偏移量` 查找

-- 如: 跳过前 6 条记录如何获取 3 条记录. 即: 偏移量为 6

SELECT * FROM customers LIMIT 6, 3;
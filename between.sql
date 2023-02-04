-- Active: 1664181687457@@192.168.137.205@3306@sql_store

SELECT *
FROM customers
WHERE
    -- 这里日期还是要加 '引号' 否则会以为是除法
    -- 也可以使用 '1990-1-1', 此写法不加引号会以为是减法
    birth_date BETWEEN '1990/1/1' AND '2000/1/1'
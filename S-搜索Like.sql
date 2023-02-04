-- Active: 1664181687457@@192.168.137.205@3306@sql_store

-- [测试完毕] 不能用反引号代替单引号

-- [%] 匹配任意数目字符（包括零个字符）。 在MySQL中，SQL的模式缺省是忽略大小写的。

SELECT * FROM customers WHERE last_name LIKE 'b%' ;

-- “_”匹配任何单个字符

SELECT * FROM customers WHERE last_name LIKE '_____y';
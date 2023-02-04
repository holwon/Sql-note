use sql_store;

SELECT * FROM customers WHERE last_name LIKE '%field%';

--[RWGEXP] 与上方语句等同

SELECT * FROM customers WHERE last_name REGEXP 'field';

-- [^field] 表示必须以此 field 字符**开头**

SELECT * FROM customers WHERE last_name REGEXP '^field';

SELECT * FROM customers WHERE last_name REGEXP '^t';

SELECT * FROM customers WHERE last_name LIKE 't%';

-- [field$] 表示必须以 field 字符**结尾**

SELECT * FROM customers WHERE last_name REGEXP 'field$';

-- [field|mac] 表示字符串需包含 `field` 或 `mac`

SELECT * FROM customers WHERE last_name REGEXP 'field|mac';

SELECT * FROM customers WHERE last_name REGEXP '^field|mac|rose';

-- [gim]e 匹配含 ge, ie, me

SELECT * FROM customers WHERE last_name REGEXP '[gim]e';

-- [a-h]e 匹配含 a到h e

SELECT * FROM customers WHERE last_name REGEXP '[a-h]e';

-- 总结

-- `^` 匹配起始,

-- `$`匹配结尾,

-- `|` 逻辑或,

-- `[abcd]` 匹配括号内任意单字符

-- `[a-h]` 有 `-` 匹配一个范围
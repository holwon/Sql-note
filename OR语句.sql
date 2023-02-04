SELECT *
FROM customers
WHERE
    `state` = 'VA'
    OR `state` = 'GA'
    OR `state` = 'FL';

-- 上面可转换成

SELECT * FROM customers WHERE `state` IN('VA', 'GA', 'FL') ;
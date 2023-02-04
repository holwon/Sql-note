USE sql_store;

-- 创建事务所需的开头

START TRANSACTION;

INSERT INTO
    orders (
        customer_id,
        order_date,
        status
    )
VALUES (1, '2019-1-1', 1);

INSERT INTO order_items VALUES (LAST_INSERT_ID(),1,1,1);

-- 最后要用 COMMIT结束, mysql看见它时,

-- 会把所有更改写入数据库, 如果其中一个更改失败, 就会自动撤销之前的更改

COMMIT;

-- 某些情况下, 我们可能想进行些`错误检查`,

-- 并手动回退了事务

-- 我们可以使用 `ROLLBACK`语句, 而不是 `COMMIT`语句

-- ROLLBACK;--ROLLBACK会退回所有事物并撤销所有更改

/*
 MysqL会装好我们写在事务里的每一条语句 
 然后如果语句没有返回错误，它就会提交 
 所以我们有INSERT、 UPDATE或 DELETE吾句时 
 MySQL把它们装在事务里 然后自动提交 
 它由一个叫做自动提交的系统管控 
 */
-- 查看 自动提交 系统
 SHOW VARIABLES LIKE 'autocommit';
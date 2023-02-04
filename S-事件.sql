USE sql_invoicing;

-- 查看事件

-- 仅 MySQL

-- 查看Mysql所有`系统变量` 查询

SHOW VARIABLES LIKE 'event%';

-- 查询结果: 1 event_scheduler ON

-- 如果想要节约系统资源, 可以把他设为 OFF

SET GLOBAL event_scheduler = OFF;

SET GLOBAL event_scheduler = OFF;

DELIMITER $$

-- 以事件执行行的时间间隔开头命名

CREATE EVENT
    yearly_delete_state_audit_row ON SCHEDULE -- AT '2019-1-1'或
    -- EVERY 2 HOUR/DAY/YEAR [START '2019-1-1' ENDS '2029-1-1' ] START和ENDS 是可选参数
    EVERY 2 YEAR START '2019-1-1' ENDS '2029-1-1'
DO BEGIN
DELETE FROM payments_audit
WHERE
    action_date < NOW() - INTERVAL 1 YEAR;

END ;

-- END $$

DELIMITER;

SELECT * FROM payments;

DELETE FROM payments 
USE sql_invoicing;

DROP TRIGGER IF EXISTS `payments_after_insert`;

-- 这触器中我们可以修改任何表中的值除了这个触发器所在的表
-- 否则会无尽循环
-- 命名意义 触发器会关联到 payments 表, 并且是在 INSERT `以后`触发
CREATE TRIGGER payments_after_insert --
-- 也可 BEFORE UPDATE/DELETE. 具体看需求
AFTER
INSERT
    ON payments --
    -- FOR EACH ROW它的意思是这个触发器会作用于每一个受影响的行
    -- 有些 DBMS 还支持表级别的触发器, 只需要触发一次就可以了
    -- 所以如果你插入1行或者多行触发器也只会发动一次
    FOR EACH ROW BEGIN
UPDATE
    invoices
SET
    --这里要得到新的数据,即:新的付款额
    -- 所以要使用 New 关键字, 其会返回我们刚刚插入的行
    -- 还有的是 OLD 关键字 old关鍵字会返回更新前的行以及对应数值
    payment_total = payment_total + NEW.amount
WHERE
    invoice_id = NEW.invoice_id;

END;

-- Check ALL TRIGGER IN current DATABASE
SHOW TRIGGERS;

-- test TRIGGER
INSERT INTO
    payments
VALUES
    (DEFAULT, 5, 3, '2019-1-1', 10, 1);

SELECT
    *
FROM
    payments;

-- exercise
CREATE TRIGGER `payments_AFTER_DELETE`
AFTER
    DELETE ON payments FOR EACH ROW BEGIN
UPDATE
    invoices
SET
    payment_total = payment_total - OLD.amount
WHERE
    invoice_id = OLD.invoice_id;

END;

-- test
DELETE FROM
    payments
WHERE
    payment_id = 12;
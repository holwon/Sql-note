-- 触发器的另外一个用途就是为了之后的审计(类似日志log) 目的,
-- 而记录对数据库的修改
-- 比如, 当一个人增加或删除了某条记录时
-- 我们可以把这个操作记录下来
USE sql_invoicing;

-- [!NOTE:]
-- 在实际应用中, 我们或许需要为多张表记录更改
-- 那样不建议为数据库中每张表分别创建审计表. 重复劳动过多了!
-- 可以建立一个`总架构`来记录变更
--
-- payments的 audit(审计)表
CREATE TABLE payments_audit (
    client_id INT NOT NULL,
    date DATE NOT NULL,
    amount DECIMAL(9, 2) NOT NULL,
    action_type VARCHAR(50) NOT NULL,
    action_date DATETIME NOT NULL
);

--
-- DELIMITER $$ 
-- 路径 .\自己跟着写\T-TRIGGER 触发器.sql
CREATE TRIGGER payments_after_insert --
AFTER
INSERT
    ON payments FOR EACH ROW BEGIN
UPDATE
    invoices
SET
    payment_total = payment_total + NEW.amount
WHERE
    invoice_id = NEW.invoice_id;

INSERT INTO
    payments_audit
VALUES
    (
        NEW.client_id,
        NEW.date,
        NEW.amount,
        'INSERT',
        NOW()
    );

END;

CREATE TRIGGER `payments_AFTER_DELETE`
AFTER
    DELETE ON payments FOR EACH ROW BEGIN
UPDATE
    invoices
SET
    payment_total = payment_total - OLD.amount
WHERE
    invoice_id = OLD.invoice_id;

INSERT INTO
    payments_audit
VALUES
    (
        OLD.client_id,
        OLD.date,
        OLD.amount,
        'DELETE',
        NOW()
    );

END;

SHOW TRIGGERS;

DROP TRIGGER IF EXISTS `payments_after_insert`;

DROP TRIGGER IF EXISTS `payments_after_delete`;
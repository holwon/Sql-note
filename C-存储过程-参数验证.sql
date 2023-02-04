USE sql_invoicing;
DROP PROCEDURE IF EXISTS MAKE_PAYMENTS;
CREATE PROCEDURE MAKE_PAYMENTS(
    _invoice_id INT,
    _payment_amount DECIMAL(9, 2),
    -- 9位数, 小数有2位 
    _payment_date DATE
) BEGIN IF _payment_amount <= 0 --
-- 数值越界的状态码 也可设置描述信息
THEN SIGNAL SQLSTATE '22003'
SET MESSAGE_TEXT = 'Invalid payment amount';
END IF;
UPDATE invoices i
SET i.payment_total = _payment_amount,
    i.payment_date = _payment_date
WHERE i.invoice_id = _invoice_id;
END;
CALL `MAKE_PAYMENTS`(2, -100, '2019-1-1')
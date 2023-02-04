USE sql_invoicing;

SHOW TRIGGERS;

-- 一般把 DROP语句和 CREATE语句放在一起
DROP TRIGGER IF EXISTS payments_after_insert;

DROP TRIGGER IF EXISTS payments_after_delete;
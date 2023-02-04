USE sql_invoicing;

DROP PROCEDURE if EXISTS get_unpaid_invoices_for_client;

CREATE PROCEDURE `get_unpaid_invoices_for_client`(
    client_id INT,
    OUT invoice_count INT,
    OUT invoice_total decimal(9, 2)
) BEGIN --
-- 将 COUNT(*),SUM(invoice_total) 使用 INTO 关键字输出到 invoice_count,invoice_total
SELECT
    COUNT(*),
    SUM(i.invoice_total) INTO invoice_count,
    invoice_total
FROM
    invoices i
WHERE
    i.client_id = client_id
    AND payment_total = 0;

END;

SET
    @invoice_count = 0;

SET
    @invoice_total = 0;

CALL get_unpaid_invoices_for_client(3, @invoice_count, @invoice_total);

SELECT
    @invoice_count,
    @invoice_total;

-- 
SELECT
    COUNT(*),
    SUM(invoice_total)
FROM
    invoices i
WHERE
    client_id = 3
    AND payment_total = 0;
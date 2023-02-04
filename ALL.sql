use sql_invoicing;
SELECT *
FROM invoices
WHERE invoice_total > (
        SELECT MAX(invoice_total)
        FROM invoices
        WHERE client_id = 3
    );
-- ALL
SELECT invoice_id,
    `number`,
    payment_total,
    invoice_total
FROM invoices
WHERE invoice_total > ALL(
        SELECT invoice_total
        FROM invoices
        WHERE client_id = 3
    )
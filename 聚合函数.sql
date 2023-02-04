-- Active: 1664181687457@@192.168.137.205@3306@sql_invoicing
use sql_invoicing;

SELECT
    'First half of 2019' AS date_range,
    SUM(invoice_total) AS total_sale,
    SUM(payment_total) total_payments,
    SUM(invoice_total - payment_total) what_we_expect
FROM
    invoices
WHERE
    invoice_date BETWEEN '2019-1-1' AND '2019-6-30'
UNION
SELECT
    'Second half of 2019' AS date_range,
    SUM(invoice_total) AS total_sale,
    SUM(payment_total) total_payments,
    SUM(invoice_total - payment_total) what_we_expect
FROM
    invoices
WHERE
    invoice_date BETWEEN '2019-7-1' AND '2019-12-31'
UNION
SELECT
    'Total' AS date_range,
    SUM(invoice_total) AS total_sale,
    SUM(payment_total) total_payments,
    SUM(invoice_total - payment_total) what_we_expect
FROM
    invoices
WHERE
    invoice_date BETWEEN '2019-1-1' AND '2019-12-31'
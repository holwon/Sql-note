use sql_invoicing;

SELECT
    client_id,
    SUM(invoice_total) AS total_sales,
    COUNT(client_id) AS number_of_invoices --用户订单数
FROM
    invoices --
    -- 此处 WHERE是无法成功的, 因为 total_sales 是在最后面才计算出来的
    -- 所以需要使用 HAVING 子句, WHERE子句一般在分组前筛选数据
    -- WHERE total_sales > 500
GROUP BY client_id
HAVING
    total_sales > 500 -- HAVING 在分组后筛选数据
;

SELECT * FROM invoices;

-- 練習:

use sql_store;

/* 
 get the customer
 在 virginia
 消费超过 100$
 */

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    -- COUNT(order_id) AS COUNT_order,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM customers c
    JOIN orders USING(customer_id)
    JOIN order_items oi USING(order_id)
WHERE c.state = 'VA'
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING total_sales >= 100;

SELECT *
FROM customers
    JOIN orders USING(customer_id)
    JOIN order_items USING(order_id)
WHERE first_name REGEXP '^b';
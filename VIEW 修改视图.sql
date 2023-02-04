/* 两种方式 */

-- 1. 删除视图重建

use sql_invoicing;

DROP VIEW sale_by_client;

CREATE VIEW SALE_BY_CLIENT AS 
	SELECT
	    c.client_id,
	    c.name,
	    SUM(invoice_total) as total_sales
	FROM clients c
	    JOIN invoices USING(client_id)
	GROUP BY c.client_id, c.name
; 

-- 2. REPLACE关键字

CREATE OR REPLACE VIEW SALE_BY_CLIENT AS 
	SELECT
	    c.client_id,
	    c.name,
	    SUM(invoice_total) as total_sales
	FROM clients c
	    JOIN invoices USING(client_id)
	GROUP BY c.client_id, c.name
	ORDER BY total_sales DESC
; 
use sql_invoicing;

CREATE VIEW SALE_BY_CLIENT AS 
	SELECT
	    c.client_id,
	    c.name,
	    SUM(invoice_total) as total_sales
	FROM clients c
	    JOIN invoices USING(client_id)
	GROUP BY c.client_id, c.name
; 

SELECT * FROM sale_by_client;
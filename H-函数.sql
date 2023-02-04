CREATE FUNCTION GET_RISK_FACTOR_FOR_CLIENT(CLIENT_ID INT)
RETURNS INTEGER DETERMINISTIC BEGIN 
	DECLARE risk_factor DECIMAL (9, 2) DEFAULT 0;
	DECLARE invoice_total DECIMAL (9, 2);
	DECLARE invoices_count INT;
	SELECT
	    COUNT(*),
	    SUM(i.invoice_total) INTO invoices_count,
	    invoice_total
	FROM invoices i
	WHERE i.client_id = client_id;
	--
	SET risk_factor=invoice_total / invoices_count * 5;
	--
	RETURN IFNULL(risk_factor,0);
END; 

DROP FUNCTION IF EXISTS `GET_RISK_FACTOR_FOR_CLIENT`;

SELECT
    client_id,
    `name`,
    `GET_RISK_FACTOR_FOR_CLIENT`(client_id) as 'risk factor'
FROM clients;
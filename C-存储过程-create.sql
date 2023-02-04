use sql_invoicing;

-- DELIMITER $$ 可以把默认的分界符 `;` 改为 `$$`
CREATE PROCEDURE GET_CLIENTS() BEGIN
SELECT
	*
FROM
	clients;

END;

CALL `GET_CLIENTS`;

-- 在程序里这样调用即可
CALL `GET_CLIENTS`();

SELECT
	*
FROM
	payments
	JOIN payment_methods pym ON payment_method = payment_method_id;

CREATE VIEW INVOICES_WITH_BALANCE AS
SELECT
	*
FROM
	invoices
WHERE
	invoice_total - payment_total > 0;

SELECT
	*
FROM
	invoices_with_balance;

-- DELIMITER $$
CREATE PROCEDURE GET_INVOICES_WITH_BALANCE() BEGIN
SELECT
	*
FROM
	invoices_with_balance;

END;

--$$
-- DELIMITER;
CALL `GET_INVOICES_WITH_BALANCE`();

DROP PROCEDURE IF EXISTS `GET_INVOICES_WITH_BALANCE`;
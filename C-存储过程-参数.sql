USE sql_invoicing;

DROP PROCEDURE IF EXISTS `GET_CLIENTS_BY_STATE`;

-- DELIMITER $$ -- 可以把默认的分界符 `;` 改为 `$$` 
CREATE PROCEDURE GET_CLIENTS_BY_STATE(_STATE CHAR(2)) BEGIN IF _state IS NULL THEN
SET
	_state = 'CA';

END IF;

SELECT
	*
FROM
	clients c
WHERE
	c.`state` = state;

END;

-- DELIMITER ; 
CALL `GET_CLIENTS_BY_STATE`('CA');

CALL `GET_CLIENTS_BY_STATE`(NULL);

-- exercise 
CREATE PROCEDURE get_payments (
	_client_id INT,
	_payment_method_id TINYINT
) BEGIN
SELECT
	*
FROM
	payments
WHERE
	client_id = IFNULL(_client_id, client_id)
	AND payment_method = IFNULL(_payment_method_id, payment_method);

END;

CALL `GET_PAYMENTS`(1, NULL);
/* 这些变量在整个客户会话程中被保存
 客户关闭连接后, 这些变量又会被清空
 所以我们把它们称为
 "用户会话变量"(User session variables) */

SET @invoices_count = 0;

/* 还有的叫本地变量(Local variable)
 这些变量是我们可以储过程或者函数内定义的
 
 这些本地变量不会个客户端会话过程中被保存
 一旦我们的存储过程完成执行,
 这些变量就会被清除
 
 通常我们使用这类型变量在我们的存储过程中执行计算
 */

USE sql_invoicing;

SELECT * FROM invoices;

CREATE PROCEDURE `GET_RISK_FACTOR`() BEGIN 
	--  declare用来申明局部变量,set用来申明用户变量
	DECLARE risk_factor DECIMAL (9, 2) DEFAULT 0;
	DECLARE invoice_total DECIMAL (9, 2);
	DECLARE invoices_count INT;
	SELECT
	    COUNT(*),
	    SUM(i.invoice_total) INTO invoices_count,
	    invoice_total
	FROM invoices i;
	SET risk_factor=invoice_total / invoices_count * 5;
	SELECT risk_factor ;
END; 

DROP PROCEDURE IF EXISTS `GET_RISK_FACTOR`;

CALL `GET_RISK_FACTOR`();

SELECT * FROM clients FULL JOIN invoices;
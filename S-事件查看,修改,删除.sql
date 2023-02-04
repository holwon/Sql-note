USE sql_invoicing;

-- 查看所有事件

SHOW EVENTS;

SHOW EVENTS LIKE 'yearly_%';

DROP EVENT IF EXISTS yearly_delete_state_audit_row;

-- 也有修改语句, 和 CREATE语句语法相同

ALTER EVENT
    yearly_delete_state_audit_row ON SCHEDULE EVERY 2 DAY
DO BEGIN --
    -- DO STH
END;

-- 也可以用来暂时停用某一`事件`

ALTER EVENT yearly_delete_state_audit_row DISABLE;

ALTER EVENT yearly_delete_state_audit_row ENABLE;
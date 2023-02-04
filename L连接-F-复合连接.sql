-- 存在一种我们无法使用`id`来[唯一]确认表中的某一列的情况

use sql_store;

-- 如 order_items, 其需要 `order_id`与 `product_id`才能唯一确认

SELECT * FROM order_items;

SELECT * FROM order_item_notes;

-- order_item_notes 记录了每条订单的注释

SELECT *
FROM order_items oi
    JOIN order_item_notes oin ON oi.order_id = oin.order_Id AND oi.product_id = oin.product_id;
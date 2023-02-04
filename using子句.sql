use sql_store;

SELECT
    o.order_id,
    c.first_name,
    sh.name
FROM orders o
    JOIN customers c -- 
    -- ON o.customer_id = c.customer_id 
    -- 与上方 ON 效果相等, 必须加括号
    USING (customer_id)
    LEFT JOIN shippers sh USING (shipper_id);

SELECT *
FROM order_items oi
    JOIN order_item_notes oin --
    -- ON oi.order_id = oin.order_Id AND oi.product_id = oin.product_id;
    USING (order_Id, product_id)
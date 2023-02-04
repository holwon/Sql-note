use sql_store;

SELECT
    order_id,
    IFNULL(shipper_id, 'not assigned') AS shipper,
    COALESCE(
        shipper_id,
        comments,
        -- 如果 comments也是null,才 'not assigned'
        'not assigned'
    ) AS 'COALESCE_shipped',
    shipper_id
FROM orders
ORDER BY order_id;
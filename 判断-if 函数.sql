SELECT
    order_id,
    order_date,
    'active' AS 'status' -- 第一列决定列名
FROM orders
WHERE order_date >= '2019-1-1'
UNION
SELECT
    order_id,
    order_date,
    'achieved' as 'status'
FROM orders
WHERE order_date < '2019-1-1';

SELECT
    order_id,
    order_date,
    IF(
        YEAR(order_date) = YEAR(NOW()),
        'active',
        'achieved'
    )
FROM orders;

SELECT
    order_id,
    order_date,
    IF(
        YEAR(order_date) = YEAR(NOW()),
        'active',
        IF(
            order_date = '2019-1-30',
            'true',
            'false'
        )
    )
FROM orders;
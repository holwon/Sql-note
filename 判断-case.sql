use sql_store;

-- if

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

-- case

SELECT
    order_id,
    order_date,
    CASE
        WHEN YEAR(order_date) = YEAR(NOW()) THEN 'active'
        WHEN YEAR(order_date) = YEAR(NOW()) -1 THEN 'last year'
        WHEN YEAR(order_date) < YEAR(NOW()) -1 THEN 'archived'
        else 'Future'
    END as category
FROM orders;
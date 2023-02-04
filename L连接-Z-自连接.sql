use sql_hr;

-- 自连接

-- 此例子为员工表, 每个员工有自己的上司(上司为id显示). 上司也在此表中

SELECT * FROM employees;

-- 所以可以对此表进行自连接, 便可直接查看上司信息

SELECT
    e.first_name as 'e first_name',
    e.last_name as 'e last_name',
    managerinfo.first_name as 'Manager'
FROM employees e
    JOIN employees as managerinfo ON e.reports_to = managerinfo.employee_id;

-- 自外连接, 上面的查询会把CEO给漏掉

SELECT
    e.first_name as 'e first_name',
    e.last_name as 'e last_name',
    managerinfo.first_name as 'Manager'
FROM employees e
    LEFT JOIN employees as managerinfo ON e.reports_to = managerinfo.employee_id;
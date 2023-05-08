WITH RECURSIVE employee_levels AS (
    SELECT 1 AS level,
    employees.id,
    employees.first_name,
    employees.last_name,
    employees.manager_id
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT
    (1 + employee_levels.level) AS level,
    employees.id,
    employees.first_name,
    employees.last_name,
    employees.manager_id
    FROM employees
    INNER JOIN employee_levels 
    ON employees.manager_id = employee_levels.id)
SELECT level, id, first_name, last_name, manager_id FROM employee_levels;
/*

 Exercises on ordinary selects

 */

-- OEF. 1
SELECT *
FROM projects;

-- OEF. 2
SELECT project_name, department_id
FROM projects;

-- OEF. 3A
SELECT 'project' as text, project_id, 'is handled by' as text, department_id
FROM projects;

-- OEF. 3B
SELECT 'project', project_id, 'is handled by', department_id
FROM projects;

-- OEF. 3C
SELECT concat_ws(' ', 'project', project_id, 'is handled by', department_id) as "Projects with department"
FROM projects;

-- OEF. 4
SELECT current_date - birth_date -- Sees dates as numbers and performs an operation.
FROM FAMILY_MEMBERS;

-- OEF. 5A
SELECT employee_id, project_id, hours;

SELECT *
FROM TASK; -- These columns do not exist in table tasks.

SELECT department_id, manager_id, start_date
FROM DEPARTMENTS;

-- OEF. 5B
SELECT last_name, salary department_id
FROM EMPLOYEES;
-- SELECT last_name, salary department_id FROM EMPLOYEES; --

-- OEF. 6
SELECT DISTINCT initcap(location)
FROM employees
ORDER BY initcap(location);

-- OEF. 7
SELECT DISTINCT department_id, initcap(location)
FROM employees
ORDER BY initcap(location);

-- OEF. 8 (A,B,C)
SELECT current_date                                    "Date",
       ROUND(150 - (150 * 0.15), 2)                    "Calculation",
       'SQL ' || 'Data retrieval ' || 'Chapter 3-4' as "Best course";

-- OEF. 9
SELECT employee_id employee, name "NAME FAMILY MEMBER", relationship, gender
FROM family_members
WHERE employee_id = '999111111'
ORDER BY "NAME FAMILY MEMBER";

-- OEF. 10
SELECT *
FROM departments
WHERE department_name = 'Administration';

-- OEF. 11
SELECT employee_id, last_name, location
FROM EMPLOYEES
WHERE initcap(location) = 'Maastricht';

-- OEF. 12
SELECT employee_id, project_id, hours
FROM tasks
WHERE hours >= 20
  AND hours <= 35
  AND project_id = '10';

-- OEF. 13
SELECT project_id, hours
FROM tasks
WHERE employee_id = '999222222'
  AND hours < 10;

-- OEF. 14
SELECT employee_id, last_name, province
FROM employees
WHERE province IN ('GR', 'NB');

-- OEF. 15
SELECT department_id, first_name
FROM employees
WHERE first_name IN ('Suzan', 'Martina', 'Henk', 'Douglas')
ORDER BY department_id desc, first_name;

-- OEF. 16
SELECT last_name, salary, department_id
FROM employees
WHERE department_id = '7'
    AND salary < 40000
   OR employee_id = '999666666';

-- OEF. 17
SELECT last_name, department_id
FROM employees
WHERE location NOT IN ('Maarssen', 'Eindhoven')
ORDER BY last_name;

-- OEF. 18A
SELECT *
FROM tasks
ORDER BY hours NULLS FIRST;

-- OEF. 18B
SELECT *
FROM tasks
ORDER BY hours desc NULLS LAST;

-- OEF. 19
SELECT last_name, location, salary
FROM employees
WHERE initcap(location) SIMILAR TO 'M%|O%'
  AND salary > 30000;

-- OEF. 20
SELECT name, birth_date
FROM family_members
WHERE date_part('year', birth_date) IN ('1988');

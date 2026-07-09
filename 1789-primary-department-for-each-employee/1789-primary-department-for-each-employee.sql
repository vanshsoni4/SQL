# Write your MySQL query statement below
select employee_id,department_id
from employee 
where primary_flag = "y"
OR employee_id IN (
    SELECT employee_id
    FROM Employee
    GROUP BY employee_id
    HAVING COUNT(*) = 1
);

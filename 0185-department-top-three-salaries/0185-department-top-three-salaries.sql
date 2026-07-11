# Write your MySQL query statement below
SELECT
    d.name AS Department,
    r.name AS Employee,
    r.salary AS Salary
FROM (
    SELECT
        name,
        salary,
        departmentId,
        DENSE_RANK() OVER (
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS salary_rank
    FROM Employee
) r
JOIN Department d
ON r.departmentId = d.id
WHERE r.salary_rank <= 3;
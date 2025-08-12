-- A) find 3 second lowest salary from employee table
SELECT *
FROM employee
WHERE salary = (
    SELECT DISTINCT salary
    FROM employee
    ORDER BY salary ASC
    LIMIT 1 OFFSET 1
)
LIMIT 3;

-- B) find second lowest salary from employee table using sub query
SELECT MIN(salary) AS second_lowest_salary
FROM employee
WHERE salary > (
    SELECT MIN(salary)
    FROM employee
);

-- C) find pending balance from account table where result fulfill following conditions
--     a. show average pending balance
--     b. account should be active
--     c. grouping should be on open branch id
--     d. the branches on where PENDING_BALANCE is bellow 4300
SELECT OPEN_BRANCH_ID, AVG(PENDING_BALANCE) AS avg_pending_balance
FROM account
WHERE STATUS = 'ACTIVE'
GROUP BY OPEN_BRANCH_ID
HAVING AVG(PENDING_BALANCE) < 4300;

-- D) Write a pagination query and explain it
SELECT *
FROM employee
ORDER BY EMP_ID
LIMIT 5 OFFSET 5;
-- Explanation:
-- LIMIT 5 -> fetch 5 rows
-- OFFSET 5 -> skip the first 5 rows

-- E) Think you have a bank and many branches . You have a account table where multiple account from multiple branch.
-- table contains OPEN_BRANCH_ID . Write a query to find total number of branch including head branch
SELECT COUNT(DISTINCT OPEN_BRANCH_ID) AS total_branches
FROM account;

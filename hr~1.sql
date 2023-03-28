--사원번호가 176인 사람의 last_name 조회
--연봉이 12000 이상 되는 직원들의 last_name,salary 조회
--연봉이 5000에서 12000 범위가 아닌 사람들의 last_name, salary 조회
SELECT
    *
FROM
    employees;

SELECT
    last_name
FROM
    employees
WHERE
    employee_id = 176;

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 12000;

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary > 12000
    OR salary < 5000
ORDER BY
    salary DESC,
    last_name DESC;
    
SELECT DEPARTMENT_ID,LAST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID IN('20','50')ORDER BY LAST_NAME ;

SELECT LAST_NAME,SALARY,COMMISSION_PCT 
FROM EMPLOYEES 
WHERE commission_pct>0 ORDER BY SALARY DESC, commission_pct DESC;

SELECT * 
FROM EMPLOYEES 
WHERE SALARY NOT IN('2500','3500','7000') AND JOB_ID IN('SA_REP','ST_CLERK');

SELECT LAST_NAME,EMPLOYEE_ID,HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '2008-02-20' AND '2008-05-01'
ORDER BY HIRE_DATE DESC;

SELECT LAST_NAME,HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '2004-01-01' AND '2004-12-31'
ORDER BY HIRE_DATE ASC;

SELECT LAST_NAME,SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(20,50)AND SALARY BETWEEN 5000 AND 12000
ORDER BY SALARY;

SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '04%';

SELECT EMPLOYEE_ID,LAST_NAME
FROM employees
WHERE LAST_NAME LIKE '%u%';

SELECT LAST_NAME
FROM employees
WHERE LAST_NAME LIKE '___a%';

SELECT LAST_NAME
FROM employees
WHERE LAST_NAME LIKE '%a%' or LAST_NAME LIKE '%e%'
order by last_name;

SELECT LAST_NAME
FROM employees
WHERE LAST_NAME LIKE '%a%e%' or LAST_NAME LIKE '%e%a%'
order by last_name;

select last_name,job_id
from employees
where manager_id is null;
--distinct 중복제거!!!
select distinct department_id
from employees
where department_id is not null and job_id = 'ST_CLERK';

SELECT EMPLOYEE_ID,FIRST_NAME,JOB_ID,SALARY*COMMISSION_PCT commission
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL



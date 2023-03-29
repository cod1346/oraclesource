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
WHERE COMMISSION_PCT IS NOT NULL;


--------------------------------------------------------------------
select first_name,last_name,email,phone_number,lower(job_id)
from employees
where first_name = 'Curtis';

select employee_id,first_name,hire_date,replace (job_id, 'IT_PROG','프로그래머') JOB_ID
from employees
where department_id in(60,70,80,90);

select employee_id,first_name||' '||LAST_NAME,department_id,JOB_ID
from employees
where JOB_id in('AD_PRES','PU_CLERK');

--------------------------------------------------------
SELECT LAST_NAME,SALARY,
CASE TRUNC(SALARY/2000,0)
WHEN 0 THEN 0
WHEN 1 THEN 0.09
WHEN 2 THEN 0.20
WHEN 3 THEN 0.30
WHEN 4 THEN 0.40
WHEN 5 THEN 0.42
WHEN 6 THEN 0.44
ELSE 0.45 END
AS TAX_RATE
FROM employees
WHERE DEPARTMENT_ID = 80;

--회사 내의 최대 연봉 및 최소 연봉의 차이를 출력
select max(salALRY),min(salALRY),max(salALRY)-min(salALRY)
from EMPLOYEES;

--매니저로 근무하는 사원들의 총 숫자 출력(매니저 중복 제거)
select  COUNT(DISTINCT MANAGER_ID)
from EMPLOYEES;


SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal ASC;

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal;

SELECT
    *
FROM
    emp
ORDER BY
    empno ASC;

SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;

SELECT
    empno  AS employee_no,
    ename  AS employee_name,
    mgr    AS manager,
    sal    salary,
    comm   commission,
    deptno department_no
FROM
    emp
ORDER BY
    deptno DESC,
    ename ASC;

SELECT
    *
FROM
    emp
WHERE
    empno = 7782;
    
--부서번호가 30이고, 사원직책이 salesman 인 데이터 조회
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;

SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';

--집합연산자 : UNION(합집합-중복제거),UNION ALL(합집합-중복포함),MINUS(차집합),INTERSECT(교집합)
--IS NULL 연산자
--LIKE연산자와 와일드카드(_,%)
--BETWEEN A AND B 연산자
--IN 연산자
--논립부정연산자 : NOT

EMP테이블에서 급여 열에 12를 곱한값이 36000인 행 조회

SELECT * FROM EMP WHERE SAL *12 =36000;

SELECT * FROM EMP WHERE ENAME >='F' ORDER BY ENAME ASC;

SELECT * FROM EMP WHERE JOB = 'MANAGER' OR JOB ='SALESMAN' OR JOB ='CLERK';

SAL이 3000이 아닌 사원 조회

SELECT * FROM EMP WHERE SAL != 3000;

SELECT * FROM EMP WHERE JOB IN('MANAGER','SALESMAN','CLERK');

SELECT * FROM EMP WHERE DEPTNO IN('10','20');

SELECT * 
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

SELECT *
FROM EMP
WHERE ENAME NOT LIKE '%AM%';

SELECT *
FROM EMP
WHERE ENAME = 'S';

select * 
from emp
where mgr is not null;

select empno,ename,sal,deptno
from emp
where deptno=20
union all
select empno,ename,sal,deptno
from emp
where deptno=10;

select empno,ename,sal,deptno
from emp
minus
select empno,ename,sal,deptno
from emp
where deptno=10;

select empno,ename,sal,deptno
from emp
intersect
select empno,ename,sal,deptno
from emp
where deptno=10;


select *
from emp
where ename like '%S';

select empno,ename,sal
from emp
where deptno = 30 and job = 'SALESMAN' ORDER BY SAL DESC;

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
WHERE DEPTNO IN (20,30) AND SAL >2000;


SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
WHERE DEPTNO IN (20,30) 
INTERSECT
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
WHERE  SAL >2000;

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
WHERE ENAME LIKE '%E%' AND DEPTNO = 30 AND SAL BETWEEN 1000 AND 2000;

SELECT *
FROM EMP
WHERE COMM IS NULL AND MGR IS NOT NULL AND JOB IN('MANAGER','CLERK') AND ENAME NOT LIKE '_L%';


SELECT ENAME, UPPER(ENAME),LOWER(ENAME),INITCAP(ENAME) 
FROM EMP;

select ename, length(ename)
from emp;

select *
from emp
where length(ename)>=5;

--lengthb = 실제 사용하는 바이트
--dual : sys가 소유하는 테이블 (임시 연산이나 함수의 값 확인하는 용도)
select length('두두두글'),lengthb('한글루'),lengthb('ab'),lengthb('123'),lengthb('ㅂ')
from dual;

select job, substr(job,1,2),substr(job,3,2),substr(job,5),substr(job,-3)
from emp;

select substr(ename,1,1)
from emp;

select substr(ename,3)
from emp;

--instr : 문자열 데이터 안에서 특정 문자 위치 찾기
--instr(대상문자열 , 위츠를 찾으려는 문자열, 대상문자열에서 찾기를 시작할 위치(선택),
--      시작위치에서 찾으려는 문자가 몇번째인지 지정(선택))

select instr('hello,oracle!','l')as instr_1, instr('hello,oracle!','l','5')as instr_2,instr('hello,oracle!','l','2','2')as instr_3
from dual;

select '010-1234-5678' as 변경전, replace('010-1234-5678','-',' ')as replace_1, replace('010-1234-5678','-')as replace_2
from dual;

select '이것이 Oracle 이다' as 변경전, replace('이것이 Oracle 이다','이것이','This is')as 변경후
from dual;

select concat(empno,concat(' ',ename))
from emp;

select empno||ename,empno||':'||ename
from emp;

--trim,ltrim,rtrim : 공백제거
select '        이것이     ', trim('        이것이     ')from dual;
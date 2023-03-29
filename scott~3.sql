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

--EMP테이블에서 급여 열에 12를 곱한값이 36000인 행 조회

SELECT * FROM EMP WHERE SAL *12 =36000;

SELECT * FROM EMP WHERE ENAME >='F' ORDER BY ENAME ASC;

SELECT * FROM EMP WHERE JOB = 'MANAGER' OR JOB ='SALESMAN' OR JOB ='CLERK';

--SAL이 3000이 아닌 사원 조회

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

---------------------------------------------------------------------------------
SELECT ROUND(1234.5678)     AS ROUND,
        ROUND(1234.5678,0)     AS ROUND0,
        ROUND(1234.5678,1)     AS ROUND1,
        ROUND(1234.5678,2)     AS ROUND2,
        ROUND(1234.5678,-1)     AS ROUND_MINUS1,
        ROUND(1234.5678,-2) AS ROUND_MINUS2
FROM DUAL;

--TRUNC : 특정위치에서 버리는 함수
SELECT TRUNC(1234.5678)     AS TRUNC,
        TRUNC(1234.5678,0)     AS TRUNC0,
        TRUNC(1234.5678,1)     AS TRUNC1,
        TRUNC(1234.5678,2)     AS TRUNC2,
        TRUNC(1234.5678,-1)     AS TRUNC_MINUS1,
        TRUNC(1234.5678,-2) AS TRUNC_MINUS2
FROM DUAL;

SELECT CEIL(3.14), FLOOR(3.14) ,CEIL(-3.14),FLOOR(-3.14)
FROM DUAL;

SELECT SYSDATE, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW
FROM DUAL;

select sysdate, add_months(sysdate,3)
from dual;

select empno,ename,hiredate,add_months(hiredate,12*50)
from emp;
--months_between : 두 날짜 데이터 간의 날짜 차이를 개월수로 계산하여 출력
select empno,ename,hiredate
from emp
where months_between(sysdate,hiredate)<12*45;


select sysdate,add_months(sysdate,6)
from dual;

select empno,ename,hiredate,sysdate,
months_between(hiredate, sysdate) AS months1,
months_between(sysdate,hiredate) AS months1,
trunc(months_between(sysdate,hiredate)) AS months1
from emp;

select sysdate, next_day(sysdate,'월요일'),last_day(sysdate)
from dual;

select sysdate, 
round(sysdate,'CC') as format_CC,
round(sysdate,'YYYY') as format_YYYY,
round(sysdate,'DDD') as format_DDD,
round(sysdate,'HH') as format_HH
FROM DUAL;

SELECT EMPNO,ENAME,EMPNO+'500'
FROM EMP
WHERE ENAME='FORD';


SELECT EMPNO,ENAME,'-500'+EMPNO
FROM EMP
WHERE ENAME='FORD';

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DDD AMHH12:MI;SS') AS 현재날짜시간
FROM DUAL;
--숫자 자동형변환 가능
SELECT 1300-'1500','1300'+1500 FROM DUAL;

select 1300-replace('1,500',',')
from dual;
--숫자 자동형변환 불가능해서(,가 들어있으므로) 형변환 시킴
select to_number('1,300','9,999')-to_number('1,500','999,999')
from dual;

select sal
from emp;

select to_char(sal,'$999,999')||'$',to_char(sal,'L999,999')||'|'
from emp;--L(local) : 현재 사용하고있는 로컬 화폐단위

select 
    to_date('2018-07-14','yyyy-mm-dd') as todate1,
    to_date('2023.0320','yyyy-mm-dd') as todate2
from dual;
--
--select '2023-03-21'-'2023-02-01'
--from dual;

select to_date('2023-03-21')-to_date('2023-02-01')
from dual;

--널처리함수
--null+300 = null

--NVL(데이터,널일경우 반환할 값)
SELECT EMPNO,ENAME,SAL,COMM,
SAL+COMM,
NVL(SAL+COMM,0),
SAL+NVL(COMM,0)
FROM EMP;

--NVL2(데이터,널이아닐경우 반환할 값, 널일경우 반환할 값)
SELECT EMPNO,ENAME,SAL,COMM,SAL+COMM,
NVL2(COMM,'O','X'),
NVL2(COMM,SAL*12+COMM,SAL*12) AS ANNSAL
FROM EMP;

--DECODE함수/CASE문
--DECODE(검사 대상이 될 데이터, 조건1, 조건1이 일치할때 실행될 구문)

--직책이 MANAGER인 사람은 급여의 10% 인상,--SALESMAN 5%, ANALYST 그대로 나머지는 3%

SELECT EMPNO,ENAME,JOB,SAL,
DECODE(JOB,
'MANAGER',SAL*1.1,
'SALESMAN',SAL*1.05,
'ANALYST',SAL,
SAL*1.03) 
AS DECODE
FROM EMP;

SELECT EMPNO,ENAME,JOB,SAL,
CASE JOB
WHEN 'MANAGER' THEN SAL*1.1
WHEN 'SALESMAN' THEN SAL*1.05
WHEN 'ANALYST' THEN SAL
ELSE SAL*1.03 END
AS CASE
FROM EMP;


--월 21.5일 하루8시간
SELECT EMPNO,ENAME,SAL,
TRUNC(SAL/21.5,2)
AS DAY_PAY,
ROUND((SAL/21.5)/8,1)
AS TIME_PAY
FROM EMP;


--HIRE_DATE 
--ADD_MONTHS 3개월 후 첫 월요일
SELECT EMPNO,ENAME,HIREDATE,
NEXT_DAY(ADD_MONTHS(HIREDATE,3),'월요일')
AS R_JOB,
NVL2(COMM,TO_CHAR(COMM),'N/A')
AS COMM

--DECODE (COMM,
--NULL,'N/A',
--IS NOT NULL,TO_CHAR(COMM))
--AS TEST

--CASE 
--WHEN COMM IS NULL THEN 'N/A'
--WHEN COMM IS NOT NULL THEN TO_CHAR(COMM)
--END
--AS COMM

FROM EMP;
---------------------------------------------------
SELECT EMPNO,ENAME,MGR,
DECODE (SUBSTR(TO_CHAR(MGR),1,2),
NULL,'0000',
'75','5555',
'76','6666',
'77','7777',
'78','8888',
SUBSTR(TO_CHAR(MGR),1)
)
AS CHG_MGR
FROM EMP;



SELECT EMPNO,ENAME,MGR,
CASE 
WHEN MGR IS NULL THEN '0000'
WHEN SUBSTR(TO_CHAR(MGR),1,2)='75' THEN '5555'
WHEN SUBSTR(TO_CHAR(MGR),1,2)='76' THEN '6666'
WHEN SUBSTR(TO_CHAR(MGR),1,2)='77' THEN '7777'
WHEN SUBSTR(TO_CHAR(MGR),1,2)='78' THEN '8888'
ELSE TO_CHAR(MGR) END
AS CHG_MGR
FROM EMP;

--다중행 함수
SELECT SUM(SAL)
FROM EMP;

SELECT SUM(DISTINCT SAL),
SUM(ALL SAL),
SUM(SAL)
FROM EMP;

SELECT SUM(COMM)
FROM EMP;

SELECT distinct deptno, empno
from emp;

--null값은 제외하고 데이터 갯수 카운트
select count(comm)
from emp;

select count(*)
from emp
where deptno=30;

--부서번호가 20인 사원의 입사일 중 제일 최근 입사일
--date값의 max는 가장 최신 날짜,min은 가장 오래된 날짜
select max(hiredate)
from emp
where deptno=20;
--round 반올림 , trunc 버리기 ceil 무조건 올리기(정수값) ,floor 무조건 버리기(정수값)
select trunc(avg(sal),2)
from emp;

--부서별 SAL 평균 구하기
SELECT ROUND(AVG(SAL),2),DEPTNO 
FROM EMP
GROUP BY DEPTNO;

--부서별 추가수당 평균 구하기
SELECT AVG(COMM),DEPTNO
FROM EMP
GROUP BY DEPTNO;
--GROUP BY에 ENAME이 없으므로 틀린 표현식(DEPTNO만 있어야 됨)
--SELECT ROUND(AVG(SAL),2),DEPTNO ,ENAME
--FROM EMP
--GROUP BY DEPTNO;

--GROUP BY + HAVING : GROUP BY 절에 조건을 줄 때

--각 부서의 직책별 평균 급여 구하기(단 ,평균 급여가 2000 이상인 그룹만 출력)
SELECT DEPTNO,JOB ,AVG(SAL)
FROM EMP
GROUP BY DEPTNO,JOB HAVING AVG(SAL)>=2000
ORDER BY DEPTNO,JOB;

--각 부서의 직책별 평균 급여 구하기(단 ,평균 급여가 2000 이상인 그룹만 출력)
SELECT
DEPTNO,JOB ,
AVG(SAL)
FROM EMP
WHERE SAL <=3000
GROUP BY DEPTNO
,JOB HAVING AVG(SAL)>=2000
ORDER BY 
DEPTNO,JOB;


SELECT DEPTNO,
TRUNC(AVG(SAL),0)
AS AVG_SAL,--평균급여는 소수점을 제외하고 TRUNC(AVG(SAL),0) 
MAX(SAL)
AS MAX_SAL,--최고급여
MIN(SAL)
AS MIN_SAL,--최저급여
COUNT(DEPTNO)
AS CNT--부서의 사원수
FROM EMP
GROUP BY DEPTNO;

SELECT JOB,
COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(JOB)>=3;

SELECT 
TO_CHAR(HIREDATE,'YYYY')
AS HIRE_YEAR,
DEPTNO,
COUNT(*)
AS CNT
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY'),DEPTNO
ORDER BY DEPTNO;
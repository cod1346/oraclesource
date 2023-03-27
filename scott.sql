--scott

DESC emp;
DESC dept;

DESC salgrade;
--select : 데이터 조회

SELECT
    *
FROM
    emp;

SELECT
    empno,
    ename,
    sal
FROM
    emp;

DESC dept;

SELECT
    *
FROM
    dept;

SELECT
    deptno,
    loc
FROM
    dept;
    
desc emp;

select deptno from emp;

select distinct deptno from emp;

select distinct job,deptno from emp;

select job,deptno from emp;

select empno, ename, sal *12+comm as 연봉 from emp;

select empno 사원번호, ename 사원명,job "직 책", sal *12+comm as 연봉 from emp;
/*
    <SELECT>
    SELECT 가져오고 싶은 정보 FROM 테이블;
    SELECT (*) 또는 컬럼1, 컬럼2, 컬럼3... FROM테이블,
*/

--모든 사원의 정보를 보여줘
SELECT * FROM EMPLOYEE;

--모든 사원의 이름, 주민등록번호, 핸드폰번호
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE;

---------------------------------실습-------------------------
--JOB테이블의 직급명 컬럼만 조회
SELECT JOB_NAME FROM JOB;


--DEPARTMENT 테이블의 모든 컬럼 조회

SELECT * FROM DEPARTMENT;

--DEPARTMENT 테이블의 부서코드, 부서명 조회

SELECT DEPT_ID, DEPT_TITLE FROM DEPARTMENT;

--employee 테이블의 사원명, 이메일, 전화번호, 입사일, 급여 조회

SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE, SALARY FROM EMPLOYEE;

--<컬럼값을 통한 산술연산>
--SELECT절 컬럼명 작성부분에 산술연산을 할 수 있다.

--EMPLOYEE테이블의 사원명, 사원의 연봉(SALARY * 12)을 조회
SELECT EMP_NAME, SALARY *12
FROM EMPLOYEE;

-- EMPLOYEE 테이블의 사원명, 급여, 보너스, 연봉, 보너스포함 연봉 조회(급여 + (급여 + 보너스)) *12

SELECT EMP_NAME, SALARY, BONUS, SALARY *12, (SALARY + (SALARY + BONUS)) * 12
FROM EMPLOYEE;
-- 산술연산 과정중에 NULL데이터가 포함되어 있다면 무조건 결과값은 NULL

-- 사원명, 입사일, 근무일수를 조회
-- 현재시간 - 입사일 = 근무한 시간 
--DATE - DATE => 결과는 무조건 1로 표시가 된다.
--코드 실행시 날짜를 표시하는 상수 : SYSDATE [년/월/일/시/분/초]
SELECT EMP_NAME, HIRE_DATE, SYSDATE-HIRE_DATE
FROM EMPLOYEE;


SELECT SYSDATE FROM DUAL;
-- DUAL : 오라클에서 제공해주는 가상데이터 테이블(더미데이터)

/*
    <컬럼명에 별칭 지정하기>
    산술연산을 하게되면 컬럼명이 지저분해진다. 이때 컬럼명에 별칭을 부여해서 깔끔하게 가져올 수 있다.
    [표현법]
    컬럼명 별칭 / 컬럼명 as 별칭 / 컬럼명 "별칭" / 컬럼명 as "별칭"
*/

SELECT EMP_NAME 사원명, SALARY AS 급여, BONUS "보너스", SALARY * 12 AS "연봉(원)",
       (SALARY + (SALARY + BONUS)) * 12 AS "총소득"
FROM EMPLOYEE;

/*
    <리터럴> 
    임의로 지정한 문자열('')
    조회된 결과(RESULT SET)의 모든 행에 반복적으로 출력
*/


--EMPLOYEE 테이블의 사번, 사원명, 급여
SELECT EMP_ID, EMP_NAME, SALARY ||'원', '원' AS "단위"
FROM EMPLOYEE;

/*
    <연결연산자 : || >
    여러 컬럼값들을 마치 하나의 컬럼처럼 연결 할 수 있다. 
*/

--사번, 이름, 급여를 하나의 컬럼으로 조회
SELECT EMP_ID || EMP_NAME || SALARY
FROM EMPLOYEE;

--EMPLOYEE 테이블에서 모든 사원의 월급을 조회한다.
-- 다음과 같이 결과가 나오도록 출력하라
-- XX의 월급은 XX원입니다.

SELECT EMP_NAME || '의 월급은' || SALARY || '원입니다.' AS "급여" 
FROM EMPLOYEE;

/*
    <DISTINCT>
    중복제거 - 컬럼에 표시된 값들을 한번씩만 조회하고자 할 때 사용
*/

--EMPLOYEE 직급코드 조회
SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;

--EMPLOYEE 부서코드를 조회(중복제거)
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;

--SELECT DISTINCT JOD_CODE, DISTINCT DEPT_CODE
--위처럼 작성하면 에러가 발생한다. DISTINCT는 한번만 사용이 가능하다.
SELECT DISTINCT JOB_CODE, DEPT_CODE
--위처럼 사용시 (JOB_CODE, DEPT_CODE)를 쌍으로 묶어서 중복을 제거한다.
FROM EMPLOYEE;
-- 서브쿼리가 필요한 이유
-- 예를 들어 길동의 급여보다 많은 급여를 받는 사람을 검색하라
-- 한번의 질의 구문으로 해결할 수 없을 때 두번의 질의가 필요하다.
-- 이를 하나의 질의 구문으로 구성할 때 서브쿼리를 구성한다.

/* 서브쿼리의 형식
SELECT select_list
FROM table명
WHERE 표현식 연산자 (
      SELECT select_list
      FROM table명
      WHERE 조건식 ) ;
*/
select last_name, salary
from employees
where salary > 17000;

-- 위에 정보를 포함하여 서브쿼리 조건에 맞춰 작성한 것
SELECT last_name
FROM employees
WHERE salary > (
      SELECT salary 
      FROM employees
      WHERE last_name = 'Kochhar');

-- 부서가 101번 사원과 같고, 급여가 141번 사원보다 많은 직원을 검색한 것
SELECT last_name, department_id, salary 
FROM employees
WHERE department_id = (
      SELECT department_id
      FROM employees
      WHERE employee_id = 101)
AND salary > (
      SELECT salary
      FROM employees
      WHERE employee_id = 141);

-- 가장 많은 급여를 받는 직원의 이름과 급여를 검색한 것(그룹함수 MAX 이용)
SELECT last_name, salary 
FROM employees
WHERE salary = (
     SELECT MAX (salary)
     FROM employees);

-- 부서별 최저 급여를 출력하되 60부서의 최저 급여보다는 큰 값만 검색하라(Having절에서 서브 쿼리 사용)
-- 서브쿼리를 사용하지 않고 한다면 먼저, 부서 아이디가 60인 부서의 최저 급여를 검색한다.
select min(salary)
from employees
where department_id = 60;

-- 그 다음, 앞서 검색의 값보다 큰 최소금여를 갖는 부서명과 그 부서의 최소 급여를 출력한다.
select department_id, min (salary)
from employees
group by department_id
having min(salary) > 4200;

-- 동일한 질의를 서브쿼리를 이용한다면,
SELECT department_id, MIN (salary) 
FROM employees
GROUP BY department_id
HAVING MIN (salary) > (
    SELECT MIN (salary)
    FROM employees
    WHERE department_id = 60);
    
-- ANY 비교연산자는 "그 안에 있는 값 하나라도" 라는 뜻이다.
-- ALL 비교연산자는 "그 안에 있는 값 모두 다" 라는 뜻이다.
-- 급여 < ANY(100, 200, 300) 이면 최대인 300보다 작은 값
-- 급여 < ALL(100, 200, 300) 이면 110값은 100에 만족하지 못하므로 쓰지 못하는 값이다.

-- 부서 아이디를 찾는 것
select distinct department_id
from employees;

-- 서브쿼리
   select department_id, max (salary)
        from employees
        group by department_id ;
        
-- 다중행 서브쿼리
select last_name, salary
from employees
where salary in(
    select max (salary)
        from employees
        group by department_id );

SELECT last_name, job_id, salary 
FROM employees
WHERE salary < ANY(
      SELECT salary
      FROM employees
      WHERE job_id = 'IT_PROG') 
AND job_id <> 'IT_PROG';
-- <>은 아니다 라는 뜻이고 다른 표현으로는 != 라고 써도 무방하다.
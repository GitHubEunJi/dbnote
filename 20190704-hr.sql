-- ���������� �ʿ��� ����
-- ���� ��� �浿�� �޿����� ���� �޿��� �޴� ����� �˻��϶�
-- �ѹ��� ���� �������� �ذ��� �� ���� �� �ι��� ���ǰ� �ʿ��ϴ�.
-- �̸� �ϳ��� ���� �������� ������ �� ���������� �����Ѵ�.

/* ���������� ����
SELECT select_list
FROM table��
WHERE ǥ���� ������ (
      SELECT select_list
      FROM table��
      WHERE ���ǽ� ) ;
*/
select last_name, salary
from employees
where salary > 17000;

-- ���� ������ �����Ͽ� �������� ���ǿ� ���� �ۼ��� ��
SELECT last_name
FROM employees
WHERE salary > (
      SELECT salary 
      FROM employees
      WHERE last_name = 'Kochhar');

-- �μ��� 101�� ����� ����, �޿��� 141�� ������� ���� ������ �˻��� ��
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

-- ���� ���� �޿��� �޴� ������ �̸��� �޿��� �˻��� ��(�׷��Լ� MAX �̿�)
SELECT last_name, salary 
FROM employees
WHERE salary = (
     SELECT MAX (salary)
     FROM employees);

-- �μ��� ���� �޿��� ����ϵ� 60�μ��� ���� �޿����ٴ� ū ���� �˻��϶�(Having������ ���� ���� ���)
-- ���������� ������� �ʰ� �Ѵٸ� ����, �μ� ���̵� 60�� �μ��� ���� �޿��� �˻��Ѵ�.
select min(salary)
from employees
where department_id = 60;

-- �� ����, �ռ� �˻��� ������ ū �ּұݿ��� ���� �μ���� �� �μ��� �ּ� �޿��� ����Ѵ�.
select department_id, min (salary)
from employees
group by department_id
having min(salary) > 4200;

-- ������ ���Ǹ� ���������� �̿��Ѵٸ�,
SELECT department_id, MIN (salary) 
FROM employees
GROUP BY department_id
HAVING MIN (salary) > (
    SELECT MIN (salary)
    FROM employees
    WHERE department_id = 60);
    
-- ANY �񱳿����ڴ� "�� �ȿ� �ִ� �� �ϳ���" ��� ���̴�.
-- ALL �񱳿����ڴ� "�� �ȿ� �ִ� �� ��� ��" ��� ���̴�.
-- �޿� < ANY(100, 200, 300) �̸� �ִ��� 300���� ���� ��
-- �޿� < ALL(100, 200, 300) �̸� 110���� 100�� �������� ���ϹǷ� ���� ���ϴ� ���̴�.

-- �μ� ���̵� ã�� ��
select distinct department_id
from employees;

-- ��������
   select department_id, max (salary)
        from employees
        group by department_id ;
        
-- ������ ��������
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
-- <>�� �ƴϴ� ��� ���̰� �ٸ� ǥ�����δ� != ��� �ᵵ �����ϴ�.
-- JOIN QUARY
    -- department_id�� �� ���̺� ��� �����ϴ� Ű �̱� ������, �ҷ������� �̸�.columnname���� �����ؾ��Ѵ�.
    -- join quary�� ����Ҷ� �ܼ� �����ع�����, ��ȸ�ϴ� ���x �ٸ����̺��� ���� ���� ������ ����� ����ŭ �����ȴ�.
    -- �׷��� �߰������� and �κ��� ���� ������ �߰��ؼ� �����ش�.
    SELECT e.employee_id, e.first_name, e.last_name, d.department_id      -- ���̺��̸�.columnname���� select
       FROM employees e, departments d                                              -- ���̺� �̸�����
       WHERE employee_id='100'
       AND e.department_id=d.department_id ;
   
   
   
-- GROUP BY
SELECT department_id, SUM(salary) 
FROM employees
GROUP by department_id
ORDER by department_id desc;


-- [[[[[[[[[        SQL�Լ�        ]]]]]]]]]]]]]]]
-- Į���� ���̳� ������ Ÿ���� �����ϴ� ���. �࿡ ���� ���踦 �ϴ� ���
-- https://www.tutorialspoint.com/sql/sql-useful-functions.htm
  
    -- ���� �� �Լ�
    -- lower �빮�ڸ� �ҹ��ڷ� ��ȯ / upper �ҹ��ڸ� �빮�ڷ� ��ȯ
    
    -- �ձ��ڸ� �빮�ڸ����
    SELECT initcap(email) FROM employees;
    
    -- �빮�ڷ� ��ȯ
    SELECT upper(email) as email FROM employees;
    
    -- �ҹ��ڷ� ��ȯ
    SELECT lower(email) as email FROM employees;
   
   -- LENGTHB / LENGTH �ش� Į�� ���ڼ�
    SELECT email, LENGTHB(email) FROM employees;
    SELECT email, LENGTH(email) FROM employees;
    
    -- �� ���ڿ� ���� concat
    SELECT CONCAT(CONCAT(first_name,' '), last_name AS name FROM employees;
    
    --SUBSTR (columnname|ǥ����, n, m) n��°���� (m��) ���� / m �Ⱦ��� ����������.���� 
    SELECT email, SUBSTR(email, 2, 2) FROM employees;
    
    --INSTR (columnname, 'str') Ư������'str'�� �˻��ؼ� ������ġ�� ��ȯ ����.
    SELECT email, INSTR(email, 'L') FROM employees;
    
    --RPAD/LPAD (coulm, n, 'str') �ش� Į���� n�ڸ�����ŭ ������� 'str'�� RPAD�� �������� LPAD�� ������ ä��
    SELECT email, length(email), LPAD(email, 10, '-') FROM employees;
    
    --TRIM/RTRIM/LTRIM : ��������
    SELECT email, TRIM('AB') FROM employees;
    
    -- �Ǽ� ó�� �Լ�
    -- ROUND(colum, n)  n° �ڸ����� �ݿø�
    SELECT ROUND(3.141592, 1) AS ���� FROM dual;
    
    --CEIL �ø�
    SELECT CEIL(3.141592) AS ���� FROM dual;
    
    -- FLOOR ����
    SELECT FLOOR(3.141592) AS ���� FROM dual;
    
    -- TRUNC (colum, n)  n° �ڸ������� ǥ��. ������ ����.
    SELECT FLOOR(3.141592, 2) AS ���� FROM dual;
    
    -- MOD(n, m) n�� m���� ������ �� ������ = 10 % 3
    SELECT MOD(10, 3) AS ���� FROM dual;
    
    -- ��¥
    -- ��¥ �ø��� ���̱�
    SELECT hire_date, hire_date+1, hire_date-1 FROM employees;
    
    -- ��¥����
    SELECT TO_DATE('20/12/10') - TO_DATE('20/11/2') FROM dual;
    
    -- �ý��۳�¥
    SELECT sysdate FROM dual;
    
    -- COUNT - �����Ͱ� ����ִ� ĭ�� ��..(null)�ȼ�..
    SELECT COUNT(manager_id) FROM employees;
    SELECT COUNT(*) FROM employees;    --employees�ȿ������ �������� �Ѱ��� (Į���̸��𸦶�)
    
    SELECT TO_CHAR(TO_DATE('06/10' 'yyyy-mm')), TO_DATE('06/10' 'yyyy-mm')FROM dual;
    SELECT TO_NUMBER('10000')+10 FROM dual;
    
    -- NVL - ���ڳ�, ������ null���� ��ü�Ͽ� ǥ���Ѵ�.
    SELECT salary, NVL(salary*commission_pct, 0) as comm, NVL(salary*commission_pct, 0) �հ� FROM employees;
    SELECT 'null', NVL(null, 'empty') from dual;
    
    -- NVL2 - null �϶�, �ƴҶ� �Ѵ� ��������
    SELECT NVL2(null, 'not null��', 'null��') from dual;
    
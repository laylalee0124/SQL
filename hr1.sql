-- JOIN QUARY
    -- department_id가 두 테이블에 모두 존재하는 키 이기 때문에, 불러오려면 이름.columnname으로 접근해야한다.
    -- join quary를 사용할때 단순 연결해버리면, 조회하는 대상x 다른테이블의 같은 조건 갯수의 경우의 수만큼 복제된다.
    -- 그래서 추가적으로 and 부분의 조건 쿼리를 추가해서 맞춰준다.
    SELECT e.employee_id, e.first_name, e.last_name, d.department_id      -- 테이블이름.columnname으로 select
       FROM employees e, departments d                                              -- 테이블 이름설정
       WHERE employee_id='100'
       AND e.department_id=d.department_id ;
   
   
   
-- GROUP BY
SELECT department_id, SUM(salary) 
FROM employees
GROUP by department_id
ORDER by department_id desc;


-- [[[[[[[[[        SQL함수        ]]]]]]]]]]]]]]]
-- 칼럼의 값이나 데이터 타입을 변경하는 경우. 행에 대한 집계를 하는 경우
-- https://www.tutorialspoint.com/sql/sql-useful-functions.htm
  
    -- 단일 행 함수
    -- lower 대문자를 소문자로 변환 / upper 소문자를 대문자로 변환
    
    -- 앞글자만 대문자만들기
    SELECT initcap(email) FROM employees;
    
    -- 대문자로 전환
    SELECT upper(email) as email FROM employees;
    
    -- 소문자로 전환
    SELECT lower(email) as email FROM employees;
   
   -- LENGTHB / LENGTH 해당 칼럼 글자수
    SELECT email, LENGTHB(email) FROM employees;
    SELECT email, LENGTH(email) FROM employees;
    
    -- 두 문자열 결합 concat
    SELECT CONCAT(CONCAT(first_name,' '), last_name AS name FROM employees;
    
    --SUBSTR (columnname|표현식, n, m) n번째부터 (m개) 추출 / m 안쓰면 마지막까지.추출 
    SELECT email, SUBSTR(email, 2, 2) FROM employees;
    
    --INSTR (columnname, 'str') 특정문자'str'을 검색해서 시작위치를 반환 해줌.
    SELECT email, INSTR(email, 'L') FROM employees;
    
    --RPAD/LPAD (coulm, n, 'str') 해당 칼럼을 n자리수만큼 빈공간을 'str'로 RPAD는 오른쪽을 LPAD는 왼쪽을 채움
    SELECT email, length(email), LPAD(email, 10, '-') FROM employees;
    
    --TRIM/RTRIM/LTRIM : 공백제거
    SELECT email, TRIM('AB') FROM employees;
    
    -- 실수 처리 함수
    -- ROUND(colum, n)  n째 자리까지 반올림
    SELECT ROUND(3.141592, 1) AS 숫자 FROM dual;
    
    --CEIL 올림
    SELECT CEIL(3.141592) AS 숫자 FROM dual;
    
    -- FLOOR 버림
    SELECT FLOOR(3.141592) AS 숫자 FROM dual;
    
    -- TRUNC (colum, n)  n째 자리까지만 표현. 나머지 버림.
    SELECT FLOOR(3.141592, 2) AS 숫자 FROM dual;
    
    -- MOD(n, m) n을 m으로 나눈고 난 나머지 = 10 % 3
    SELECT MOD(10, 3) AS 숫자 FROM dual;
    
    -- 날짜
    -- 날짜 늘리기 줄이기
    SELECT hire_date, hire_date+1, hire_date-1 FROM employees;
    
    -- 날짜연산
    SELECT TO_DATE('20/12/10') - TO_DATE('20/11/2') FROM dual;
    
    -- 시스템날짜
    SELECT sysdate FROM dual;
    
    -- COUNT - 데이터가 들어있는 칸만 셈..(null)안셈..
    SELECT COUNT(manager_id) FROM employees;
    SELECT COUNT(*) FROM employees;    --employees안에저장된 데이터의 총갯수 (칼럼이름모를때)
    
    SELECT TO_CHAR(TO_DATE('06/10' 'yyyy-mm')), TO_DATE('06/10' 'yyyy-mm')FROM dual;
    SELECT TO_NUMBER('10000')+10 FROM dual;
    
    -- NVL - 숫자나, 문자의 null값을 대체하여 표현한다.
    SELECT salary, NVL(salary*commission_pct, 0) as comm, NVL(salary*commission_pct, 0) 합계 FROM employees;
    SELECT 'null', NVL(null, 'empty') from dual;
    
    -- NVL2 - null 일때, 아닐때 둘다 설정가능
    SELECT NVL2(null, 'not null임', 'null임') from dual;
    
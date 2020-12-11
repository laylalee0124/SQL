-- TABLE생성
CREATE table test(
NO NUMBER primary key,
NAME VARCHAR2(20),
SAL number
);

-- TEST 테이블 구조 확인
DESC TEST;

-- 첫번째 데이터를 컬럼명 표현 x하지말고 순선대로 넣기.
INSERT INTO test
VALUES (1, '차승원', 2000);
INSERT INTO test (no, name, sal)
VALUES (2, '유해진', 2500);
INSERT INTO test (no, name, sal)
VALUES (3, '손호준', 1500);

--현재 test 테이블의 데이터 조회
SELECT * FROM test;

--No 1인 데이터의 sal을 2500으로 변경
UPDATE test
SET sal = 2500
WHERE no =1;

-- sal이 2000미만인 데이터의 모든 컬럼 조회
SELECT * FROM test
WHERE sal<2000;

--sal이 2000이상의 데이터의 sal 값을 3000으로 변경. 모든 데이터를 조회하기.
UPDATE test
SET sal = 3000
WHERE sal>=2000;
SELECT * FROM test;

--test의 모든 데이터를 삭제하시오
DELETE FROM test;

--transaction 종료
commit;


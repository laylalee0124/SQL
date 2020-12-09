insert into member (ID, PW, name, email, reg_date) 
    VALUES ('what', '3', 'what', 'what@naver.com', sysdate);

--일반적인 패턴 (쿼리)  
insert into member
    VALUES ('what1', '3', 'what1', 'what@naver.com', sysdate);
    
--null을 허용하는 column이 있다면 아래와 같이 해당부분 생략하고 데이터입력도 가능.
insert into member  (ID, PW, name, reg_date) 
    VALUES ('what2', '3', 'what1', sysdate);

--멤버테이블에서 모든 데이터를 뽑아서 보여달라는 쿼리
select * from member;

--멤버테이블에서 열거한 데이터를 뽑아서 보여달라는 쿼리
select id, pw, name, email, reg_date from member;

--column명 뒤에 as 를 쓰면 해당 column이름을 바꿔줌. as대신 띄워 쓰기도 가능
select id as 아이디, pw  비번, name, email, reg_date from member;

--member의 별칭을 정해줬으면 static way로 접근해줄수도 됨. m.id / m.pw 등.
select m.id, m.pw, name, email, reg_date from member m;

-- WHERE절 : 조건을 붙여서 select하는 기능
select *from member     WHERE id='what2';
select *from member     WHERE name='ID1';

--정보 업데이트
update member
set email='update@naver.com'       WHERE id='ID1'; 

-- 특정 정보 삭제
DELETE FROM member      WHERE id='ID1';

--확정    
commit;
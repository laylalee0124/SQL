--[Day 1210]

--SEQUANCE
-- 넘버링 매길때 사용하면 좋다.
-- sequance_board에서 nextval을 통해 특정 정보를 뽑아옴
select seq_board.nextval from dual;
select seq_board.currval from dual;

insert into board
    VALUES (seq_board.nextval, '제목', '내용', SYSDATE, 0, '작성자');

SELECT * FROM board
order by no;



--SUBQUARY
--  https://www.tutorialspoint.com/sql/sql-sub-queries.htm
-- ROWNUM 사용시 주의할 내용  쿼리에서 나온 결과(b)가 조회의 대상이 되어야 한다.
-- 줄 순서 대로 대로 출력. / 새칼럼만들면서 기존칼럼 다 표시하고싶으면 일일히 나열하지말고, board에 이름 지정해서 해당변수로 b.*접근

select no,subject, content,c_data,count,writer from 
    (select ROWNUM rn, b.* from 
        (select * from board order by no desc) b
    ) c
where rn between 1 and 15
order by no desc;



--[Day 1210]

--SEQUANCE
-- �ѹ��� �ű涧 ����ϸ� ����.
-- sequance_board���� nextval�� ���� Ư�� ������ �̾ƿ�
select seq_board.nextval from dual;
select seq_board.currval from dual;

insert into board
    VALUES (seq_board.nextval, '����', '����', SYSDATE, 0, '�ۼ���');

SELECT * FROM board
order by no;



--SUBQUARY
--  https://www.tutorialspoint.com/sql/sql-sub-queries.htm
-- ROWNUM ���� ������ ����  �������� ���� ���(b)�� ��ȸ�� ����� �Ǿ�� �Ѵ�.
-- �� ���� ��� ��� ���. / ��Į������鼭 ����Į�� �� ǥ���ϰ������ ������ ������������, board�� �̸� �����ؼ� �ش纯���� b.*����

select no,subject, content,c_data,count,writer from 
    (select ROWNUM rn, b.* from 
        (select * from board order by no desc) b
    ) c
where rn between 1 and 15
order by no desc;



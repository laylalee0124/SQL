insert into member (ID, PW, name, email, reg_date) 
    VALUES ('what', '3', 'what', 'what@naver.com', sysdate);

--�Ϲ����� ���� (����)  
insert into member
    VALUES ('what1', '3', 'what1', 'what@naver.com', sysdate);
    
--null�� ����ϴ� column�� �ִٸ� �Ʒ��� ���� �ش�κ� �����ϰ� �������Էµ� ����.
insert into member  (ID, PW, name, reg_date) 
    VALUES ('what2', '3', 'what1', sysdate);

--������̺��� ��� �����͸� �̾Ƽ� �����޶�� ����
select * from member;

--������̺��� ������ �����͸� �̾Ƽ� �����޶�� ����
select id, pw, name, email, reg_date from member;

--column�� �ڿ� as �� ���� �ش� column�̸��� �ٲ���. as��� ��� ���⵵ ����
select id as ���̵�, pw  ���, name, email, reg_date from member;

--member�� ��Ī�� ���������� static way�� �������ټ��� ��. m.id / m.pw ��.
select m.id, m.pw, name, email, reg_date from member m;

-- WHERE�� : ������ �ٿ��� select�ϴ� ���
select *from member     WHERE id='what2';
select *from member     WHERE name='ID1';

--���� ������Ʈ
update member
set email='update@naver.com'       WHERE id='ID1'; 

-- Ư�� ���� ����
DELETE FROM member      WHERE id='ID1';

--Ȯ��    
commit;
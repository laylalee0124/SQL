-- TABLE����
CREATE table test(
NO NUMBER primary key,
NAME VARCHAR2(20),
SAL number
);

-- TEST ���̺� ���� Ȯ��
DESC TEST;

-- ù��° �����͸� �÷��� ǥ�� x�������� ������� �ֱ�.
INSERT INTO test
VALUES (1, '���¿�', 2000);
INSERT INTO test (no, name, sal)
VALUES (2, '������', 2500);
INSERT INTO test (no, name, sal)
VALUES (3, '��ȣ��', 1500);

--���� test ���̺��� ������ ��ȸ
SELECT * FROM test;

--No 1�� �������� sal�� 2500���� ����
UPDATE test
SET sal = 2500
WHERE no =1;

-- sal�� 2000�̸��� �������� ��� �÷� ��ȸ
SELECT * FROM test
WHERE sal<2000;

--sal�� 2000�̻��� �������� sal ���� 3000���� ����. ��� �����͸� ��ȸ�ϱ�.
UPDATE test
SET sal = 3000
WHERE sal>=2000;
SELECT * FROM test;

--test�� ��� �����͸� �����Ͻÿ�
DELETE FROM test;

--transaction ����
commit;


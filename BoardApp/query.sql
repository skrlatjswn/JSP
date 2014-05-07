CREATE TABLE tblBoard(
	num			number,				-- �۹�ȣ
	name		varchar2(20),		-- �ۼ���
	email		varchar2(50),		
	homepage	varchar2(50),
	subject		varchar2(50),		-- �� ����
	content		varchar2(4000),		-- �� ����
	pass		varchar2(10),		
	count		number,				-- ��ȸ��
	ip			varchar2(50),		-- �ۼ��� ip�ּ�
	regdate		date,				-- �����
	pos			number,				-- �亯�� ��ġ
	depth		number,				-- �亯�� ����
	constraint pk_num	primary key(num)
);

CREATE SEQUENCE seq_num;

insert into TBLBOARD values(seq_num.nextVal, 'aaa', 'aaa', 'aaa', 
'aaa', 'aaa', 'aaa', 0, 'aaa', sysdate, 0, 0);

insert into TBLBOARD values(seq_num.nextVal, 'bbb', 'bbb', 'bbb', 
'bbb', 'bbb', 'bbb', 0, 'bbb', sysdate, 0, 0);

select * from tblboard;
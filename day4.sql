
CREATE TABLE t_emp
(
eid VARCHAR2(13) NOT NULL PRIMARY KEY ,
ename VARCHAR2(20) ,
salary NUMBER(5) ,
deptno NUMBER(5) ,
comm NUMBER(5) 
);
COMMIT;
INSERT INTO t_emp VALUES ('e001' , '�ŵ���' , 280,10,100) ;
INSERT INTO t_emp VALUES ('e002' , '���缮' , 250,20,50) ;
INSERT INTO t_emp VALUES ('e003' , '������' , 190,30,0) ;
INSERT INTO t_emp VALUES ('e004' , '�缼��' , 300,20,0) ;
INSERT INTO t_emp VALUES ('e005' , '�缼��' , 290,40,100) ;
CREATE TABLE t_dept
(
deptno NUMBER(5) NOT NULL PRIMARY KEY ,
dname VARCHAR2(20) 
);
COMMIT;
INSERT INTO t_dept VALUES (10 , '������') ;
INSERT INTO t_dept VALUES (20 , '��ȹ��') ;
INSERT INTO t_dept VALUES (30 , '������') ;
INSERT INTO t_dept VALUES (40 , '��������') ;
INSERT INTO t_dept VALUES (50 , '�繫��') ;

commit;

--view �����
create view v_emp
as 
select ename,deptno
from T_EMP;

select * from T_EMP;

select * from v_emp; 

--�ܼ� view ����

ENAME                                        DEPTNO
---------------------------------------- ----------
�ŵ���                                           10
���缮                                           20
������                                           30
�缼��                                           20
�缼��                                           40

--����view
create view v_emp2 
as
select e.ename,d.dname
from t_emp e, t_dept d
where e.deptno = d.deptno;

ENAME                                    DNAME
---------------------------------------- ----------------------------------------
�ŵ���                                   ������
�缼��                                   ��ȹ��
���缮                                   ��ȹ��
������                                   ������
�缼��                                   ��������

create view v_emp223
as
select e.ename,d.dname
from t_emp e 
join t_dept d
on e.deptno = d.deptno;

ENAME                                    DNAME
---------------------------------------- ----------------------------------------
�ŵ���                                   ������
�缼��                                   ��ȹ��
���缮                                   ��ȹ��
������                                   ������
�缼��                                   ��������

--�ζ���view
--from �� �ڿ����� ���������� �ζ��κ��� �Ѵ�.
SELECT e.deptno , d.dname , e.maxsal
FROM( 
SELECT deptno , MAX(salary) maxsal
FROM t_emp
GROUP BY deptno
) e , t_dept d
WHERE e.deptno = d.deptno 

select * from tbl_test_order;


--�ζ���view
--from �� �ڿ����� ���������� �ζ��κ��� �Ѵ�.
--��ȸ��
select * 
from (
      select ocode, p_code, sale_cnt 
      from tbl_test_order          
)o --���̺��� ��Ī
      join tbl_test_goods g
      on o.pcode = g.pcode;
      
      
select * 
from (
      select ocode, p_code, sale_cnt 
      from tbl_test_order          
)o
      join tbl_test_goods g
      on o.pcode = g.pcode;

--��������
select * from t_emp;

select ENAME,SALARY 
from t_emp 
where SALARY>250;

select ENAME,SALARY 
from t_emp 
where SALARY>(select SALARY from T_EMP where T_EMP.ENAME='�ŵ���');

select * from t_emp
where DEPTNO in(20,40);

select * from t_emp
where DEPTNO in(select DEPTNO from T_DEPT where T_DEPT.DNAME='��ȹ��' or T_DEPT.DNAME='��������');

--��ձ޿� ���� ���� ��� ��ȸ
--�������� : ���� ����Ǵ� ����
select ENAME,SALARY from t_emp where SALARY>(select avg(SALARY) from T_EMP);

--dml
--select ��ȸ�ϱ�
--insert, update,delete
--commit���� �ϼ�
--member_tbl_11

select * from member_tbl_11;
desc member_tbl_11;

--������ �߰��ϱ�
--��� �÷��� ���� ������� �Է��ؾ���
insert into member_tbl_11 values('test','0000','������','000-111-222','1995-09-06',null,null);
insert into MEMBER_TBL_11(m_id,m_pw,m_name) values('test2','1234','ȫ�浿');
commit;
select * from MEMBER_TBL_11;

---------------------------------------
--�Ȱ��� ���纻
create table professor3
as 
select * from professor;

select * from professor3;
--------------------------------------
--������ �ȵ���
create table professor4
as
select * from professor
where 1=2;               --����ġ ������ �������(�����Ͱ� ���� �ʵ���)

select * from professor4;

-------------------------
--�� �÷��� ���� �������
insert into professor4
select * from PROFESSOR;

--update(�����ͺ����ϱ�)
select * from MEMBER_TBL_11 where M_NAME='������';

update MEMBER_TBL_11
set M_TEL = '010-2587-9999'
where m_id='test';
commit;
select * from MEMBER_TBL_11;

--�������ε� ��������Ʈ���� +1000 �� update �ϱ�
--������ ����Ʈ�ݾ� �����ϱ�
--null�� ���� 1000���� 
update MEMBER_TBL_11
set M_POINT = nvl(M_POINT+1000,1000)
commit;

select * from MEMBER_TBL_11;

--delete �����ͻ���
delete from MEMBER_TBL_11 where M_ID='test';
commit;
select * from MEMBER_TBL_11; --�����������Ȱ�Ȯ�ΰ���

--DDL
--���̺� �����ϱ�, ���̺��÷� ���� �����ϱ�, ���̺�����ϱ�
--����: vachar2

create table member2(
id varchar2(7),
name varchar2(10)
);

--���̺����� �����ϱ�
alter table member2 modify id VARCHAR2(5); 
alter table member2 add(addr varchar2(5)); --�߰�
alter table member2 rename COLUMN id to user_id; --����
alter table member2 drop COLUMN addr; --����
desc member2;

create table tt02
(no number(3,1)default 0,
name varchar2(10)default 'no name',
hiredate date default sysdate);

insert into tt02(no) values(1);
select * from TT02;

--���̺�����ϱ�
drop table tt2; --���̺���ü�� ������(��Ű������ ����)
truncate table tt2; --���̺� ������ ���´� ( ��Ű���� ���´�)

select * from TBL_TEST_CUSTOMER;
select * from TBL_TEST_ORDER;
select * from TBL_TEST_GOODS;

insert into TBL_TEST_ORDER(OCODE,ODATE,id,pcode,sale_cnt) values('J009','2023-08-22','H007','p001',100);
select * from TBL_TEST_ORDER;
--��� : �ȵ���(������������ ��)
--��������δ� �� �����Ͱ� ���������� ���°��� ������?


create table test_2021
( id varchar2(7) not null , email varchar2(50) null , phone char(13) not null, pwd varchar2(7) default '111' 
);

insert into test_2021(id,email,phone)
values('test01','aaa@naver.com','010-2222-3333');
commit;

create table test_2021_2
(
 id varchar2(50) null , phone varchar2(20) check (phone like '010-%-____') not null , email varchar2(50) null
);

insert into test_2021_2(ID,PHONE)
values('test01','01123333');  --�����߻�

insert into test_2021_2(ID,PHONE)
values('test01','011-233-334567'); --������������ �����߻�


create table test_2021_0
(
 id varchar2(50) not null, email varchar2(200) null , phone char(13) not null, 
 pwd varchar2(200) default '111' , 
 grade CHAR(2) CHECK( grade IN ('01', '02', '03')) 
);

insert into test_2021_0(ID,PHONE,grade)
values('test01','010-2345-6789','04'); --����

insert into test_2021_0(ID,PHONE,grade)
values('test01','010-2345-6789','01'); --����

create table test_2021_3
(
 id varchar2(7) not null primary key , email varchar2(50) , phone char(13) unique , pwd varchar2(10) 
);

insert into test_2021_3 values('a10' , 'aaa@naver.com' ,'010-111-2222' , '111');
insert into test_2021_3 values('b10' , 'bbb@naver.com' ,'010-222-3333' , '222');

select * from TEST_2021_3;

insert into test_2021_3 values('b10' , 'ccc@naver.com' ,'010-333-4444' , '333');
insert into test_2021_3 values('c10' , 'ddd@naver.com' ,'010-119-2522' , '444');


create table mem_tbl (
id varchar2(5) not null primary key , name varchar2(10) not null , addr varchar2(10)
);

insert into mem_tbl values( 'a1' , 'ȫ�浿' , '����') ;
insert into mem_tbl values( 'a2' , 'ȫ���', '�λ�');

commit;

create table ord_tbl_2 (
 no varchar2(5)  not null primary key , 
 qty number(4)  not null,
 cus_no  varchar2(5)   references mem_tbl_2(id)
);

insert into ord_tbl_2  values( 'j01' , 3, 'a1' );
insert into ord_tbl_2  values( 'j02' , 1, 'a1');
insert into ord_tbl_2  values( 'j03' , 7, 'a2' );
commit;

create table dept2(
dcode varchar2(6) primary key
);

insert into dept2 values('10');

create table new_emp1
(no number(4)
constraint emp1_no_pk primary key,
name varchar2(20)
constraint emp1_name_nn not null,
jumin varchar2(13)
constraint emp1_jumin_nn not null
constraint emp1_jumin_uk unique,
loc_code number(1)
constraint emp1_area_ck check(loc_code<5),
deptno varchar2(6)
constraint emp1_deptno_fk references dept2(dcode)
);


insert into new_emp1 values(3,'����','950906222222',3,'10'  );

select * from DEPT2;

����Ű : ���ϼ� ���� 
�ĺ�Ű: (���ϼ�, �ּҼ�)
��Ű : �ĺ�Ű�߿��� ���õ� Ű
��üŰ : �ĺ�Ű�߿��� ������ Ű
                       
 �й�      :  ���ϼ� ����
 �й�+�г�  : ���ϼ� ����
                  ( �ּҼ�����)
                �й�+�г� �̶�� �� ��
                ������ �ݵ�� �־�� �� �л��� �ĺ��� �� ���� �� �ּҼ��� �����Ѵٶ�� ǥ����
                  
�г�+��+��ȣ => Ű�� ���� �� ���� 
�й�   �̸�   �г�   ��   ��ȣ  
 0001  �̼���    1   1   10 
 0002 ȫ�浿     1   5  3



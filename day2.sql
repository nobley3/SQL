-- select * from ���̺��
-- select * from ���̺�� where ����

select * from acorntbl;
select * from acorntbl where name like '��_';
select * from acorntbl where name like '��%';

-- �����Լ� (����, ��¥, ��ȯ�Լ�, �Ϲ��Լ�)
select ename, initcap(ename) from emp; -- ù ���ڸ� �빮�ڷ� ��ȯ����
select ename, lower(ename) from emp; -- �ҹ��ڷ� ��ȯ����
select ename, upper(ename) from emp; -- �빮�ڷ� ��ȯ����
select ename, length(ename) from emp; -- ���ڿ��� ����

select * from ACORNTBL;
select length(name), lengthb(name) from acorntbl; -- lengthb() ����Ʈ���� ������

select * from emp;

select  ename || '   ' ||job as name from emp; 
select concat( ename, job) from emp;

-- substr() ���ڿ��� �Ϻθ� ������ ��
-- (���ڿ�, ������ġ, ������ ����)
select substr(ename, 2,3)  from emp;
select 'abcde' from dual; -- dual �������̺�
select substr('hi hello',4) from dual; -- => hello ���
select name from ACORNTBL;
select substr(name, 2) from ACORNTBL;

-- ������ġ�� -�̸� �����ʱ������� ������ġ�� ������
select substr(name, -1,2) from ACORNTBL;

-- instr() : ���ڿ����� Ư�� ������ ��ġ�� ��ȯ��.
select instr('A-B-C-D','-',1,3) from dual;
select instr('032)851-1234',')') from dual;

select * from student;
select name , tel from student;
-- ��ȭ��ȣ ���� ) ���� ��ġ ã��
select name, instr(tel,')') from student;
-- ��ȭ��ȣ���� ) ���� ��ġ -1 (������ ���� ���ϱ�)
select name, substr(tel, 1,instr(tel,')')-1) from student;

-- lpad() �Լ�
select * from student;
select id from student;
-- lpad(���ڿ�, ��ü�ڸ���, ä����)
select lpad(id, 10, '*') from student;

-- trim() : �������� (���� ��������)
-- ltrim() : ���ʰ�������
-- rtrim() : �����ʰ�������

select  '     abc   ' || 'b' from dual;
select trim( '     abc   ') || 'b' from dual;
select ltrim( '     abc   ') || 'b' from dual;
select rtrim( '     abc   ') || 'b' from dual;

-- replace
select * from emp;
select ename , replace(ename,'M','*') from emp;

select ename, replace(ename, 'SM'  ,'**') from emp; --SM�̶�� ���ڸ� **�� �ٲ�
select substr(ename, 1,2) from emp;
select ename, replace(ename, substr(ename, 1,2)  ,'**') from emp;

-- 84,85
select ename, replace(ename, substr(ename,2,2),'--') as REPLACE from emp;
select name, jumin, replace(jumin,substr(jumin,7),'-/-/-/-') as REPLACE from student;
select name, tel, replace(tel,substr(tel,5,3),'***') as REPLACE from student where deptno1='102';
select name, tel, replace(tel,substr(tel,9),'****') as REPLACE from student where deptno1='101';

--
select name, tel, substr(tel, 1,instr(tel,')')-1)  as "AREA CODE" from student where deptno1='201';

-- �����Լ�
-- round(����, �ڸ���) �ݿø�
-- �ڸ����� -�̸� �Ҽ��� ���� ����
select round(987.654,2) from dual;
select trunc(987.652,2) from dual;
select trunc(987.652,-1) from dual; --������ ����
select trunc(987.652,-2) from dual; --�ʴ��� ����

select ceil(12.3456) from dual; -- �����ø�
select floor(12.3456) from dual; -- ��������
-- ���������ϱ� mod(������, ����)
select mod(10,2) from dual;

-- ��¥�Լ�
-- sysdate ���糯¥���ϱ�
select sysdate from dual;
-- months_between(ū��¥, ������¥) : �� ��¥ ������ ���� �� ���ϱ�
select months_between('20230901','20230801') from dual;
select months_between('23/09/01','23/08/01') from dual;

-- next_day() ������ ������ ���� ���Ͽ� �ش��ϴ� ��¥���ϱ�
select next_day('2023-08-18','��') from dual;

-- ���糯¥���� 3�� �� ���ϱ�
select sysdate+3 from dual;
-- Ư����¥�� �������� 3�� �� ���ϱ�
select to_date('2023/08/18') + 3 from dual;

-- ����ȯ �Լ� 
-- ����, ��¥�� ==> ���ڷ� ��ȯ ( ���ϴ� �������� �����ؼ� ��ȸ�ϱ�)
select 123456 from dual;
select to_char(123456, '999,999') from dual;
select to_char(123456, 'L999,999') from dual; -- ��ȭǥ��
select to_char(123456, '$999,999') from dual; -- �޷�ǥ��
-- ���ǻ��� ǥ���� ������ �ڸ������� 9�� ������ ������ ##### ǥ����
select to_char(123456, '0999,999') from dual;

-- ��¥�� => ���ڷ� ��ȯ
select sysdate from dual;
select to_char(sysdate,'yyyy-mm-dd') from dual;
select to_char(sysdate,'yyyy-mm-dd day') from dual;
select to_char(sysdate,'yyyy-mm-dd dy') from dual;

select to_char(sysdate,'yyyy/mm/dd') from dual;
select sysdate from dual;
select to_char(sysdate,'yyyy"��"mm"��"dd"��"') from dual;

select * from emp;
select empno, ename, sal, comm from emp;
select empno, ename, (sal*12) +comm from emp;
select empno, ename, to_char((sal*12) +comm,'999,999')as ���� from emp;

desc professor;
select * from professor;
select name, pay, bonus from professor;
select name, (pay*10)+ bonus from professor;
select name, to_char((pay*10)+ bonus) from professor;

-- to_number() �Լ�
select '5'+3 from dual; -- �ڵ�����ȯ(����������ȯ)
select to_number('5') + 3 from dual; -- ���������ȯ �������·ε� ���ڸ� ���� ���ڷ� ��ȯ�ϴ� �Լ�

-- to_date() �Լ�: �������·ε� ��¥�����͸� ���� ��¥�����ͷ� ��ȯ�ϴ� �Լ�
select to_date('2023/08/18') + 3 from dual; 

-- �Ϲ��Լ� nvl{} nvl2{}
-- null�� ��� �ٸ������� ġȯ���ִ� �Լ�

select * from professor;
select name, bonus from professor;
select name, nvl(bonus,0)  from professor;
select name, (pay*12)+bonus as "����"  from professor;
select name, nvl((pay*12)+bonus,0) as "����"  from professor;
select name, to_char(nvl((pay*12)+bonus,0),'999,999') as "����"  from professor;

select bonus from professor;
select bonus, nvl2(bonus, bonus*2, 100) from professor;
-- nvl2(�÷�, null�� �ƴ� ���, null�� ���)

-- decode() �Լ�
select * from member_tbl_11;
select m_grade, decode(m_grade ,'01' , ' VIP','02','���','03', '�����') from member_tbl_11;

-- 120 ����2
select * from student;
select substr(tel,1,3) from student;
select substr(tel,1,instr(tel,')')-1)  from student;
select name, tel, decode(substr(tel,1,instr(tel,')')-1),'02','����','031','���','051','�λ�','052','���','055','�泲') as LOC from student;

-- case when
-- select ���̸�, case when [����] then [�����]
-- when [����] then [�����]
-- else [�����]
-- end as ���ο� �÷���
-- from ���̺��;
select * from member_tbl_11;
select m_point from member_tbl_11;
select m_point, case 
                              when m_point >= 2000 then '��'
                              when m_point >= 1500 then '��'
                              else '��'
                              end as "���" from member_tbl_11;
                              
-- �������Լ� �����Լ�, sum(), avg(), max(), min()
-- count(*) , count(�÷���)
select * from MEMBER_TBL_11;
select sum(m_point) from MEMBER_TBL_11;
select avg(m_point) from MEMBER_TBL_11;
select max(m_point) from MEMBER_TBL_11;
select min(m_point) from MEMBER_TBL_11;
select count(*) from MEMBER_TBL_11; -- MEMBER_TBL_11 ���̺��� ���� ������ ���Ѵ�. ��ü���� ���� ���ϱ�
select count(m_point) from MEMBER_TBL_11; -- MEMBER_TBL_11 �÷������� count�� ���� �ش��÷��� null ���� �����ϰ� count

-- group by , �����Լ��� �Բ� ����Ѵ�.
select * from MEMBER_TBL_11;
select m_grade, m_point from MEMBER_TBL_11;

select m_grade, sum(m_point )
from MEMBER_TBL_11
group by m_grade;

-- having �� ����ϱ� (����), group by ��� ������ ���ǿ� �´°͸� ������ �� 
select m_grade, m_point from MEMBER_TBL_11;

-- select ���� �������
select m_grade, sum(m_point )  -- 4��
from MEMBER_TBL_11 -- 1��
group by m_grade          -- 2��
--having total >= 5000;    select �ִ� ��Ī�� ����� �� ����. ������ ������ �ִ�.
having sum(m_point ) >= 5000;  -- 3��

select m_grade, sum(m_point )  as "total"
from MEMBER_TBL_11
group by m_grade    
having sum(m_point ) >= 5000
order by "total" desc;

-- count()  , count(*),    count(�÷���)
select * from emp;
select count(*) from emp;
select count(ename) from emp;
select count(comm) from emp;   -- �ش��ϴ� �÷��� ���� null�� �����ϰ� ī��Ʈ��

select sum(comm) from emp;   -- null�� ���ܵǰ� �հ谡 ��������.
select avg(comm) from emp;
select MAX(comm) from emp;
select min(comm) from emp;

-- group by
select * from emp;
-- group by ������ ��ȸ�� Ȯ���ϱ�
select deptno, sal from emp;
-- �μ��� sal�� ����� ���ϱ�
select deptno, sum(sal) from emp
group by deptno;

-- having�� ������ group by�� �� ��Ȳ���� ���ȴ�
-- group by ���µ� having ����!!
-- group�� ��������� ������ ����� ���� having�� �;� ��
select deptno, sum(sal) 
from emp
group by deptno
having sum(sal) >= 7000;

select * from emp;
select deptno, job, sal
from emp;

select deptno, job, sum(sal)
from emp
group by deptno, job
order by 1, 3 desc;
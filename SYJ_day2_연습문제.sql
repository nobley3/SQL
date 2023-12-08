CREATE TABLE CUST_INFO(
 ID VARCHAR2(13) NOT NULL PRIMARY KEY , 
 FIRST_NM VARCHAR2(10) , 
 LAST_NM VARCHAR2(10) , 
 ANNL_PERF NUMBER(10,2) 
);
COMMIT;

INSERT INTO CUST_INFO VALUES ('8301111567897' , 'JHUN' , 'KIM', 330.08);
INSERT INTO CUST_INFO VALUES ('9302112567897' , 'JINYOUNG' , 'LEE', 857.61);
INSERT INTO CUST_INFO VALUES ('8801111567897' , 'MIJA' , 'HAN', -76.77);
INSERT INTO CUST_INFO VALUES ('9901111567897' , 'YOUNGJUN' , 'HA', 468.54);
INSERT INTO CUST_INFO VALUES ('9801112567897' , 'DAYOUNG' , 'SUNG', -890);
INSERT INTO CUST_INFO VALUES ('9701111567897' , 'HYEJIN' , 'SEO', 47.44);
COMMIT;






--1.MEMBER_TBL_11 ���̺�κ��� ����� ��ȸ�ϱ�
select M_GRADE from MEMBER_TBL_11;

--2.MEMBER_TBL_11 ���̺�κ��� ����� ��ȸ�ϱ�, �ߺ��� �� �����ϰ� ��ȸ�ϱ�
select distinct M_GRADE from MEMBER_TBL_11;

--3.�����̺�κ��� ���̵� USERID��� �̸����� ��ȸ�ϱ� (AS �� ����������)
select M_ID USERID from MEMBER_TBL_11; 

--4.�����̺�κ��� �̸��� ���ԡ��ڸ� �ٿ� NAME�̶�� �÷������� ��ȸ�ǵ��� �Ͻÿ�
select M_NAME || '��' from MEMBER_TBL_11;

--5.������ ���̺�κ��� �ֹι�ȣ 7��° ���� (������ ��Ÿ����)�� �����Ͽ� GENDER ��� �̸����� �ֹι�ȣ�� �Բ� ��ȸ�Ͻÿ�
select * from CUST_INFO;
select substr(id,7,1)from CUST_INFO;
select ID ,decode(substr(id,7,1),'1','��','2','��') GENDER from cust_info;

--6.������ ���̺�κ��� �ֹι�ȣ, LAST_NM�� ��� �ҹ��ڷ� ��ȸ�ǵ��� �Ͻÿ�
select ID,lower(LAST_NM) from CUST_INFO;

--7. ������ ���̺�κ��� DM�߼��� ���ؼ� NAME�̶�� �̸����� KIM, JIHOON �� ������������ ��ȸ�� �� �ֵ��� �Ͻÿ�
select LAST_NM ||', ' ||FIRST_NM NAME from CUST_INFO;

--8.������ ���̺�κ��� �� �ֹι�ȣ, ������ �Ҽ� ��°���� �ݿø��Ͽ� �Ҽ� ù°�ڸ����� ǥ�õ� �� �ֵ��� ��ȸ �Ͻÿ�
select ID,ANNL_PERF from CUST_INFO;
select ID,round(ANNL_PERF,1) from CUST_INFO;

--9.������ ���̺�κ��� �� �ֹι�ȣ, ������ �Ҽ� ù°���� �����Ͽ� ������ ��Ÿ���� �ֵ��� ��ȸ�Ͻÿ�
select ID,trunc(ANNL_PERF,1) from CUST_INFO;

--10.���糯¥�� ��ȸ�Ͻÿ�
select sysdate from dual;

--11.�����̺�κ��� �ֹι�ȣ , ������ 300�̻��̸� ����� 100�̻��� �Ϲݼ��� 0�����̸� ���� , �������� �������� ������ RESULT�÷������� ��ȸ�� �� �ֵ��� �Ͻÿ�
select ID, case when ANNL_PERF >=300 then '�����'  when ANNL_PERF>=100 then '�Ϲݼ���' when ANNL_PERF<=0 then '����' else '��������' end RESULT from CUST_INFO;
select * from CUST_INFO;

--12.�����̺�κ��� �̸��� ����Ʈ�� ��ȸ�Ͻÿ�(�� ����Ʈ�� �������� ���� ���� 0���� ǥ�õǵ��� �Ͻÿ�) ��Ʈ:NVL �Լ� ���
select M_NAME,nvl(M_POINT,0)  from MEMBER_TBL_11;

--13.�����̺�κ��� ��������Ʈ �������� 100����Ʈ�� �λ��Ϸ��� �մϴ�. NEXT_POINT��� �÷����� ��ȸ�ǵ��� �Ͻÿ�, ���̸�, ����Ʈ�� �Բ� ��ȸ�Ͻÿ� ( ��������Ʈ�� ���� ����� 0����Ʈ�� �����մϴ�)
select M_NAME, nvl(M_POINT,0), nvl2(M_POINT, M_POINT+100,0)  NEXT_POINT from MEMBER_TBL_11;
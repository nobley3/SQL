select * from TBL_JOIN_200; --�������̺�
select * from TBL_MENTOR_200; -- ���� ���̺�
select * from TBL_SCORE_200; --����


--������ ��ȸ
select JOIN_ID "������ID",
       JOIN_NM "�������̸�",
       to_char(to_date(birth),'yyyy"��"mm"��"dd"��"') "�������",
       replace(GENDER,'M','����') "����",
       decode(SPECIALTY, 'D','��','R','��','V','����') "�Ƿ¹���",
       CHARM "�ŷ¹���" 
       from tbl_join_200;
    
    
--������ ������ȸ
select 
s.SCORE_NO "���¹�ȣ",
j.JOIN_ID "������ID",
j.JOIN_NM "�������̸�",
to_char(to_date(j.birth),'yyyy"��"mm"��"dd"��"') "�������",
s.SCORE "����",
case when s.SCORE >=90 then 'A' when s.SCORE >=80 then 'B' when s.SCORE >=70 then 'C' else 'D' end as  ���,
decode(s.MENTORID,'J001','������','J002','�����','J003','����' )"�����̸�"
from TBL_SCORE_200 s
join TBL_JOIN_200 j
on s.ARTISTID = j.JOIN_ID;


--������ ��� ��ȸ

select * from TBL_SCORE_200;
select  
j.JOIN_ID "������ID",
j.JOIN_NM "�������̸�",
sum(s.SCORE)"��������",
round(avg(s.SCORE),2)"�������",
rank()over( order by round(avg(s.SCORE),2)desc)"����"
from TBL_JOIN_200 j
join TBL_SCORE_200 s
on j.JOIN_ID = s.ARTISTID
group by j.JOIN_ID,j.JOIN_NM;

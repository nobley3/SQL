select * from tbl_course_300; --����������
select * from TBL_LECTURER_300; --��������

select 
c.S_ID "�����ڵ�",
c.S_NAME "�����",
c.S_GRADE "����",
decode(c.TEACHER_ID,'1','��������','2','�߱���','3','���α���','4','����ȩ����','5','��������') "��簭��",
decode(c.WEEKDAY,'M ' ,'��','TU','ȭ','W ','��','TH','��','F ','��') "����",
substr(lpad(c.START_H,4,0),1,2)||':'||substr(lpad(c.START_H,4,0),3,2)"���۽ð�",
substr(lpad(c.END_H,4,0),1,2)||':'||substr(lpad(c.END_H,4,0),3,2)"����ð�"
from TBL_COURSE_300 c
join TBL_LECTURER_300 l
on c.TEACHER_ID = l.T_ID;



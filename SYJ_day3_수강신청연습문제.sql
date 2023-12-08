select * from tbl_course_300; --교과목데이터
select * from TBL_LECTURER_300; --강사정보

select 
c.S_ID "과목코드",
c.S_NAME "과목명",
c.S_GRADE "학점",
decode(c.TEACHER_ID,'1','정국교수','2','뷔교수','3','지민교수','4','제이홉교수','5','슈가교수') "담당강사",
decode(c.WEEKDAY,'M ' ,'월','TU','화','W ','수','TH','목','F ','금') "요일",
substr(lpad(c.START_H,4,0),1,2)||':'||substr(lpad(c.START_H,4,0),3,2)"시작시간",
substr(lpad(c.END_H,4,0),1,2)||':'||substr(lpad(c.END_H,4,0),3,2)"종료시간"
from TBL_COURSE_300 c
join TBL_LECTURER_300 l
on c.TEACHER_ID = l.T_ID;



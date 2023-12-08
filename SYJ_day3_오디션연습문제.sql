select * from TBL_JOIN_200; --참가테이블
select * from TBL_MENTOR_200; -- 멘토 테이블
select * from TBL_SCORE_200; --점수


--참가자 조회
select JOIN_ID "참가자ID",
       JOIN_NM "참가자이름",
       to_char(to_date(birth),'yyyy"년"mm"월"dd"일"') "생년월일",
       replace(GENDER,'M','남성') "성별",
       decode(SPECIALTY, 'D','댄스','R','랩','V','보컬') "실력무대",
       CHARM "매력무대" 
       from tbl_join_200;
    
    
--참가자 점수조회
select 
s.SCORE_NO "계좌번호",
j.JOIN_ID "참가자ID",
j.JOIN_NM "참가자이름",
to_char(to_date(j.birth),'yyyy"년"mm"월"dd"일"') "생년월일",
s.SCORE "점수",
case when s.SCORE >=90 then 'A' when s.SCORE >=80 then 'B' when s.SCORE >=70 then 'C' else 'D' end as  등급,
decode(s.MENTORID,'J001','박진영','J002','박재상','J003','보아' )"멘토이름"
from TBL_SCORE_200 s
join TBL_JOIN_200 j
on s.ARTISTID = j.JOIN_ID;


--참가자 등수 조회

select * from TBL_SCORE_200;
select  
j.JOIN_ID "참가자ID",
j.JOIN_NM "참가자이름",
sum(s.SCORE)"종합점수",
round(avg(s.SCORE),2)"평균점수",
rank()over( order by round(avg(s.SCORE),2)desc)"순위"
from TBL_JOIN_200 j
join TBL_SCORE_200 s
on j.JOIN_ID = s.ARTISTID
group by j.JOIN_ID,j.JOIN_NM;

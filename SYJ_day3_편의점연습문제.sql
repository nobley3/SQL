select * from goods_tbl_500;
select * from STORE_TBL_500;
select * from SALE_TBL_500;

select  
r.STORE_NM,
s.SALE_CNT
from SALE_TBL_500 s
join goods_tbl_500 g
on s.GOODS_CD = g.GOODS_CD
join STORE_TBL_500 r
on s.STORE_CD = r.STORE_CD;

select 
GOODS_CD,
GOODS_NM,
to_char(GOODS_PRICE,'L999,999'),
to_char(COST,'L999,999'),
to_char(in_date,'yyyy"년"mm"월"dd"일"') 
from goods_tbl_500;

--
desc GOODS_TBL_500;
--*헷갈리면 따로 빼서 확인해보기*
select to_char(GOODS_PRICE,'999,999') from goods_tbl_500; --금액의 천단위 표시
select to_char(in_date,'yyyy"년"mm"월"dd"일"') from GOODS_TBL_500;


select sale_fg,sale_no,sale_ymd,sale_cnt,pay_type from SALE_TBL_500;
--
select * from SALE_TBL_500;

select s.sale_fg,s.sale_no,s.sale_ymd,g.GOODS_NM,s.sale_cnt,s.pay_type 
from SALE_TBL_500 s
join GOODS_TBL_500 g
on s.GOODS_CD = g.GOODS_CD;


select s.sale_fg,s.sale_no,s.sale_ymd,g.GOODS_NM,s.sale_cnt,s.pay_type 
from SALE_TBL_500 s
join GOODS_TBL_500 g
on s.GOODS_CD = g.GOODS_CD
where s.STORE_CD='A001';

--3.
select 
decode(s.sale_fg,1,'판매',2,'취소'),
s.sale_no,
to_char(s.sale_ymd,'yyyy-mm-dd'),
g.GOODS_NM,
s.sale_cnt,
decode(s.pay_type,'01','현금','02','카드') 
from SALE_TBL_500 s
join GOODS_TBL_500 g
on s.GOODS_CD = g.GOODS_CD
where s.STORE_CD='A001';

--2. 점포별 매출현황
select * from SALE_TBL_500;
select * from STORE_TBL_500;
select * from GOODS_TBL_500;

select s.STORE_CD,s.SALE_CNT*g.GOODS_PRICE 
from SALE_TBL_500 s
join GOODS_TBL_500 g
on s.GOODS_CD = g.GOODS_CD;

select ss.STORE_NM,s.SALE_CNT*g.GOODS_PRICE 
from SALE_TBL_500 s
join GOODS_TBL_500 g
on s.GOODS_CD = g.GOODS_CD
join STORE_TBL_500 ss
on s.STORE_CD = ss.STORE_CD;

--점별집계
select ss.STORE_NM,sum(s.SALE_CNT*g.GOODS_PRICE) 
from SALE_TBL_500 s
join GOODS_TBL_500 g
on s.GOODS_CD = g.GOODS_CD
join STORE_TBL_500 ss
on s.STORE_CD = ss.STORE_CD
group by ss.STORE_NM;

--현금, 카드, 총매출
select 
ss.STORE_NM,
sum(decode(s.PAY_TYPE,'01',s.SALE_CNT*g.GOODS_PRICE)) cash, 
sum(decode(s.PAY_TYPE,'02',s.SALE_CNT*g.GOODS_PRICE)) card,
sum(s.SALE_CNT*g.GOODS_PRICE) 총매출 
from SALE_TBL_500 s
join GOODS_TBL_500 g
on s.GOODS_CD = g.GOODS_CD
join STORE_TBL_500 ss
on s.STORE_CD = ss.STORE_CD
group by ss.STORE_NM;

--완성
select 
ss.STORE_NM,
to_char(nvl(sum(decode(s.PAY_TYPE,'01',s.SALE_CNT*g.GOODS_PRICE)),0),'999,999') cash, 
to_char(nvl(sum(decode(s.PAY_TYPE,'02',s.SALE_CNT*g.GOODS_PRICE)),0),'999,999') card,
to_char(sum(s.SALE_CNT*g.GOODS_PRICE),'999,999') 총매출 
from SALE_TBL_500 s
join GOODS_TBL_500 g
on s.GOODS_CD = g.GOODS_CD
join STORE_TBL_500 ss
on s.STORE_CD = ss.STORE_CD
group by ss.STORE_NM
order by 4 desc;




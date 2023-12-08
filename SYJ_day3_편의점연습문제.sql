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
to_char(in_date,'yyyy"��"mm"��"dd"��"') 
from goods_tbl_500;

--
desc GOODS_TBL_500;
--*�򰥸��� ���� ���� Ȯ���غ���*
select to_char(GOODS_PRICE,'999,999') from goods_tbl_500; --�ݾ��� õ���� ǥ��
select to_char(in_date,'yyyy"��"mm"��"dd"��"') from GOODS_TBL_500;


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
decode(s.sale_fg,1,'�Ǹ�',2,'���'),
s.sale_no,
to_char(s.sale_ymd,'yyyy-mm-dd'),
g.GOODS_NM,
s.sale_cnt,
decode(s.pay_type,'01','����','02','ī��') 
from SALE_TBL_500 s
join GOODS_TBL_500 g
on s.GOODS_CD = g.GOODS_CD
where s.STORE_CD='A001';

--2. ������ ������Ȳ
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

--��������
select ss.STORE_NM,sum(s.SALE_CNT*g.GOODS_PRICE) 
from SALE_TBL_500 s
join GOODS_TBL_500 g
on s.GOODS_CD = g.GOODS_CD
join STORE_TBL_500 ss
on s.STORE_CD = ss.STORE_CD
group by ss.STORE_NM;

--����, ī��, �Ѹ���
select 
ss.STORE_NM,
sum(decode(s.PAY_TYPE,'01',s.SALE_CNT*g.GOODS_PRICE)) cash, 
sum(decode(s.PAY_TYPE,'02',s.SALE_CNT*g.GOODS_PRICE)) card,
sum(s.SALE_CNT*g.GOODS_PRICE) �Ѹ��� 
from SALE_TBL_500 s
join GOODS_TBL_500 g
on s.GOODS_CD = g.GOODS_CD
join STORE_TBL_500 ss
on s.STORE_CD = ss.STORE_CD
group by ss.STORE_NM;

--�ϼ�
select 
ss.STORE_NM,
to_char(nvl(sum(decode(s.PAY_TYPE,'01',s.SALE_CNT*g.GOODS_PRICE)),0),'999,999') cash, 
to_char(nvl(sum(decode(s.PAY_TYPE,'02',s.SALE_CNT*g.GOODS_PRICE)),0),'999,999') card,
to_char(sum(s.SALE_CNT*g.GOODS_PRICE),'999,999') �Ѹ��� 
from SALE_TBL_500 s
join GOODS_TBL_500 g
on s.GOODS_CD = g.GOODS_CD
join STORE_TBL_500 ss
on s.STORE_CD = ss.STORE_CD
group by ss.STORE_NM
order by 4 desc;




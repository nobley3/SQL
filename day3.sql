create table tbl_test_customer(
 id varchar2(20) not null primary key ,
 name varchar2(20) ,
 address varchar2(20),
 tel varchar2(20)
);
create table tbl_test_goods(
 pcode varchar2(20) not null primary key,
 pname varchar(20) ,
 price number(4)
);
create table tbl_test_order(
 ocode varchar2(20) not null primary key,
 odate date,
 id varchar2(20),
pcode varchar2(20),
sale_cnt number(6)
);
insert into tbl_test_customer values( 'H001' ,'김병진', '라스베가스', '010-1111-2222');
insert into tbl_test_customer values( 'H002' ,'이윤', 'L.A', '010-1111-2222');
insert into tbl_test_customer values( 'H003' ,'곽단야', '워싱턴D.C', '010-1111-2222');
insert into tbl_test_customer values( 'H004' ,'허재혁', '뉴욕', '010-1111-2222');
insert into tbl_test_customer values( 'H005' ,'서예진', '텍사스', '010-1111-2222');
insert into tbl_test_customer values( 'H006' ,'이윤정', '서울', '010-1111-2222');
insert into tbl_test_goods values('P001' ,'쫀드기', 1000);
insert into tbl_test_goods values('P002' ,'눈깔사탕', 100);
insert into tbl_test_goods values('P003' ,'아폴로', 200);
insert into tbl_test_goods values('P004' ,'뻥튀기', 2000);
insert into tbl_test_order values('J001' , '20210110' , 'H001', 'P001', 2);
insert into tbl_test_order values('J002' , '20210110' , 'H002', 'P002', 5);
insert into tbl_test_order values('J003' , '20210110' , 'H003', 'P003', 2);
insert into tbl_test_order values('J004' , '20210110' , 'H004', 'P004', 1);
insert into tbl_test_order values('J005' , '20210110' , 'H005', 'P002', 3);
insert into tbl_test_order values('J006' , '20210110' , 'H001', 'P002', 3);
insert into tbl_test_order values('J007' , '20210110' , 'H002', 'P001', 1);
insert into tbl_test_order values('J008' , '20210110' , 'H001', 'P002', 4);
commit;

--주문테이블 정보 조회하기, 주문테이블, 고객테이블 관계성이 있음 ( 주문테이블에 고객테이블의 id를 가지고 있음 ->외래키
select * from TBL_TEST_ORDER;
--고객정보
select * from TBL_TEST_CUSTOMER;

select * from TBL_TEST_ORDER o join TBL_TEST_CUSTOMER c on o.ID = c.ID;

--고객명, 판매수량
select c.NAME name,o.SALE_CNT "sale cnt" from TBL_TEST_ORDER o join TBL_TEST_CUSTOMER c on o.ID = c.ID;

--고객별 판매수량
select c.NAME ,sum(o.SALE_CNT)||'개' 수량 from TBL_TEST_ORDER o join TBL_TEST_CUSTOMER c on o.ID = c.ID
group by c.NAME; 

--동등조인 등가조인 equi조인 , inner조인(일치하는 것만 조인된다.)inner는 생략가능 ( 일치하지 않는것은 조회되지 않는다.)
select * from TBL_TEST_ORDER o inner join TBL_TEST_CUSTOMER c on o.ID = c.ID;

select c.NAME,o.SALE_CNT 
from TBL_TEST_ORDER o 
inner join TBL_TEST_CUSTOMER c 
on o.ID = c.ID;

--고객 주문수량 조회! ( 주문하지 않는 고객도 함께 조회될 수 있도록)
select c.NAME,o.SALE_CNT from TBL_TEST_ORDER o
join TBL_TEST_CUSTOMER c
on o.ID = c.ID;

--일치하지 않는것 조회
select c.NAME,o.SALE_CNT from TBL_TEST_ORDER o
right outer join TBL_TEST_CUSTOMER c
on o.ID = c.ID;

--
select c.NAME, nvl(o.SALE_CNT,0)||'개' from TBL_TEST_ORDER o
right outer join TBL_TEST_CUSTOMER c
on o.ID = c.ID;

--
select c.NAME, nvl(sum(o.SALE_CNT),0) qty
from TBL_TEST_ORDER o
right outer join TBL_TEST_CUSTOMER c
on o.ID = c.ID
group by c.NAME
order by 2  desc;

--주문 정보를 조회하기
-- 여러 테이블을 조인 할 때
-- 두 개 중에서 중심테이블 먼저 표시함
select * from TBL_TEST_ORDER;
select * from TBL_TEST_CUSTOMER;

select c.NAME,o.SALE_CNT 
from TBL_TEST_ORDER o
join TBL_TEST_CUSTOMER c
on o.ID = c.ID;

--주문하지 않은 고객도 함께 조회하기 (outer 조인 left ,right, full)
select c.NAME,o.SALE_CNT 
from TBL_TEST_ORDER o
right outer join TBL_TEST_CUSTOMER c
on o.ID = c.ID;
--null 값 처리
select c.NAME, nvl(o.SALE_CNT,0) ||'개'
from TBL_TEST_ORDER o
right outer join TBL_TEST_CUSTOMER c
on o.ID = c.ID;
--고객별 집계 (group by)
select c.NAME, sum(nvl(o.SALE_CNT,0)) ||'개'
from TBL_TEST_ORDER o
right outer join TBL_TEST_CUSTOMER c
on o.ID = c.ID
group by c.NAME;

select * from TBL_TEST_GOODS;
select * from TBL_TEST_ORDER;
select * from TBL_TEST_CUSTOMER;

--Quiz1
select g.PNAME,sum(o.SALE_CNT) 수량 from TBL_TEST_GOODS g
join TBL_TEST_ORDER o
on o.PCODE = g.PCODE
group by g.PNAME;

--Quiz2
select g.PNAME,sum(g.PRICE*o.SALE_CNT)AMOUNT 
from TBL_TEST_GOODS g
join TBL_TEST_ORDER o
on o.PCODE = g.PCODE
group by g.PNAME;

--Quiz3
select c.NAME, sum(g.PRICE*o.SALE_CNT) AMOUNT from TBL_TEST_CUSTOMER c
join TBL_TEST_ORDER o
on o.ID = c.ID
join TBL_TEST_GOODS g
on o.PCODE = g.PCODE
group by c.NAME;

insert into tbl_test_goods values('P005' ,'고래밥', 1300);
commit;


select * from TBL_TEST_GOODS;
select * from TBL_TEST_ORDER;
--고래밥 추가
select 
g.PNAME,
nvl(sum(o.SALE_CNT),0) 
from TBL_TEST_GOODS g
left outer join TBL_TEST_ORDER o
on o.PCODE = g.PCODE
group by g.PNAME;

--rollup() : 각 기준별 소계를 요약해서 보여주는 함수
--group by가 선행되어야 한다.

select * from EMP;
select DEPTNO,JOB,SAL from emp;
--부서별 급여합계
select DEPTNO,sum(SAL) from emp
group by DEPTNO;

--rollup : 전체합계
select DEPTNO,sum(SAL) from emp
group by rollup(DEPTNO);

--nullx
select decode(DEPTNO,null,'합계',DEPTNO)deptno,sum(SAL) from emp
group by rollup(DEPTNO);

--to_char(금액,'999,999')
select decode(DEPTNO,null,'합계',DEPTNO)deptno,to_char(sum(SAL),'999,999') sal_total from emp
group by rollup(DEPTNO);

select DEPTNO,JOB,SAL from emp;
--group by
select DEPTNO,JOB,sum(SAL) from emp
group by DEPTNO, job
order by DEPTNO,JOB;
--roll up 소계, 전체합계
select DEPTNO,JOB,sum(SAL) from emp
group by rollup(DEPTNO, job)
order by DEPTNO,JOB;
--
select DEPTNO,decode(JOB,null,'소계',job),sum(SAL) from emp
group by rollup(DEPTNO, job)
order by DEPTNO,JOB;

select decode(DEPTNO,null,'전체합계',deptno)deptno,decode(JOB,null,'소계',job)job,sum(SAL) from emp
group by rollup(DEPTNO, job)
order by DEPTNO,JOB;

--pivot()함수
select * from emp;
select DEPTNO,EMPNO,JOB from emp;

--
select DEPTNO,decode(JOB,'CLERK',empno)clerk, 
decode(JOB,'MANAGER',empno)manager,
decode(JOB,'PRESIDENT',empno)PRESIDENT,
decode(JOB,'ANALYST',empno)ANALYST,
decode(JOB,'SALESMAN',empno)SALESMAN
from emp;

--
select DEPTNO,
COUNT(decode(JOB,'CLERK',empno))clerk, 
count(decode(JOB,'MANAGER',empno))manager,
count(decode(JOB,'PRESIDENT',empno))PRESIDENT,
count(decode(JOB,'ANALYST',empno))ANALYST,
count(decode(JOB,'SALESMAN',empno))SALESMAN
from emp
group by deptno;

--pivot()
select * from (select deptno,job,empno from emp)
pivot(
  count (empno) for job in ('CLERK' as "CLERK",'MANAGER'as "MANAGER",'PRESIDENT' as "PRESIDENT",
                              'ANALYST' as "ANALYST",'SALESMAN' as "SALESMAN")
);


--rank()함수 : 순위출력 함수
select * from emp;
select  EMPNO,ENAME,SAL from emp;
select  EMPNO,ENAME,SAL, rank()over (order by SAL desc) from emp; --asc(낮은거부터), desc(높은거부터)
select  EMPNO,ENAME,SAL, dense_rank()over (order by SAL desc) from emp; --동일한 순위를 하나의 건수로 취급

select EMPNO,ENAME,SAL, rank() over(order by sal desc )from emp;

select EMPNO,ENAME,SAL, DEPTNO, rank() over(order by sal desc )from emp;
--같은부서의 등수
select EMPNO,ENAME,SAL, DEPTNO, rank() over(partition by DEPTNO order by sal desc )from emp;

--sum()over 누계구하기
select P_DATE,P_TOTAL, sum(P_TOTAL)over(order by P_TOTAL) from panmae;

select P_DATE,P_CODE,P_TOTAL from panmae;

select P_DATE,P_CODE,P_TOTAL, sum(P_TOTAL)over(partition by P_CODE order by P_TOTAL) from panmae
where P_STORE=1000;


--Quiz1

select * from emp;
select sal , comm , sal+nvl(comm,0) from emp;
select sal+nvl(comm,0) from emp;
select max( sal+nvl(comm,0))  from emp;
select max( sal+nvl(comm,0))  ,min( sal+nvl(comm,0)) ,avg( sal+nvl(comm,0)) from emp;
select max( sal+nvl(comm,0)),min(sal+nvl(comm,0)), round(avg( sal+nvl(comm,0)),1) from emp;

--Quiz2

select   
         count(birthday)||'EA'"TOTAL",
         count(decode(substr( birthday, 4,2),'01', 1))||'EA' "JAN"  ,
         count(decode(substr( birthday, 4,2),'02', 1))||'EA' "FEB" ,
         count(decode(substr( birthday, 4,2),'03', 1))||'EA' "MAR",
         count(decode(substr( birthday, 4,2),'04', 1))||'EA' "APR",
         count(decode(substr( birthday, 4,2),'05', 1))||'EA' "MAY",
         count(decode(substr( birthday, 4,2),'06', 1))||'EA' "JUN",
         count(decode(substr( birthday, 4,2),'07', 1))||'EA' "JUL",
         count(decode(substr( birthday, 4,2),'08', 1))||'EA' "AUG",
         count(decode(substr( birthday, 4,2),'09', 1))||'EA' "SEP",
         count(decode(substr( birthday, 4,2),'10', 1))||'EA' "OCT",
         count(decode(substr( birthday, 4,2),'11', 1))||'EA' "NOV",
         count(decode(substr( birthday, 4,2),'12', 1))||'EA' "DEC"
 from student;
 
 --Quiz3
 select * from student;
 select 
        count(tel)"TOTAL",
        count(decode(substr(tel,1,instr(tel,')')-1),'02','SEOUL')) "SEOUL",
        count(decode(substr(tel,1,instr(tel,')')-1),'031','GYEONGGI')) "GYEONGGI",
        count(decode(substr(tel,1,instr(tel,')')-1),'051','BUSAN')) "BUSAN",
        count(decode(substr(tel,1,instr(tel,')')-1),'052','ULSAN')) "ULSAN",
        count(decode(substr(tel,1,instr(tel,')')-1),'053','DAEGU')) "DAEGU",
        count(decode(substr(tel,1,instr(tel,')')-1),'055','GYEONGNAM')) "GYEONGNAM"
        from student;
        
        
--Quiz4
INSERT INTO emp(empno,deptno,ename,sal)VALUES(1000,10,'Tiger',3600);
insert into emp(empno,deptno,ename,sal)values(2000,10,'Cat',3000);
commit;

select decode(DEPTNO,null,' ',deptno)DEPTNO,
nvl(sum(decode(job,'CLERK',sal)),0)"CLERK", 
nvl(sum(decode(job,'MANAGER',sal)),0)"MANAGER",
nvl(sum(decode(job,'PRESIDENT',sal)),0)"PRESIDENT",
nvl(sum(decode(job,'ANALYST',sal)),0)"ANALYST",
nvl(sum(decode(job,'SALESMAN',sal)),0)"SALESMAN",
sum(sal)-nvl(sum(decode(job,null,sal)),0)TOTAL
from emp group by rollup(DEPTNO);

-----------------------------------------------------------
select deptno,
 decode(job,'CLERK',nvl(sal,0))"CLERK", 
 decode(job,'MANAGER',nvl(sal,0))"MANAGER",
 decode(job,'PRESIDENT',nvl(sal,0))"PRESIDENT",
 decode(job,'ANALYST',nvl(sal,0))"ANALYST",
 decode(job,'SALESMAN',nvl(sal,0))"SALESMAN"
from emp  ;



select  
 sum( decode(job,'CLERK',nvl(sal,0)))"CLERK", 
 sum(decode(job,'MANAGER',nvl(sal,0)))"MANAGER",
 sum(decode(job,'PRESIDENT',nvl(sal,0)))"PRESIDENT",
 sum(decode(job,'ANALYST',nvl(sal,0)))"ANALYST",
 sum(decode(job,'SALESMAN',nvl(sal,0)))"SALESMAN"
from emp  ;


select deptno , sal  from emp where job ='CLERK';
select  *  from emp  ;

select  deptno, 
 sum( decode(job,'CLERK',nvl(sal,0)))"CLERK", 
 sum(decode(job,'MANAGER',nvl(sal,0)))"MANAGER",
 nvl(sum(decode(job,'PRESIDENT',nvl(sal,0))) , 0)"PRESIDENT",
 sum(decode(job,'ANALYST',nvl(sal,0)))"ANALYST",
 sum(decode(job,'SALESMAN',nvl(sal,0)))"SALESMAN",
 sum( sal)  total
from emp  group by deptno;

--------------------------------------------------------



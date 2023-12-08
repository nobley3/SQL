
CREATE TABLE t_emp
(
eid VARCHAR2(13) NOT NULL PRIMARY KEY ,
ename VARCHAR2(20) ,
salary NUMBER(5) ,
deptno NUMBER(5) ,
comm NUMBER(5) 
);
COMMIT;
INSERT INTO t_emp VALUES ('e001' , '신동엽' , 280,10,100) ;
INSERT INTO t_emp VALUES ('e002' , '유재석' , 250,20,50) ;
INSERT INTO t_emp VALUES ('e003' , '전현무' , 190,30,0) ;
INSERT INTO t_emp VALUES ('e004' , '양세영' , 300,20,0) ;
INSERT INTO t_emp VALUES ('e005' , '양세찬' , 290,40,100) ;
CREATE TABLE t_dept
(
deptno NUMBER(5) NOT NULL PRIMARY KEY ,
dname VARCHAR2(20) 
);
COMMIT;
INSERT INTO t_dept VALUES (10 , '영업팀') ;
INSERT INTO t_dept VALUES (20 , '기획팀') ;
INSERT INTO t_dept VALUES (30 , '관리팀') ;
INSERT INTO t_dept VALUES (40 , '마케팅팀') ;
INSERT INTO t_dept VALUES (50 , '재무팀') ;

commit;

--view 만들기
create view v_emp
as 
select ename,deptno
from T_EMP;

select * from T_EMP;

select * from v_emp; 

--단순 view 생성

ENAME                                        DEPTNO
---------------------------------------- ----------
신동엽                                           10
유재석                                           20
전현무                                           30
양세영                                           20
양세찬                                           40

--복합view
create view v_emp2 
as
select e.ename,d.dname
from t_emp e, t_dept d
where e.deptno = d.deptno;

ENAME                                    DNAME
---------------------------------------- ----------------------------------------
신동엽                                   영업팀
양세영                                   기획팀
유재석                                   기획팀
전현무                                   관리팀
양세찬                                   마케팅팀

create view v_emp223
as
select e.ename,d.dname
from t_emp e 
join t_dept d
on e.deptno = d.deptno;

ENAME                                    DNAME
---------------------------------------- ----------------------------------------
신동엽                                   영업팀
양세영                                   기획팀
유재석                                   기획팀
전현무                                   관리팀
양세찬                                   마케팅팀

--인라인view
--from 절 뒤에오는 서브쿼리를 인라인뷰라고 한다.
SELECT e.deptno , d.dname , e.maxsal
FROM( 
SELECT deptno , MAX(salary) maxsal
FROM t_emp
GROUP BY deptno
) e , t_dept d
WHERE e.deptno = d.deptno 

select * from tbl_test_order;


--인라인view
--from 절 뒤에오는 서브쿼리를 인라인뷰라고 한다.
--일회성
select * 
from (
      select ocode, p_code, sale_cnt 
      from tbl_test_order          
)o --테이블의 별칭
      join tbl_test_goods g
      on o.pcode = g.pcode;
      
      
select * 
from (
      select ocode, p_code, sale_cnt 
      from tbl_test_order          
)o
      join tbl_test_goods g
      on o.pcode = g.pcode;

--서브쿼리
select * from t_emp;

select ENAME,SALARY 
from t_emp 
where SALARY>250;

select ENAME,SALARY 
from t_emp 
where SALARY>(select SALARY from T_EMP where T_EMP.ENAME='신동엽');

select * from t_emp
where DEPTNO in(20,40);

select * from t_emp
where DEPTNO in(select DEPTNO from T_DEPT where T_DEPT.DNAME='기획팀' or T_DEPT.DNAME='마케팅팀');

--평균급여 보다 많은 사람 조회
--서브쿼리 : 먼저 수행되는 쿼리
select ENAME,SALARY from t_emp where SALARY>(select avg(SALARY) from T_EMP);

--dml
--select 조회하기
--insert, update,delete
--commit으로 완성
--member_tbl_11

select * from member_tbl_11;
desc member_tbl_11;

--데이터 추가하기
--모든 컬럼의 값을 순서대로 입력해야함
insert into member_tbl_11 values('test','0000','서예진','000-111-222','1995-09-06',null,null);
insert into MEMBER_TBL_11(m_id,m_pw,m_name) values('test2','1234','홍길동');
commit;
select * from MEMBER_TBL_11;

---------------------------------------
--똑같은 복사본
create table professor3
as 
select * from professor;

select * from professor3;
--------------------------------------
--내용은 안들어간거
create table professor4
as
select * from professor
where 1=2;               --불일치 조건을 만든거임(데이터가 들어가지 않도록)

select * from professor4;

-------------------------
--빈 컬럼에 내용 집어넣음
insert into professor4
select * from PROFESSOR;

--update(데이터변경하기)
select * from MEMBER_TBL_11 where M_NAME='서예진';

update MEMBER_TBL_11
set M_TEL = '010-2587-9999'
where m_id='test';
commit;
select * from MEMBER_TBL_11;

--모든고객포인드 기존포인트에서 +1000 로 update 하기
--모든고객의 포인트금액 변경하기
--null인 고객은 1000으로 
update MEMBER_TBL_11
set M_POINT = nvl(M_POINT+1000,1000)
commit;

select * from MEMBER_TBL_11;

--delete 데이터삭제
delete from MEMBER_TBL_11 where M_ID='test';
commit;
select * from MEMBER_TBL_11; --서예진삭제된거확인가능

--DDL
--테이블 생성하기, 테이블컬럼 정보 수정하기, 테이블삭제하기
--문자: vachar2

create table member2(
id varchar2(7),
name varchar2(10)
);

--테이블정보 수정하기
alter table member2 modify id VARCHAR2(5); 
alter table member2 add(addr varchar2(5)); --추가
alter table member2 rename COLUMN id to user_id; --변경
alter table member2 drop COLUMN addr; --삭제
desc member2;

create table tt02
(no number(3,1)default 0,
name varchar2(10)default 'no name',
hiredate date default sysdate);

insert into tt02(no) values(1);
select * from TT02;

--테이블삭제하기
drop table tt2; --테이블자체를 삭제함(스키마까지 삭제)
truncate table tt2; --테이블 정보는 남는다 ( 스키마는 남는다)

select * from TBL_TEST_CUSTOMER;
select * from TBL_TEST_ORDER;
select * from TBL_TEST_GOODS;

insert into TBL_TEST_ORDER(OCODE,ODATE,id,pcode,sale_cnt) values('J009','2023-08-22','H007','p001',100);
select * from TBL_TEST_ORDER;
--결과 : 안들어간다(제약조건있을 시)
--결론적으로는 이 데이터가 정상적으로 들어가는것이 옳은가?


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
values('test01','01123333');  --오류발생

insert into test_2021_2(ID,PHONE)
values('test01','011-233-334567'); --제약조건으로 오류발생


create table test_2021_0
(
 id varchar2(50) not null, email varchar2(200) null , phone char(13) not null, 
 pwd varchar2(200) default '111' , 
 grade CHAR(2) CHECK( grade IN ('01', '02', '03')) 
);

insert into test_2021_0(ID,PHONE,grade)
values('test01','010-2345-6789','04'); --실패

insert into test_2021_0(ID,PHONE,grade)
values('test01','010-2345-6789','01'); --성공

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

insert into mem_tbl values( 'a1' , '홍길동' , '서울') ;
insert into mem_tbl values( 'a2' , '홍길순', '부산');

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


insert into new_emp1 values(3,'예진','950906222222',3,'10'  );

select * from DEPT2;

슈퍼키 : 유일성 만족 
후보키: (유일성, 최소성)
주키 : 후보키중에서 선택된 키
대체키 : 후보키중에서 나머지 키
                       
 학번      :  유일성 만족
 학번+학년  : 유일성 만족
                  ( 최소성위배)
                학번+학년 이라는 두 개
                정보가 반드시 있어야 한 학생을 식별할 수 있을 때 최소성을 만족한다라고 표현함
                  
학년+반+번호 => 키로 사용될 수 있음 
학번   이름   학년   반   번호  
 0001  이순신    1   1   10 
 0002 홍길동     1   5  3



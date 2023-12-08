
create table  acorntbl (
    id  varchar2(10) primary key,
    pw  varchar2(10) ,
    name varchar2(10)
);

insert into acorntbl values('dy', '4482', '곽단야');
insert into acorntbl values('mg','1234', '김민규');
insert into acorntbl  values('mj' ,'0000' , '김민지');
insert into acorntbl  values('bj','6666','김병진');
insert into acorntbl values('jy', '1127', '김재열');
insert into acorntbl values('hs', '0317', '김현수');
insert into acorntbl values('nj','9876','문나정');
insert into acorntbl values('jw', '1111', '박지원'); 
insert into acorntbl values('tm', '4482', '박태민');
insert into acorntbl values('yj','0117','서예진'); 
insert into acorntbl values('y','1126','이윤');
insert into acorntbl values('yj2','0625','이윤정');
insert into acorntbl values('jh','6789','이정훈');
insert into acorntbl  values('ek', '1234', '조은경');
insert into acorntbl values('jt','1234','표준태');
insert into acorntbl values('jh1', '7777', '허재혁');
insert into acorntbl values('jh2', '9999', '허재화');
commit;

select * from acorntbl;

--김씨조회
select * from acorntbl where name like '김%';

--sql : DBMS(데이터베이스관리시스템 소프트웨어+데이터베이스) 오라클11g
--sql : DBMS에 질의하는 언어(=문법이 있다)

--DML : (insert => creat, select =>read, udate, delete) : CRUD
--DDL 
--DCL : 권한을 주거나 회수

--조회하기
--select 컬럼명(여러개 올 수 있음), from 테이블명;
-- * : (모든컬럼)
--테이블스키마, 테이블구조 확인명령어 desc테이블명
desc emp;
--모든컬럼 조회
select*from emp;
--원하는 컬럼만 조회
select empno, ename, job from emp;

create table professor
(profno number(4) primary key,
 name  varchar2(20) not null, 
 id  varchar2(15) not null,
 position varchar2 (30) not null,
 pay number (3) not null,
 hiredate  date not null,
 bonus number(4) ,
 deptno  number(3),
 email  varchar2(50),
 hpage  varchar2(50));
 
 insert into professor
values(1001,'Audie Murphy','Murphy','a full professor',550,to_date('1980-06-23','YYYY-MM-DD'),100,101,'captain@abc.net','http://www.abc.net');

insert into professor
values(1002,'Angela Bassett','Bassett','assistant professor',380,to_date('1987-01-30','YYYY-MM-DD'),60,101,'sweety@abc.net','http://www.abc.net');

insert into professor
values (1003,'Jessica Lange','Lange','instructor',270,to_date('1998-03-22','YYYY-MM-DD'),null,101,'pman@power.com','http://www.power.com');

insert into professor
values (2001,'Winona Ryder','Ryder','instructor',250,to_date('2001-09-01','YYYY-MM-DD'),null,102,'lamb1@hamail.net',null);

insert into professor
values (2002,'Michelle Pfeiffer','Pfeiffer','assistant professor',350,to_date('1985-11-30','YYYY-MM-DD'),80,102,'number1@naver.com','http://num1.naver.com');

insert into professor
values (2003,'Whoopi Goldberg','Goldberg','a full professor',490,to_date('1982-04-29','YYYY-MM-DD'),90,102,'bdragon@naver.com',null);

insert into professor
values (3001,'Emma Thompson','Thompson','a full professor',530,to_date('1981-10-23','YYYY-MM-DD'),110,103,'angel1004@hanmir.com',null);

insert into professor
values (3002,'Julia Roberts','Roberts','assistant professor',330,to_date('1997-07-01','YYYY-MM-DD'),50,103,'naone10@empal.com',null);

insert into professor
values (3003,'Sharon Stone','Stone','instructor',290,to_date('2002-02-24','YYYY-MM-DD'),null,103,'only_u@abc.com',null);

insert into professor
values (4001,'Meryl Streep','Streep','a full professor',570,to_date('1981-10-23','YYYY-MM-DD'),130,201,'chebin@daum.net',null);

insert into professor
values (4002,'Susan Sarandon','Sarandon','assistant professor',330,to_date('2009-08-30','YYYY-MM-DD'),null,201,'gogogo@def.com',null);

insert into professor
values (4003,'Nicole Kidman','Kidman','assistant professor',310,to_date('1999-12-01','YYYY-MM-DD'),50,202,'mypride@hanmail.net',null);

insert into professor
values (4004,'Holly Hunter','Hunter','instructor',260,to_date('2009-01-28','YYYY-MM-DD'),null,202,'ironman@naver.com',null);

insert into professor
values (4005,'Meg Ryan','Ryan','a full professor',500,to_date('1985-09-18','YYYY-MM-DD'),80,203,'standkang@naver.com',null);

insert into professor 
values (4006,'Andie Macdowell','Macdowell','instructor',220,to_date('2010-06-28','YYYY-MM-DD'),null,301,'napeople@jass.com',null);

insert into professor
values (4007,'Jodie Foster','Foster','assistant professor',290,to_date('2001-05-23','YYYY-MM-DD'),30,301,'silver-her@daum.net',null);

commit;

select * from professor;
--select 명령에 표현식(리터럴)사용하여 출력하기
select name ,'good morning' "test"
from professor;

--컬럼별칭 사용하여 출력
--컬럼명 뒤에 as(생략가능) "별칭명" (공백도 들어갈 수 있음)
select profno as "Pro's No",name "Pro's Name",pay from professor;

--distinct 중복된 값을 제거하고 출력하기
select deptno from emp;
select distinct deptno from emp;

--연결연산자 || 컬럼명 연결해서 조회하고 싶을 때 사용
select ename || '님' as ename,job from emp;
select ename || '' || job from emp;

create table panmae
( p_date varchar2(8) not null,
  p_code number not null,
  p_qty  number ,
  p_total number ,
  p_store varchar2(5) ) ;
  
insert into panmae values ('20110101',100,3,2400,'1000');
insert into panmae values ('20110101',101,5,4500,'1001');
insert into panmae values ('20110101',102,2,2000,'1003');
insert into panmae values ('20110101',103,6,5400,'1004');
insert into panmae values ('20110102',102,2,2000,'1000');
insert into panmae values ('20110102',103,5,4500,'1002');
insert into panmae values ('20110102',104,3,2400,'1002');
insert into panmae values ('20110102',105,2,3000,'1000');
insert into panmae values ('20110103',100,10,8000,'1004');
insert into panmae values ('20110103',100,2,1600,'1000');
insert into panmae values ('20110103',100,3,2400,'1001');
  
insert into panmae values ('20110103',101,4,3600,'1003');
insert into panmae values ('20110104',100,2,1600,'1002');
insert into panmae values ('20110104',100,4,3200,'1003');
insert into panmae values ('20110104',100,5,4000,'1004');
insert into panmae values ('20110104',101,3,2700,'1001');
insert into panmae values ('20110104',101,4,3600,'1002');
insert into panmae values ('20110104',101,3,2700,'1003');
insert into panmae values ('20110104',102,4,4000,'1001');
insert into panmae values ('20110104',102,2,2000,'1002');
insert into panmae values ('20110104',103,2,1800,'1003');


commit;

--HY 라운드(LOUD) 오디션프로그램 
create table tbl_join_200(
  join_id varchar2(4)  not null primary key ,
  join_nm varchar2(20)  ,
  birth  char(8),
  gender char(1),
  specialty varchar2(1),
  charm varchar2(30)
);

insert into tbl_join_200 values( 'A001' , '케이쥬',  '20050102' , 'M', 'D', '깜찍댄스');
insert into tbl_join_200 values( 'A002' , '고키',  '20090102' , 'M', 'D', '동전마술');
insert into tbl_join_200 values( 'A003' , '나윤서',  '20070102' , 'M', 'D', '창작댄스');
insert into tbl_join_200 values( 'A004' , '장현수',  '20030103' , 'M', 'R', '보컬');
insert into tbl_join_200 values( 'A005' , '윤민',  '20020205' , 'M', 'V', '자작곡');



--멘토테이블 

create table tbl_mentor_200(
    mentor_id varchar2(4) not null primary key ,
    mentor_nm varchar2(20)
);

insert into tbl_mentor_200 values( 'J001', '박진영');
insert into tbl_mentor_200 values( 'J002', '박재상');
insert into tbl_mentor_200 values( 'J003', '보아');



create table tbl_score_200(
  score_no  number(6) not null ,
  artistid varchar2(4) not null,
  mentorid varchar2(4) not null,
  score number(3),
  primary key( score_no, artistid, mentorid)
);

insert into tbl_score_200 values( 110001, 'A001', 'J001' , 80);
insert into tbl_score_200 values( 110002, 'A001', 'J002' , 90);
insert into tbl_score_200 values( 110003, 'A001', 'J003' , 70);
insert into tbl_score_200 values( 110004, 'A002', 'J001' , 60);
insert into tbl_score_200 values( 110005, 'A002', 'J002' , 50);
insert into tbl_score_200 values( 110006, 'A002', 'J003' , 70);
insert into tbl_score_200 values( 110007, 'A003', 'J001' , 80);
insert into tbl_score_200 values( 110008, 'A003', 'J002' , 60);
insert into tbl_score_200 values( 110009, 'A003', 'J003' , 70);
insert into tbl_score_200 values( 110010, 'A004', 'J001' , 80);
insert into tbl_score_200 values( 110011, 'A004', 'J002' , 78);
insert into tbl_score_200 values( 110012, 'A004', 'J003' , 89);
insert into tbl_score_200 values( 110013, 'A005', 'J001' , 62);
insert into tbl_score_200 values( 110014, 'A005', 'J002' , 91);
insert into tbl_score_200 values( 110015, 'A005', 'J003' , 67);

---------

create table tbl_course_300 (
        s_id varchar2(5) not null primary key,
        s_name varchar2(20)  ,
        s_grade number(6),
        teacher_id varchar2(10) ,
        weekday char(2) ,
        start_h number(4),
        end_h  number(4)
);

insert into tbl_course_300 values('1001',  '한식만들기' , 2, 1, 'M' , 0900, 1100 );
insert into tbl_course_300 values('1002',  '양식만들기' , 2, 2, 'TU' , 0900, 1200 );
insert into tbl_course_300 values('1003',  '제과제빵' , 3, 4, 'W' , 0900, 1200 );
insert into tbl_course_300 values('1004',  '중식만들기' , 3, 4, 'TH' , 0900, 1200 );
insert into tbl_course_300 values('1005',  '음료만들기' , 2, 5, 'M' , 1300, 1600 );
insert into tbl_course_300 values('1006',  '분식만들기' , 3, 5, 'TH' , 1500, 1800 );
insert into tbl_course_300 values('1007',  '전통주만들기' , 3, 5, 'W' , 1330, 1630 );
insert into tbl_course_300 values('1008',  '반찬만들기' , 2, 3, 'TH' , 1330, 1530 );
insert into tbl_course_300 values('1009',  '김치만들기' , 3, 3, 'F' , 0900, 1200 );
insert into tbl_course_300 values('1010',  '떡만들기' , 3, 2, 'F' , 1300, 1600 );



create table tbl_lecturer_300(
    t_id number(6) not null primary key,
    t_name varchar2(20)  ,
    major varchar2(20),
    field varchar2(20)
);

 

insert into tbl_lecturer_300 values( 1, '정국교수','한식,중식' ,'중식');
insert into tbl_lecturer_300 values( 2, '뷔교수','한식,중식' ,'중식');
insert into tbl_lecturer_300 values( 3, '지민교수','한식,양식' ,'양식');
insert into tbl_lecturer_300 values( 4, '제이홉교수','한식,양식' ,'한식');
insert into tbl_lecturer_300 values( 5, '슈가교수','제과제빵' ,'제과');
insert into tbl_lecturer_300 values( 6, '진교수','분식및음료' ,'분식');
insert into tbl_lecturer_300 values( 7, 'RM교수','분식및음료' ,'분식');

-----------------

create table goods_tbl_500(
goods_cd varchar2(6) not null primary key, 
goods_nm varchar2(30), 
goods_price number(8), 
cost number(8), in_date date
); 


insert into goods_tbl_500 values('110001','육계장사발면',1050,750,'20190302');
insert into goods_tbl_500 values('110002','단팥빵',1300,800,'20190302'); 
insert into goods_tbl_500 values('110003','사브로',2000,1700,'20190302');
insert into goods_tbl_500 values('110004','칠성사이다',900,750,'20190302'); 
insert into goods_tbl_500 values('110005','콜라',750,300,'20190302'); 
insert into goods_tbl_500 values('110006','아몬드초콜릿',1500,1300,'20190302'); 
insert into goods_tbl_500 values('110007','초코몽',850,600,'20190302');


 create table store_tbl_500(
 store_cd varchar2(5) not null primary key,
 store_nm varchar2(20), 
 store_fg varchar2(1)
);

 insert into store_tbl_500 values('A001','노원점','0');
 insert into store_tbl_500 values('A002','마포점','0'); 
insert into store_tbl_500 values('A003','석계점','0'); 
insert into store_tbl_500 values('B001','하계점','1');
 insert into store_tbl_500 values('C001','상계점','1'); 
insert into store_tbl_500 values('D001','중계점','0');
 insert into store_tbl_500 values('D002','태릉입구점','1'); 
insert into store_tbl_500 values('E001','화랑대점','0');


 create table sale_tbl_500(
 sale_no varchar2(4) not null primary key, 
 sale_ymd date not null,
 sale_fg varchar2(1) not null, 
 store_cd varchar2(5)  ,         
 goods_cd varchar2(6) ,
 sale_cnt number(3),
 pay_type varchar2(2),
 constraint  fk1 foreign key (store_cd)  references store_tbl_500(store_cd),
 constraint  fk2  foreign key (goods_cd) references goods_tbl_500(goods_cd)
); 

insert into sale_tbl_500 values('0001','20190325','1','A001','110001',2,'02'); 
insert into sale_tbl_500 values('0002','20190325','1','B001','110003',2,'02');
 insert into sale_tbl_500 values('0003','20190325','1','D001','110003',1,'01'); 
insert into sale_tbl_500 values('0004','20190325','1','A001','110006',5,'02'); 
insert into sale_tbl_500 values('0005','20190325','1','C001','110003',2,'02'); 
insert into sale_tbl_500 values('0006','20190325','2','C001','110003',2,'02');
 insert into sale_tbl_500 values('0007','20190325','1','A002','110005',4,'02');
 insert into sale_tbl_500 values('0008','20190325','1','A003','110004',4,'02');
 insert into sale_tbl_500 values('0009','20190325','1','B001','110001',2,'01');
 insert into sale_tbl_500 values('0010','20190325','1','A002','110006',1,'02');

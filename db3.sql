select * from emp;


create table customer_prj3(
id varchar2(50) primary key,
pw varchar2(50) not null,
name varchar2(50) not null,
phone varchar2(50) not null,
resno varchar2(50),
pasno varchar2(50),
gender varchar2(10) not null
);


create table resvation_prj3(
resno varchar2(50) primary key,
fcode varchar2(50) not null
);


--drop table resvation_prj3;


create table flight_prj3(
fcode varchar2(50) primary key,
departure varchar2(50) not null,
arrival varchar2(50) not null,
sday date not null,
eday date not null,
stime varchar2(50) not null,
etime varchar2(50) not null,
airnum varchar2(50) not null
);


create table seat_prj3(
airnum varchar2(50) primary key,
seatgrade varchar(50) not null,
seatnum varchar2(50) not null
);

insert into seat_prj3 values('A001', '이코노미', '100');
insert into seat_prj3 values('A002', '비즈니스', '200');


insert into flight_prj3 values('K001', '서울', '부산', '230914', '230914', '9시', '11시', '1234');
insert into flight_prj3 values('K002', '서울', '일본', '230914', '230914', '9시', '12시', '2345');


insert into resvation_prj3 values('123', 'K001');
insert into resvation_prj3 values('234', 'K002');


insert into customer_prj3(id, pw, name, phone, gender) values('test01', 'pw1234', '이름', '01012345678', 'W');


select * from seat_prj3;
select * from flight_prj3;
select * from resvation_prj3;
select * from customer_prj3;
select * from seat_prj3;
select * from acorntbl;

drop table seat_prj3;
--drop table customer_prj3;

create table customer_prj3(
id varchar2(50) primary key,
pw varchar2(50) not null,
name varchar2(50) not null,
phone varchar2(50) not null,
pasno varchar2(50),
gender varchar2(10) not null
);

--drop table resvation_prj3;

create table resvation_prj3(
resno varchar2(50) primary key,
fcode varchar2(50) not null,
id varchar2(50)
);

insert into resvation_prj3  values('A835689','A001','아이디1');
insert into resvation_prj3  values('A968723','A002','아이디2');
insert into resvation_prj3  values('A642893','A003','아이디3');

create table flight_prj3(
fcode varchar2(50) primary key,
departure varchar2(50) not null,
arrival varchar2(50) not null,
sday date not null,
eday date not null,
stime varchar2(50) not null,
etime varchar2(50) not null,
airnum varchar2(50) not null --항공기코드
);

insert into flight_prj3 values('A001','인천','대만','230913','230913','10am','12am','KE381');
insert into flight_prj3 values('A002','인천','베트남','230918','230918','8pm','1am','DL242');
insert into flight_prj3 values('A003','인천','싱가폴','230813','230813','13pm','18pm','QR642');

--drop table flight_prj3;

create table aircraft_prj3( --항공기 테이블
airnum varchar2(50) primary key, --항공기코드
airname varchar2(50) not null, --항공기명.
seatcode varchar2(50) not null
);

insert into aircraft_prj3 values('KE381','대한항공','G37');
insert into aircraft_prj3 values('DL242','델타항공','H101');
insert into aircraft_prj3 values('QR642','카타르항공','B69');

create table seat_prj3(
seatcode varchar2(50) primary key,
seatgrade varchar(50) not null,
seatnum varchar2(50) not null
);

select r.RESNO,r.FCODE,f.DEPARTURE,f.ARRIVAL 도착지,substr(f.SDAY, 1,10)출발일,substr(f.EDAY, 1,10)도착일,f.STIME,f.ETIME,a.AIRNUM,a.AIRNAME
from flight_prj3 f 
join aircraft_prj3 a
on f.airnum=a.airnum
join resvation_prj3 r
on  r.FCODE = f.FCODE;


 
commit;

DELETE
FROM resvation_prj3 r
WHERE r.RESNO = ?
AND EXISTS (
    SELECT 1
    FROM flight_prj3 f
    WHERE r.FCODE = f.FCODE
    AND EXISTS (
        SELECT 1
        FROM aircraft_prj3 a
        WHERE f.airnum = a.airnum
    )
);

create table drama_tbl(
   code   varchar2(5)  primary key ,
   title  varchar2(20) ,
   actors varchar2(30) );

insert into drama_tbl values('tvN01','무인도의디바','박은빈');
insert into drama_tbl values('tvN02','시그널','김혜수,이제훈');
insert into drama_tbl values('tvN03','빈센조','송중기');
insert into drama_tbl values('tvN04','철인왕후','신혜선');
insert into drama_tbl values('tvN05','미스터 션샤인','김태리,이병현');

--drop table drama_tbl;
commit;

select * from drama_tbl;



CREATE SEQUENCE memo_tbl_sequence
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

/*
create table memo_tbl(
code varchar2 (20)DEFAULT TO_CHAR(memo_tbl_sequence.NEXTVAL,'A001') primary key,
num number(38),
content varchar2(200) 
);
*/

CREATE TABLE memo_tbl (
    code VARCHAR2(20) PRIMARY KEY,
    content VARCHAR2(200)
);
 
--INSERT INTO memo_tbl(code,num,content) VALUES('A001',1,'');
--INSERT INTO memo_tbl(code,num,content) VALUES('A002',memo_tbl_sequence.NEXTVAL,'');
INSERT INTO memo_tbl VALUES(memo_tbl_sequence.nextval, '첫번째메모');
INSERT INTO memo_tbl VALUES(memo_tbl_sequence.nextval, '두번째메모');
INSERT INTO memo_tbl VALUES(memo_tbl_sequence.nextval, '세번째메모');
commit;
 
select * from memo_tbl;
select 'A' || code, content from memo_tbl;

--drop table  memo_tbl;
--drop trigger code_trigger;
--drop SEQUENCE memo_tbl_sequence;

 select  'A' ||  to_char( memo_tbl_sequence.NEXTVAL , 'FM000') from dual;

commit;


create table membertbl(
  id varchar2(10) primary key,
  pw varchar2(10) ,
  name varchar2(20) ,
  tel varchar2(20)
);

insert into  membertbl values( 'hong' , '0000', '홍길동' , '010-1111-3456');
insert into  membertbl values( 'kim' , '1234', '김길동' ,  '010-2222-7890');
insert into  membertbl values( 'lee' , '9999', '이길동' ,  '010-5555-1234');
insert into  membertbl values( 'choi' , '0987', '최길동' , '010-9999-0123');

commit;

select * from membertbl;


create table membertb (
   id varchar2(10) primary key,
   pwd varchar2(10) ,
   name varchar2(10) 
 );

insert into membertb values('test01','1234','서예진');
insert into membertb values('test02','5678','손예진');


* // 조인된 쿼리를 저장할 테이블
 create table ordera(
     orderno varchar2(10) primary key, 
     userid  varchar2(10),
     price  varchar2(10) 
 );
insert into ordera  values(  'o001', 'm01', '25000');
insert into ordera  values(  'o00', 'm01', '25000');


create table membera(
   userid varchar2(20) primary key, 
   username varchar2(20),
   tel varchar2(20)
);

insert into membera values( 'm01', '홍길동', '010-1111-2222');
insert into membera values( 'm02', '김길동', '010-2451-3562');
commit;

select * from membera;


create table ordera(
     orderno varchar2(10) primary key, 
     userid  varchar2(10),
     price  varchar2(10) 
 );
insert into ordera  values(  'o001', 'm01', '25000');

select * from ordera;
commit;

//장바구니테이블
create table cart_tbl(
  cartNO  number(4)  primary key ,
  memberId varchar2(10) ,
  goodsNo  varchar2(10),
  cartQty     number(4)
);


insert into cart_tbl  values( 1, 'test01' , 'g001' ,3);
insert into cart_tbl  values( 2, 'test01' , 'g002' ,1);
insert into cart_tbl  values( 3, 'test02' , 'g002' ,1);
	 
// 상품테이블
create table goods_tbl (
  goodsNo  varchar2(10)  primary key,
  name varchar2(10) ,
  price number(4)
);

insert into goods_tbl  values( 'g001' ,'pants' , 2500);
insert into goods_tbl  values( 'g002' , 't-shirts', 3000);
insert into goods_tbl  values( 'g003' , 'vest', 4000);

 
create table ordertbl  (
   orderNo number(4)  primary key,
   memberId varchar2(10)  , 
   goodsNo varchar2(10) ,
   goodsName varchar2(10),
    qty varchar2(4) , 
   amount number(10) ,
   addr1 varchar2(20) ,
   addr2 varchar2(20 ),
   tel varchar2(13),
   name varchar2(20)
);

 
create sequence order_seq_num ;

commit;

create table gongchatbl (
itemNo varchar2(20) primary key,
chaName varchar2(20),
chaPrice varchar2(10)
);


--drop table gongchatbl;

insert into gongchatbl values('G001','블랙밀크티','4700');
insert into gongchatbl values('G002','자몽그린티','4800');
insert into gongchatbl values('G003','망고요구르트','5200');

select * from gongchatbl;
select * from membertb;
commit;

create table membertbtest2 (
     id  varchar2(20) primary key, 
     name varchar2(20) , 
     latitude number(20.6), 
     longitude number(20.6)
 );
 
 
 select * from testdb;

  create table testdb(	
	  id varchar2(10 ) primary key , 
	  pw varchar2(10)
   );
 
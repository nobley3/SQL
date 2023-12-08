--비행테이블
create table flightinfo_tbl(
  airline_code varchar2(5)primary key,
	airline_name varchar2(50)not null,
	airplane_code varchar2(10) not null,
	airport_code  char(2) check(airport_code in ('T1','T2')),
	bording_gate  number(3) not null 
);
--비행테이블INSERT----------------------------------------------------------------
--drop table flightinfo_tbl;

insert into flightinfo_tbl values('KE347','대한항공','B703','T2',42);
insert into flightinfo_tbl values('MU562','동방항공','B712','T2',24);
insert into flightinfo_tbl values('DL242','델타항공','B720','T1',16);
insert into flightinfo_tbl values('QR642','카타르항공','B721','T1',101);
insert into flightinfo_tbl values('SQ745','싱가포르항공','B722','T1',33);
COMMIT;

select * from FLIGHTINFO_TBL;
desc flightinfo_tbl;

--고객테이블----------------------------------------------------------------------

create table cusinfo_tbl(
	cus_name varchar2(50) not null,
	FM  varchar2(5)  check (FM in('F','M')),
	birth varchar2(10) not null,
	passport_num  varchar2(10) not null primary key,
	departure     varchar2(30) default 'ICN',
	destination   varchar2(30) not null

);
--고객테이블INSERT----------------------------------------------------------------
--drop table cusinfo_tbl;

desc cusinfo_tbl;

insert into cusinfo_tbl values('서예진','F','19950906','M53801234','ICN','BKK');
insert into cusinfo_tbl values('박서준','M','19881216','M12345678','ICN','PVG');
insert into cusinfo_tbl values('이민기','M','19850116','M23456789','ICN','SYD');
insert into cusinfo_tbl values('주지훈','M','19820516','M34567891','ICN','MXP');
insert into cusinfo_tbl values('한소희','F','19941118','M45678912','ICN','FUK');
COMMIT;

--------------------------------------------------------------------------------

--잘못넣어보기
insert into cusinfo_tbl values('홍길동','N','19873536','M53801234''BKK','ICN');
select * from CUSINFO_TBL; 

--테이블수정 passport_num varchar2 (10)->(9)
alter table cusinfo_tbl modify passport_num varchar2(9);
alter table cusinfo_tbl modify DEPARTURE varchar2(3) default 'ICN';

--UPDATE  BKK -> PVG
update cusinfo_tbl
set destination = 'PVG'
where cus_name='서예진';
commit;

select * from CUSINFO_TBL;

--메인테이블----------------------------------------------------------------------

create table main_tbl(
  co_num char(10)not null primary key,
  airline_code VARCHAR2(5)
  constraint ac_fk references flightinfo_tbl(airline_code),
  passport_num varchar2(9)
  constraint ps_fk references cusinfo_tbl(passport_num),
  d_date varchar2(8) not null,
  a_date varchar2(8) not null
);

--drop table main_tbl;


--메인테이블INSERT----------------------------------------------------------------

insert into main_tbl values(1,'KE347','M53801234','20230906','20230910');
insert into main_tbl values(2,'MU562','M12345678','20231021','20231110');
insert into main_tbl values(3,'DL242','M23456789','20231201','20231206');
insert into main_tbl values(4,'QR642','M34567891','20230923','20230930');
insert into main_tbl values(5,'SQ745','M45678912','20231127','20231207');
commit;

select * from main_tbl;
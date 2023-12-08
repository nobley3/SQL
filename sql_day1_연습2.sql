create table member_tbl_11(
m_id varchar2(5) not null primary key , 
m_pw varchar2(5) , 
m_name varchar2(10) , 
m_tel varchar2(13) , 
m_birthday date , 
m_point number(6) , 
m_grade varchar2(2) 
);
commit;

insert into member_tbl_11 values ('m100' , '1234' , '성기훈', '010-1111-2222' , '2004-01-01' , 100, '01');
insert into member_tbl_11 values ('m101' , '4444' , '김상우', '010-2222-3333' , '2004-01-01' , 1500, '01');
insert into member_tbl_11 values ('m102' , '5555' , '김일남', '010-3333-4444' , '2004-12-10' , 2000, '02');
insert into member_tbl_11 values ('m103' , '6666' , '이준호', '010-4444-5555' , '2004-04-10' , 1900, '02');
insert into member_tbl_11 values ('m104' , '7777' , '김새벽', '010-5555-6666' , '2004-09-12' , 3000, '03');
insert into member_tbl_11 values ('m105' , '8888' , '최덕수', '010-6666-7777' , '2004-08-10' , 4800, '03');
insert into member_tbl_11 values ('m106' , '9999' , '이알리', '010-7777-8888' , '2004-07-10' , 2900, '01');
insert into member_tbl_11 values ('m107' , '0101' , '김미녀', '010-8888-9999' , '2004-06-09' , 1200, '01');
insert into member_tbl_11 values ('m108' , '0404' , '이정재', '010-9999-8888' , '2004-05-19' , 3000, '03');
insert into member_tbl_11 ( m_id, m_pw, m_name , m_tel , m_birthday) 
values ('m109' , '0448' , '박해수', '010-7878-1111' , '2004-11-27' );
insert into member_tbl_11 ( m_id, m_pw, m_name , m_tel , m_birthday) 
values ('m110' , '4848' , '위하준', '010-8888-9090' , '2004-11-09');
commit;

--1. 고객등급이 ‘01’이고 포인트가 2000이상인 고객의 아이디, 이름 정보를 조회하시오
select M_ID,M_NAME from member_tbl_11 where M_GRADE like '01' and M_POINT>=2000;

--2. 고객등급이 ‘01’ 이거나 포인트가 2000이상인 고객의 아이디, 이름 정보를 조회하시오
select M_ID,M_NAME from member_tbl_11 where M_GRADE like '01' or M_POINT>=2000;

--3. 김씨성을 가진 고객의 아이디, 이름, 등급 정보를 조회하시오
--( 예) 김길동, 김홍식 , 김지성... 김으로 시작되는 이름)
select M_ID,M_NAME,M_GRADE from member_tbl_11 where M_NAME like '김%';

--4. 이름이 수로 끝나는 고객의 아이디, 이름 , 등급 정보를 조회하시오
select M_ID,M_NAME,M_GRADE from member_tbl_11 where M_NAME like '%수';

--5. 고객등급이 ‘01’, ‘03’ 인 고객의 아이디, 이름, 등급 정보를 조회하시오( IN 연산자 사용해 주세요) 
select M_ID,M_NAME,M_GRADE from member_tbl_11 where M_GRADE in('01','03');

--6. 고객등급이 ‘01’, ‘02’ 이 아닌 고객의 아이디, 이름, 등급 정보를 조회하시오( NOT IN 연산자 사용 해 주세요)
select M_ID,M_NAME,M_GRADE from member_tbl_11 where M_GRADE not in('01','02');

--7. 고객등급이 ‘02’ 이거나 이름이 이씨성을 가진 고객의 정보의 아이디와 이름 , 등급 정보를 조회 하시오
select M_ID,M_NAME,M_GRADE from member_tbl_11 where M_GRADE like '02' or M_NAME like '이%';

--8. 생일이 2004-05-01이전에 태어나거나 고객등급이 ‘03’인 고객의 아이디, 이름, 생일 정보를 조회하시오
select M_ID,M_NAME,M_BIRTHDAY from member_tbl_11 where M_BIRTHDAY < '2004/05/01' or M_GRADE like '03';
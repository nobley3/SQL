-- select * from 테이블명
-- select * from 테이블명 where 조건

select * from acorntbl;
select * from acorntbl where name like '이_';
select * from acorntbl where name like '이%';

-- 단일함수 (문자, 날짜, 변환함수, 일반함수)
select ename, initcap(ename) from emp; -- 첫 글자만 대문자로 변환해줌
select ename, lower(ename) from emp; -- 소문자로 변환해줌
select ename, upper(ename) from emp; -- 대문자로 변환해줌
select ename, length(ename) from emp; -- 문자열의 길이

select * from ACORNTBL;
select length(name), lengthb(name) from acorntbl; -- lengthb() 바이트수를 구해줌

select * from emp;

select  ename || '   ' ||job as name from emp; 
select concat( ename, job) from emp;

-- substr() 문자열의 일부를 추출할 때
-- (문자열, 시작위치, 가져올 개수)
select substr(ename, 2,3)  from emp;
select 'abcde' from dual; -- dual 가상테이블
select substr('hi hello',4) from dual; -- => hello 출력
select name from ACORNTBL;
select substr(name, 2) from ACORNTBL;

-- 시작위치가 -이면 오른쪽기준으로 시작위치가 정해짐
select substr(name, -1,2) from ACORNTBL;

-- instr() : 문자열에서 특정 문자의 위치를 반환함.
select instr('A-B-C-D','-',1,3) from dual;
select instr('032)851-1234',')') from dual;

select * from student;
select name , tel from student;
-- 전화번호 에서 ) 문자 위치 찾기
select name, instr(tel,')') from student;
-- 전화번호에서 ) 문자 위치 -1 (가져올 개수 구하기)
select name, substr(tel, 1,instr(tel,')')-1) from student;

-- lpad() 함수
select * from student;
select id from student;
-- lpad(문자열, 전체자리수, 채움문자)
select lpad(id, 10, '*') from student;

-- trim() : 공백제거 (양쪽 공백제거)
-- ltrim() : 왼쪽공백제거
-- rtrim() : 오른쪽공백제거

select  '     abc   ' || 'b' from dual;
select trim( '     abc   ') || 'b' from dual;
select ltrim( '     abc   ') || 'b' from dual;
select rtrim( '     abc   ') || 'b' from dual;

-- replace
select * from emp;
select ename , replace(ename,'M','*') from emp;

select ename, replace(ename, 'SM'  ,'**') from emp; --SM이라는 문자만 **로 바뀜
select substr(ename, 1,2) from emp;
select ename, replace(ename, substr(ename, 1,2)  ,'**') from emp;

-- 84,85
select ename, replace(ename, substr(ename,2,2),'--') as REPLACE from emp;
select name, jumin, replace(jumin,substr(jumin,7),'-/-/-/-') as REPLACE from student;
select name, tel, replace(tel,substr(tel,5,3),'***') as REPLACE from student where deptno1='102';
select name, tel, replace(tel,substr(tel,9),'****') as REPLACE from student where deptno1='101';

--
select name, tel, substr(tel, 1,instr(tel,')')-1)  as "AREA CODE" from student where deptno1='201';

-- 숫자함수
-- round(숫자, 자리수) 반올림
-- 자리수가 -이면 소수점 기준 왼쪽
select round(987.654,2) from dual;
select trunc(987.652,2) from dual;
select trunc(987.652,-1) from dual; --원단위 절사
select trunc(987.652,-2) from dual; --십단위 절사

select ceil(12.3456) from dual; -- 정수올림
select floor(12.3456) from dual; -- 정수내림
-- 나머지구하기 mod(피제수, 제수)
select mod(10,2) from dual;

-- 날짜함수
-- sysdate 현재날짜구하기
select sysdate from dual;
-- months_between(큰날짜, 작은날짜) : 두 날짜 사이의 개월 수 구하기
select months_between('20230901','20230801') from dual;
select months_between('23/09/01','23/08/01') from dual;

-- next_day() 기준일 다음에 오는 요일에 해당하는 날짜구하기
select next_day('2023-08-18','월') from dual;

-- 현재날짜기준 3일 뒤 구하기
select sysdate+3 from dual;
-- 특정날짜를 기준으로 3일 뒤 구하기
select to_date('2023/08/18') + 3 from dual;

-- 형변환 함수 
-- 숫자, 날짜로 ==> 문자로 반환 ( 원하는 형식으로 포맷해서 조회하기)
select 123456 from dual;
select to_char(123456, '999,999') from dual;
select to_char(123456, 'L999,999') from dual; -- 원화표시
select to_char(123456, '$999,999') from dual; -- 달러표시
-- 주의사항 표현될 숫자의 자리수보다 9의 개수가 적으면 ##### 표현됨
select to_char(123456, '0999,999') from dual;

-- 날짜를 => 문자로 반환
select sysdate from dual;
select to_char(sysdate,'yyyy-mm-dd') from dual;
select to_char(sysdate,'yyyy-mm-dd day') from dual;
select to_char(sysdate,'yyyy-mm-dd dy') from dual;

select to_char(sysdate,'yyyy/mm/dd') from dual;
select sysdate from dual;
select to_char(sysdate,'yyyy"년"mm"월"dd"일"') from dual;

select * from emp;
select empno, ename, sal, comm from emp;
select empno, ename, (sal*12) +comm from emp;
select empno, ename, to_char((sal*12) +comm,'999,999')as 연봉 from emp;

desc professor;
select * from professor;
select name, pay, bonus from professor;
select name, (pay*10)+ bonus from professor;
select name, to_char((pay*10)+ bonus) from professor;

-- to_number() 함수
select '5'+3 from dual; -- 자동형변환(묵시적형변환)
select to_number('5') + 3 from dual; -- 명시적형변환 숫자형태로된 문자를 실제 숫자로 반환하는 함수

-- to_date() 함수: 문자형태로된 날짜데이터를 실제 날짜데이터로 변환하는 함수
select to_date('2023/08/18') + 3 from dual; 

-- 일반함수 nvl{} nvl2{}
-- null인 경우 다른값으로 치환해주는 함수

select * from professor;
select name, bonus from professor;
select name, nvl(bonus,0)  from professor;
select name, (pay*12)+bonus as "연봉"  from professor;
select name, nvl((pay*12)+bonus,0) as "연봉"  from professor;
select name, to_char(nvl((pay*12)+bonus,0),'999,999') as "연봉"  from professor;

select bonus from professor;
select bonus, nvl2(bonus, bonus*2, 100) from professor;
-- nvl2(컬럼, null이 아닌 경우, null인 경우)

-- decode() 함수
select * from member_tbl_11;
select m_grade, decode(m_grade ,'01' , ' VIP','02','우수','03', '브론즈') from member_tbl_11;

-- 120 퀴즈2
select * from student;
select substr(tel,1,3) from student;
select substr(tel,1,instr(tel,')')-1)  from student;
select name, tel, decode(substr(tel,1,instr(tel,')')-1),'02','서울','031','경기','051','부산','052','울산','055','경남') as LOC from student;

-- case when
-- select 열이름, case when [조건] then [결과값]
-- when [조건] then [결과값]
-- else [결과값]
-- end as 새로운 컬럼명
-- from 테이블명;
select * from member_tbl_11;
select m_point from member_tbl_11;
select m_point, case 
                              when m_point >= 2000 then '상'
                              when m_point >= 1500 then '중'
                              else '하'
                              end as "결과" from member_tbl_11;
                              
-- 복수행함수 집계함수, sum(), avg(), max(), min()
-- count(*) , count(컬럼명)
select * from MEMBER_TBL_11;
select sum(m_point) from MEMBER_TBL_11;
select avg(m_point) from MEMBER_TBL_11;
select max(m_point) from MEMBER_TBL_11;
select min(m_point) from MEMBER_TBL_11;
select count(*) from MEMBER_TBL_11; -- MEMBER_TBL_11 테이블의 행의 개수를 구한다. 전체행의 개수 구하기
select count(m_point) from MEMBER_TBL_11; -- MEMBER_TBL_11 컬럼명으로 count할 때는 해당컬럼의 null 값은 제외하고 count

-- group by , 집계함수와 함께 사용한다.
select * from MEMBER_TBL_11;
select m_grade, m_point from MEMBER_TBL_11;

select m_grade, sum(m_point )
from MEMBER_TBL_11
group by m_grade;

-- having 절 사용하기 (선택), group by 결과 내에서 조건에 맞는것만 추출할 때 
select m_grade, m_point from MEMBER_TBL_11;

-- select 쿼리 실행순서
select m_grade, sum(m_point )  -- 4번
from MEMBER_TBL_11 -- 1번
group by m_grade          -- 2번
--having total >= 5000;    select 있는 별칭을 사용할 수 없다. 쿼리의 순서가 있다.
having sum(m_point ) >= 5000;  -- 3번

select m_grade, sum(m_point )  as "total"
from MEMBER_TBL_11
group by m_grade    
having sum(m_point ) >= 5000
order by "total" desc;

-- count()  , count(*),    count(컬럼명)
select * from emp;
select count(*) from emp;
select count(ename) from emp;
select count(comm) from emp;   -- 해당하는 컬럼의 값이 null을 제외하고 카운트함

select sum(comm) from emp;   -- null이 제외되고 합계가 구해진다.
select avg(comm) from emp;
select MAX(comm) from emp;
select min(comm) from emp;

-- group by
select * from emp;
-- group by 이전의 조회를 확인하기
select deptno, sal from emp;
-- 부서별 sal의 평균을 구하기
select deptno, sum(sal) from emp
group by deptno;

-- having은 이전에 group by가 된 상황에서 사용된다
-- group by 없는데 having 없다!!
-- group된 결과내에서 조건을 사용할 때는 having이 와야 함
select deptno, sum(sal) 
from emp
group by deptno
having sum(sal) >= 7000;

select * from emp;
select deptno, job, sal
from emp;

select deptno, job, sum(sal)
from emp
group by deptno, job
order by 1, 3 desc;
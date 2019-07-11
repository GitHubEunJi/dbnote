-- -78과 +78의 절댓값을 구하시오.
select abs(-78), abs(+78)
from dual;

-- 4.875를 소수 첫째 자리까지 반올림한 값을 구하시오.
select round(4.875, 1)
from dual;

-- 고객별 평균 주문 금액을 백원 단위로 반올림한 값을 구하시오.
select custid "고객번호", round(sum(saleprice)/count(*), -2) "평균금액"
from orders
group by custid;

-- 도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서 목록을 보이시오.
select bookname, replace(bookname, '야구', '농구')
from book;

-- 굿스포츠에서 출판한 도서의 제목과 제목의 글자 수, 바이트 수를 보이시오.
select bookname, length(bookname), lengthb(bookname)
from book
where publisher = '굿스포츠';

-- 마당서점의 고객 중에서 같은 성(姓)을 가진 사람이 몇 명이나 되는지 성별 인원 수를 구하시오.
select substr(name, 1, 1) "성", count(*) "인원"
from customer
group by substr(name, 1, 1);

-- 마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오.
select orderdate "주문일자", to_date(orderdate, 'yyyy-mm-dd')+10 "주문확정일자"
from orders;

-- 마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오. (다른 표현 방식)
select orderdate "주문일자" , orderdate+10 "주문확정일자"
from orders;


-- 마당서점이 2014년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 보이시오. 단 주문일은 'yyyy-mm-dd 요일' 형태로 표시한다.
select orderid, to_char(orderdate, 'yyyy-mm-dd day'), custid, bookid
from orders
where orderdate = to_date('20140707', 'yyyy-mm-dd');

-- 마당서점이 2014년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 보이시오. 단 주문일은 'yyyy-mm-dd 요일' 형태로 표시한다.(다른 표현 방식)
select orderid, to_char(orderdate, 'yyyy-mm-dd day'), custid, bookid
from orders
where orderdate = '2014-07-07';   --(이렇게 쓰는 것은 비추)

-- DBMS 서버에 설정된 현재 날짜와 시간, 요일을 확인하시오.
select sysdate, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') "sysdate_1"
from dual;

-- 이름, 전화번호가 포함된 고객목록을 보이시오. 단, 전화번호가 없는 고객은 '연락처없음'으로 표시하시오.
select name,nvl(phone, '연락처없음')
from customer;

-- 고객 목록에서 고객번호, 이름, 전화번호를 앞의 두 명만 보이시오.
select rownum "순번", custid, name, phone
from customer
where rownum <= 2;

-- 마당서점의 고객별 판매액을 보이시오(고객이름과 고객별 판매액 출력).
select (select name
        from customer cs
        where cs.custid = od.custid) "name", sum(saleprice) "total"
from orders od
group by od.custid;

-- Orders 테이블에 각 주문에 맞는 도서이름을 입력하시오.
alter table orders add bookname varchar2(40);

update orders
set bookname = (select bookname
                from book
                where book.bookid = orders.bookid);

-- 고객번호가 2 이하인 고객의 판매액을 보이시오.(고객이름과 고객별 판매액 출력).


-- 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 보이시오.


-- 각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해서 주문번호, 고객번호, 금액을 보이시오.


-- 대한민국에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.


-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 보이시오.


-- EXISTS 연산자를 사용하여 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오.


/* --------뷰(VIEW)--------
뷰는 하나 이상의 테이블을 합하여 만든 가상의 테이블.

--------뷰(VIEW)의 종류--------
단순뷰(Simple View) - 뷰생성 서브쿼리에 조인 조건없이 1개의 테이블로부터 만들어지는 뷰
복합뷰(Complex View) - 뷰생성 서브쿼리에 여러개의 테이블이 조인되어 생성되는 뷰
인라인뷰(Inline View) - 해당 질의에서만 필요한 뷰일 경우 FROM절에 서브쿼리를 바로 적어서 사용하는 뷰 (테이블이 만들어지지 않는 뷰)

--------뷰(VIEW)의 생성--------
CREATE [OR REPLACE ] VIEW 뷰네임   ///////[REPLACE] ------- 뷰 이름이 같을 경우 REPLACE를 이용해 이름을 바꿔주겠다.라는 것을 뜻함
AS 
    SELECT [원 테이블에서 가지고 올 속성명]
    [WITH READ ONLY]
*/
    
--------뷰 생성 연습--------
-- 원 테이블 생성
create table o_table(
    a number,
    b number,
    c number);

create or replace view view1
as
select a, b
from o_table;

create or replace view view2
as
select a, b
from o_table
with read only;


insert into view2 values(99, 99);


select *
from o_table;

select *
from view2;

update o_table set b=1 where a=1;

select * from user_views;
select * from tabs;

create or replace view view1
as
select b, c
from o_table;


create or replace view vw_customer(custid, name, address)
as select custid, name, address
from customer
where address like '%영국%';

select *
from vw_customer;

create or replace view highorders
as select b.bookid, b.bookname, c.name, b.publisher, o.saleprice
from orders o, customer c, book b
where o.bookid = b.bookid and o.custid = c.custid and saleprice >= 20000;

select *
from highorders;

/*
--------INDEX(인덱스)의 생성--------
CREATE [REVERSE] [UNIQUE] INDEX [인덱스이름]
ON 테이블이름 (컬럼 [ASC/DESC] [{, 컬럼 [ASC/DESC]} ...])[;]
*/

create table test(no number);

begin
for i in 1..10000 loop
insert into test values(i);
end loop;
commit;
end;
/

select * from test;
select * from test where no = 9999;

create index idx_test_no on test(no);

-- 인덱스의 상태를 조회하는 방법 (알아두기)
-- ANALYZE INDEX [인덱스 이름] VALIDATE STRUCTURE;
ANALYZE index idx_test_no validate structure;
select (del_lf_rows_len / lf_rows_len) *100 balance
from index_stats
where name='IDX_TEST_NO';

-- 레코드 삭제
delete from test
where no between 2500 and 6500;

-- 인덱스를 리빌드
alter index idx_test_no rebuild;

ANALYZE index idx_test_no validate structure;

select (del_lf_rows_len / lf_rows_len) *100 balance
from index_stats
where name='IDX_TEST_NO';
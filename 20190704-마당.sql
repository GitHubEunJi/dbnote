create table book(
    bookid number(5) not null,
    bookname varchar2(50) not null,
    publisher varchar2(30) not null,
    price number(6),
    primary key (bookid)
);
-- constraint : 제약조건

/*
INSERT 구문
insert into 테이블 이름
values {값리스트.......};
*/

insert into book values (1, '레미제라블', '대한출', 14000);
insert into book (bookid, bookname, publisher) values (2, '장발장', '한빛');

select *
from book;

update book
set price  = 30000;

-- 이렇게 작성하게 되면 테이블 안에 전체 레코드들이 삭제가 됨
delete from book;

-- 지금 당장 트랜잭션이 없어서 ROLLBACK을해도 내용이 복원되지 않는다.
rollback;

select *
from book;

-- WHERE절을 사용했기 때문에 bookid가 2인 레코드만 삭제가 됨
delete from book
where bookid = 2;

-- 테이블 삭제 (DROP 이용)
drop table book;

create table book(
    bookid number(5),
    bookname varchar2(50) not null,
    publisher varchar2(30) not null,
    price number(6),
    primary key (bookid)
);


create table customer (
custid number(5),
name varchar(20) not null,
address varchar(50) not null,
phone varchar(30) not null,
primary key(custid)
);

/* 외래키 적용 create 구문
create table 테이블명 (
주키속성명,
.......
외래키속성명,
.......
PRIMARY KEY(주키속성명)
FOREIGN KEY(외래키속성명 REFERENCES 테이블이름(속성이름)
);
*/

create table orders(
orderid number(5),
custid number(5) not null,
bookid number(5) not null,
saleprice number(10) not null,
orderdate date,
primary key (orderid),
foreign key (custid) references customer(custid),
foreign key (bookid) references book(bookid)
);

insert into book values(1, '축구의 역사', '굿스포츠', 7000);
insert into book values(2, '축구아는 여자', '나무수', 13000);
insert into book values(3, '축구의 이해', '대한미디어', 22000);
insert into book values(4, '골프 바이블', '대한미디어', 35000);
insert into book values(5, '피겨 교본', '굿스포츠', 8000);
insert into book values(6, '역도 단계별기술', '굿스포츠', 6000);
insert into book values(7, '야구의 추억', '이상미디어', 20000);
insert into book values(8, '야구를 부탁해', '이상미디어', 13000);
insert into book values(9, '올림픽 이야기', '심성당', 7500);
insert into book values(10, 'Olympic Champions', 'Pearson', 13000);

select *
from book;

insert into customer values (1, '박지성', '영국 맨체스타', '000-5000-0001');
insert into customer values (2, '김연아', '대한민국 서울', '000-6000-0001');
insert into customer values (3, '장미란', '대한민국 강원도', '000-7000-0001');
insert into customer values (4, '추신수', '미국 클리블랜드', '000-8000-0001');
insert into customer values (5, '박세리', '대한민국 대전', 'null');

select *
from customer;

insert into orders values (1, 1, 1, 6000, to_date ('2014-07-01', 'yyyy-mm-dd'));
insert into orders values (2, 1, 3, 21000, to_date ('2014-07-03', 'yyyy-mm-dd'));
insert into orders values (3, 2, 5, 8000, to_date ('2014-07-03', 'yyyy-mm-dd'));
insert into orders values (4, 3, 6, 6000, to_date ('2014-07-04', 'yyyy-mm-dd'));
insert into orders values (5, 4, 7, 20000, to_date ('2014-07-05', 'yyyy-mm-dd'));
insert into orders values (6, 1, 2, 12000, to_date ('2014-07-07', 'yyyy-mm-dd'));
insert into orders values (7, 4, 8, 13000, to_date ('2014-07-07', 'yyyy-mm-dd'));
insert into orders values (8, 3, 10, 12000, to_date ('2014-07-08', 'yyyy-mm-dd'));
insert into orders values (9, 2, 10, 7000, to_date ('2014-07-09', 'yyyy-mm-dd'));
insert into orders values (10,3, 8, 13000, to_date ('2014-07-10', 'yyyy-mm-dd'));

insert into customer values(6, '홍길동', '대한민국 대전', null);

commit;

delete from customer where custid =6;

rollback;

select *
from orders;


------------------------------------------------SELECT구문 시작!------------------------------------------------

-- 모든 도서의 이름과 가격을 검색하시오.
select bookname, price
from book;

-- 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오.
select bookid, bookname, publisher, price
from book;

-- 도서 테이블에 있는 모든 출판사를 검색하시오.
select publisher
from book;

-- 가격이 20,000원 미만인 도서를 검색하시오.
select *
from book
where price < 20000;

-- 가격이 10,000원 이상 20,000원 이하인 도서를 검색하시오.
select *
from book
where price >= 10000 and price <= 20000;

-- 가격이 10,000원 이상 20,000원 이하인 도서를 검색하시오.(다른 표현 방식)
-- BETWEEN 사용
select *
from book
where price between 10000 and 20000;

-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오.
select *
from book
where publisher = '굿스포츠' or publisher = '대한미디어';

-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오.(다른 표현 방식)
-- IN을 사용하여 표현, IN은 여러값 중 하나와 일치하는 값, where 속성명 (값1, 값2)
select *
from book
where publisher in ('굿스포츠', '대한미디어');

-- '축구의 역사'를 출간한 출판사를 검색하시오.
select publisher
from book
where bookname = '축구의 역사';

-- '축구의 역사'를 출간한 출판사를 검색하시오. (다른 표현 방식)
-- LIKE 사용
select publisher
from book
where bookname like '축구의 역사';

-- 도서이름에 '축구'가 포함된 출판사를 검색하시오.
select publisher
from book
where bookname like '%축구%';

-- 도서이름의 왼쪽 두번째 위치에 '구'라는 문자열을 갖는 도서를 검색하시오.
select *
from book
where bookname like '_구%';

-- 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오. (***요구하는 바를 꼼꼼하게 읽고 공부가 필요한 부분***)
select *
from book
where bookname like'%축구%' and price >= 20000;

-- 도서를 이름순으로 검색하시오.
select *
from book
order by bookname;

-- 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오. (***공부가 필요한 부분***)
select *
from book
order by price, bookname;

-- 도서를 가격의 내림차순으로 검색하시오. 만약 가격이 같다면 출판사의 오름차순으로 출력하시오.
select *
from book
order by price desc, publisher asc;

-- 고객이 주문한 도서의 총 판매액을 구하시오. (***공부가 필요한 부분***)
select sum(saleprice)
from orders;

-- 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오. (***매우 부족한 부분***)
select custid, count(*) as 도서수량, sum(saleprice)
from orders
group by custid;

-- 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 단, 두 권 이상 구매한 고객만 구하시오.
select custid, count(*)
from orders
where saleprice >= 8000
group by custid
having count(*)>= 2;

-- 고객과 고객의 주문에 관한 데이터를 모두 보이시오. (이렇게 하게 되면 CROSS JOIN 결과를 초래하여 불필요한 정보까지 생긴다.)
select *
from customer, orders;

-- 고객과 고객의 주문에 관한 데이터를 모두 보이시오. (따라서 WHERE절을 이용해 EQUI JOIN을 한다.)
select *
from customer, orders
where customer.custid = orders.custid;

-- 고객과 고객의 주문에 관한 데이터를 고객번호순으로 정렬하여 보이시오.
select *
from customer, orders
where customer.custid = orders. custid
order by customer.custid;

-- 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
select name, saleprice
from customer, orders
where customer.custid = orders.custid
order by name;

-- 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오. (***공부가 필요한 부분***)
select name, sum(saleprice)
from customer, orders
where customer.custid = orders.custid -- EQUI조인
group by customer.name -- 집계함수 SUM에 위한 그룹핑
order by customer.name;

-- 고객의 이름과 고객이 주문한 도서의 이름을 구하시오.(***공부가 필요한 부분***)
select customer.name, book.bookname
from customer, book, orders
where orders.bookid = book.bookid and customer.custid = orders.custid;

-- 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
select customer.name, book.bookname
from customer, book, orders
where book.price = 20000 and orders.custid = customer.custid and orders.bookid = book.bookid;

-- 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.
select customer.name, orders.saleprice
from customer left outer join orders on customer.custid = orders.custid;

-- 가격이 가장 비싼 도서의 이름을 보이시오. (***공부가 필요한 부분***)
select bookname
from book
where price = 
         (select max(price)
              from book);

-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오.
select name
from customer
where custid = (select custid
from orders
where customer.custid != orders.custid
);
-- 대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오.
select
from
where
-- 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.
select
from
where
-- 도서를 주문하지 않은 고객의 이름을 보이시오.
select
from
where
-- 주문이 있는 고객의 이름과 주소를 보이시오.
select
from
where

------------------------------------------------SELECT구문 끄읕!------------------------------------------------


-- 제약조건이 있는 테이블 생성
create table ex (
    id number(3) primary key, -- 기본키 제약조건 (이 안에 not null이 포함되어 있고 같은게 있으면 안된다.)
    name varchar(30) unique, -- 유니크 제약조건 (이 안에 null을 허용하되 같은게 있으면 안된다.)
    salary number(7) check(salary between 300 and 1000) -- check 제약조건 (BETWEEN을 사용하여 범위 안의 값만 허용한다.)
);

insert into ex values(1, '홍길동', 300);
insert into ex values(2, '박문수', 2000);
insert into ex values(3, '성춘향', 500);

select * 
from ex;

drop table ex;


select constraint_name from user_constraints;

create table ex(
    id number(3),
    name varchar(30) constraint cname_unique unique,
    salary number(7) constraint cname_check check(salary between 300 and 1000),
    primary key(id)
);

insert into ex values(1, '홍길동', 300);
insert into ex values(2, '박문수', 2000);
insert into ex values(3, '성춘향', 500);


-- 테이블 이름 변경(RENAME 사용)
rename example to ex;

-- 테이블에 컬럼을 추가
-- ALTER TABLE 테이블이름 ADD(새로운컬럼이름 타입);
alter table ex add (dept_id number(3));
desc ex;

-- 컬럼수정(MODIFY 사용)
-- ALTER TABLE 테이블 이름 MODIFY(컬럼명 바꿀타입);
alter table ex modify(name varchar(50));

-- 컬럼삭제(DROP 사용)
-- ALTER TABLE 테이블 이름 DROP COLUMN (컬럼명);
alter table ex drop column dept_id;

-- 컬럼 이름 변경
-- ALTER TABLE 테이블 이름 RENAME COLUMN 기존컬럼명 TO 변경할컬럼명
alter table ex rename column salary to pay;
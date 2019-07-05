create table book(
    bookid number(5) not null,
    bookname varchar2(50) not null,
    publisher varchar2(30) not null,
    price number(6),
    primary key (bookid)
);
-- constraint : ��������

/*
INSERT ����
insert into ���̺� �̸�
values {������Ʈ.......};
*/

insert into book values (1, '���������', '������', 14000);
insert into book (bookid, bookname, publisher) values (2, '�����', '�Ѻ�');

select *
from book;

update book
set price  = 30000;

-- �̷��� �ۼ��ϰ� �Ǹ� ���̺� �ȿ� ��ü ���ڵ���� ������ ��
delete from book;

-- ���� ���� Ʈ������� ��� ROLLBACK���ص� ������ �������� �ʴ´�.
rollback;

select *
from book;

-- WHERE���� ����߱� ������ bookid�� 2�� ���ڵ常 ������ ��
delete from book
where bookid = 2;

-- ���̺� ���� (DROP �̿�)
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

/* �ܷ�Ű ���� create ����
create table ���̺�� (
��Ű�Ӽ���,
.......
�ܷ�Ű�Ӽ���,
.......
PRIMARY KEY(��Ű�Ӽ���)
FOREIGN KEY(�ܷ�Ű�Ӽ��� REFERENCES ���̺��̸�(�Ӽ��̸�)
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

insert into book values(1, '�౸�� ����', '�½�����', 7000);
insert into book values(2, '�౸�ƴ� ����', '������', 13000);
insert into book values(3, '�౸�� ����', '���ѹ̵��', 22000);
insert into book values(4, '���� ���̺�', '���ѹ̵��', 35000);
insert into book values(5, '�ǰ� ����', '�½�����', 8000);
insert into book values(6, '���� �ܰ躰���', '�½�����', 6000);
insert into book values(7, '�߱��� �߾�', '�̻�̵��', 20000);
insert into book values(8, '�߱��� ��Ź��', '�̻�̵��', 13000);
insert into book values(9, '�ø��� �̾߱�', '�ɼ���', 7500);
insert into book values(10, 'Olympic Champions', 'Pearson', 13000);

select *
from book;

insert into customer values (1, '������', '���� ��ü��Ÿ', '000-5000-0001');
insert into customer values (2, '�迬��', '���ѹα� ����', '000-6000-0001');
insert into customer values (3, '��̶�', '���ѹα� ������', '000-7000-0001');
insert into customer values (4, '�߽ż�', '�̱� Ŭ������', '000-8000-0001');
insert into customer values (5, '�ڼ���', '���ѹα� ����', 'null');

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

insert into customer values(6, 'ȫ�浿', '���ѹα� ����', null);

commit;

delete from customer where custid =6;

rollback;

select *
from orders;


------------------------------------------------SELECT���� ����!------------------------------------------------

-- ��� ������ �̸��� ������ �˻��Ͻÿ�.
select bookname, price
from book;

-- ��� ������ ������ȣ, �����̸�, ���ǻ�, ������ �˻��Ͻÿ�.
select bookid, bookname, publisher, price
from book;

-- ���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�.
select publisher
from book;

-- ������ 20,000�� �̸��� ������ �˻��Ͻÿ�.
select *
from book
where price < 20000;

-- ������ 10,000�� �̻� 20,000�� ������ ������ �˻��Ͻÿ�.
select *
from book
where price >= 10000 and price <= 20000;

-- ������ 10,000�� �̻� 20,000�� ������ ������ �˻��Ͻÿ�.(�ٸ� ǥ�� ���)
-- BETWEEN ���
select *
from book
where price between 10000 and 20000;

-- ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ�.
select *
from book
where publisher = '�½�����' or publisher = '���ѹ̵��';

-- ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ�.(�ٸ� ǥ�� ���)
-- IN�� ����Ͽ� ǥ��, IN�� ������ �� �ϳ��� ��ġ�ϴ� ��, where �Ӽ��� (��1, ��2)
select *
from book
where publisher in ('�½�����', '���ѹ̵��');

-- '�౸�� ����'�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�.
select publisher
from book
where bookname = '�౸�� ����';

-- '�౸�� ����'�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�. (�ٸ� ǥ�� ���)
-- LIKE ���
select publisher
from book
where bookname like '�౸�� ����';

-- �����̸��� '�౸'�� ���Ե� ���ǻ縦 �˻��Ͻÿ�.
select publisher
from book
where bookname like '%�౸%';

-- �����̸��� ���� �ι�° ��ġ�� '��'��� ���ڿ��� ���� ������ �˻��Ͻÿ�.
select *
from book
where bookname like '_��%';

-- �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��Ͻÿ�. (***�䱸�ϴ� �ٸ� �Ĳ��ϰ� �а� ���ΰ� �ʿ��� �κ�***)
select *
from book
where bookname like'%�౸%' and price >= 20000;

-- ������ �̸������� �˻��Ͻÿ�.
select *
from book
order by bookname;

-- ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��Ͻÿ�. (***���ΰ� �ʿ��� �κ�***)
select *
from book
order by price, bookname;

-- ������ ������ ������������ �˻��Ͻÿ�. ���� ������ ���ٸ� ���ǻ��� ������������ ����Ͻÿ�.
select *
from book
order by price desc, publisher asc;

-- ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�. (***���ΰ� �ʿ��� �κ�***)
select sum(saleprice)
from orders;

-- ������ �ֹ��� ������ �� ������ �� �Ǹž��� ���Ͻÿ�. (***�ſ� ������ �κ�***)
select custid, count(*) as ��������, sum(saleprice)
from orders
group by custid;

-- ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�. ��, �� �� �̻� ������ ���� ���Ͻÿ�.
select custid, count(*)
from orders
where saleprice >= 8000
group by custid
having count(*)>= 2;

-- ���� ���� �ֹ��� ���� �����͸� ��� ���̽ÿ�. (�̷��� �ϰ� �Ǹ� CROSS JOIN ����� �ʷ��Ͽ� ���ʿ��� �������� �����.)
select *
from customer, orders;

-- ���� ���� �ֹ��� ���� �����͸� ��� ���̽ÿ�. (���� WHERE���� �̿��� EQUI JOIN�� �Ѵ�.)
select *
from customer, orders
where customer.custid = orders.custid;

-- ���� ���� �ֹ��� ���� �����͸� ����ȣ������ �����Ͽ� ���̽ÿ�.
select *
from customer, orders
where customer.custid = orders. custid
order by customer.custid;

-- ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
select name, saleprice
from customer, orders
where customer.custid = orders.custid
order by name;

-- ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�. (***���ΰ� �ʿ��� �κ�***)
select name, sum(saleprice)
from customer, orders
where customer.custid = orders.custid -- EQUI����
group by customer.name -- �����Լ� SUM�� ���� �׷���
order by customer.name;

-- ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�.(***���ΰ� �ʿ��� �κ�***)
select customer.name, book.bookname
from customer, book, orders
where orders.bookid = book.bookid and customer.custid = orders.custid;

-- ������ 20,000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�.
select customer.name, book.bookname
from customer, book, orders
where book.price = 20000 and orders.custid = customer.custid and orders.bookid = book.bookid;

-- ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�.
select customer.name, orders.saleprice
from customer left outer join orders on customer.custid = orders.custid;

-- ������ ���� ��� ������ �̸��� ���̽ÿ�. (***���ΰ� �ʿ��� �κ�***)
select bookname
from book
where price = 
         (select max(price)
              from book);

-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
select name
from customer
where custid = (select custid
from orders
where customer.custid != orders.custid
);
-- ���ѹ̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�.
select
from
where
-- ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�.
select
from
where
-- ������ �ֹ����� ���� ���� �̸��� ���̽ÿ�.
select
from
where
-- �ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�.
select
from
where

------------------------------------------------SELECT���� ����!------------------------------------------------


-- ���������� �ִ� ���̺� ����
create table ex (
    id number(3) primary key, -- �⺻Ű �������� (�� �ȿ� not null�� ���ԵǾ� �ְ� ������ ������ �ȵȴ�.)
    name varchar(30) unique, -- ����ũ �������� (�� �ȿ� null�� ����ϵ� ������ ������ �ȵȴ�.)
    salary number(7) check(salary between 300 and 1000) -- check �������� (BETWEEN�� ����Ͽ� ���� ���� ���� ����Ѵ�.)
);

insert into ex values(1, 'ȫ�浿', 300);
insert into ex values(2, '�ڹ���', 2000);
insert into ex values(3, '������', 500);

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

insert into ex values(1, 'ȫ�浿', 300);
insert into ex values(2, '�ڹ���', 2000);
insert into ex values(3, '������', 500);


-- ���̺� �̸� ����(RENAME ���)
rename example to ex;

-- ���̺� �÷��� �߰�
-- ALTER TABLE ���̺��̸� ADD(���ο��÷��̸� Ÿ��);
alter table ex add (dept_id number(3));
desc ex;

-- �÷�����(MODIFY ���)
-- ALTER TABLE ���̺� �̸� MODIFY(�÷��� �ٲ�Ÿ��);
alter table ex modify(name varchar(50));

-- �÷�����(DROP ���)
-- ALTER TABLE ���̺� �̸� DROP COLUMN (�÷���);
alter table ex drop column dept_id;

-- �÷� �̸� ����
-- ALTER TABLE ���̺� �̸� RENAME COLUMN �����÷��� TO �������÷���
alter table ex rename column salary to pay;
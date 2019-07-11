-- -78�� +78�� ������ ���Ͻÿ�.
select abs(-78), abs(+78)
from dual;

-- 4.875�� �Ҽ� ù° �ڸ����� �ݿø��� ���� ���Ͻÿ�.
select round(4.875, 1)
from dual;

-- ���� ��� �ֹ� �ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�.
select custid "����ȣ", round(sum(saleprice)/count(*), -2) "��ձݾ�"
from orders
group by custid;

-- �������� �߱��� ���Ե� ������ �󱸷� ������ �� ���� ����� ���̽ÿ�.
select bookname, replace(bookname, '�߱�', '��')
from book;

-- �½��������� ������ ������ ����� ������ ���� ��, ����Ʈ ���� ���̽ÿ�.
select bookname, length(bookname), lengthb(bookname)
from book
where publisher = '�½�����';

-- ���缭���� �� �߿��� ���� ��(��)�� ���� ����� �� ���̳� �Ǵ��� ���� �ο� ���� ���Ͻÿ�.
select substr(name, 1, 1) "��", count(*) "�ο�"
from customer
group by substr(name, 1, 1);

-- ���缭���� �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�.
select orderdate "�ֹ�����", to_date(orderdate, 'yyyy-mm-dd')+10 "�ֹ�Ȯ������"
from orders;

-- ���缭���� �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�. (�ٸ� ǥ�� ���)
select orderdate "�ֹ�����" , orderdate+10 "�ֹ�Ȯ������"
from orders;


-- ���缭���� 2014�� 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ���̽ÿ�. �� �ֹ����� 'yyyy-mm-dd ����' ���·� ǥ���Ѵ�.
select orderid, to_char(orderdate, 'yyyy-mm-dd day'), custid, bookid
from orders
where orderdate = to_date('20140707', 'yyyy-mm-dd');

-- ���缭���� 2014�� 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ���̽ÿ�. �� �ֹ����� 'yyyy-mm-dd ����' ���·� ǥ���Ѵ�.(�ٸ� ǥ�� ���)
select orderid, to_char(orderdate, 'yyyy-mm-dd day'), custid, bookid
from orders
where orderdate = '2014-07-07';   --(�̷��� ���� ���� ����)

-- DBMS ������ ������ ���� ��¥�� �ð�, ������ Ȯ���Ͻÿ�.
select sysdate, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') "sysdate_1"
from dual;

-- �̸�, ��ȭ��ȣ�� ���Ե� ������� ���̽ÿ�. ��, ��ȭ��ȣ�� ���� ���� '����ó����'���� ǥ���Ͻÿ�.
select name,nvl(phone, '����ó����')
from customer;

-- �� ��Ͽ��� ����ȣ, �̸�, ��ȭ��ȣ�� ���� �� �� ���̽ÿ�.
select rownum "����", custid, name, phone
from customer
where rownum <= 2;

-- ���缭���� ���� �Ǹž��� ���̽ÿ�(���̸��� ���� �Ǹž� ���).
select (select name
        from customer cs
        where cs.custid = od.custid) "name", sum(saleprice) "total"
from orders od
group by od.custid;

-- Orders ���̺� �� �ֹ��� �´� �����̸��� �Է��Ͻÿ�.
alter table orders add bookname varchar2(40);

update orders
set bookname = (select bookname
                from book
                where book.bookid = orders.bookid);

-- ����ȣ�� 2 ������ ���� �Ǹž��� ���̽ÿ�.(���̸��� ���� �Ǹž� ���).


-- ��� �ֹ��ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.


-- �� ���� ��� �ֹ��ݾ׺��� ū �ݾ��� �ֹ� ������ ���ؼ� �ֹ���ȣ, ����ȣ, �ݾ��� ���̽ÿ�.


-- ���ѹα��� �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.


-- 3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.


-- EXISTS �����ڸ� ����Ͽ� ���ѹα��� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���Ͻÿ�.


/* --------��(VIEW)--------
��� �ϳ� �̻��� ���̺��� ���Ͽ� ���� ������ ���̺�.

--------��(VIEW)�� ����--------
�ܼ���(Simple View) - ����� ���������� ���� ���Ǿ��� 1���� ���̺�κ��� ��������� ��
���պ�(Complex View) - ����� ���������� �������� ���̺��� ���εǾ� �����Ǵ� ��
�ζ��κ�(Inline View) - �ش� ���ǿ����� �ʿ��� ���� ��� FROM���� ���������� �ٷ� ��� ����ϴ� �� (���̺��� ��������� �ʴ� ��)

--------��(VIEW)�� ����--------
CREATE [OR REPLACE ] VIEW �����   ///////[REPLACE] ------- �� �̸��� ���� ��� REPLACE�� �̿��� �̸��� �ٲ��ְڴ�.��� ���� ����
AS 
    SELECT [�� ���̺��� ������ �� �Ӽ���]
    [WITH READ ONLY]
*/
    
--------�� ���� ����--------
-- �� ���̺� ����
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
where address like '%����%';

select *
from vw_customer;

create or replace view highorders
as select b.bookid, b.bookname, c.name, b.publisher, o.saleprice
from orders o, customer c, book b
where o.bookid = b.bookid and o.custid = c.custid and saleprice >= 20000;

select *
from highorders;

/*
--------INDEX(�ε���)�� ����--------
CREATE [REVERSE] [UNIQUE] INDEX [�ε����̸�]
ON ���̺��̸� (�÷� [ASC/DESC] [{, �÷� [ASC/DESC]} ...])[;]
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

-- �ε����� ���¸� ��ȸ�ϴ� ��� (�˾Ƶα�)
-- ANALYZE INDEX [�ε��� �̸�] VALIDATE STRUCTURE;
ANALYZE index idx_test_no validate structure;
select (del_lf_rows_len / lf_rows_len) *100 balance
from index_stats
where name='IDX_TEST_NO';

-- ���ڵ� ����
delete from test
where no between 2500 and 6500;

-- �ε����� ������
alter index idx_test_no rebuild;

ANALYZE index idx_test_no validate structure;

select (del_lf_rows_len / lf_rows_len) *100 balance
from index_stats
where name='IDX_TEST_NO';
create table Summer
( sid number,
  class varchar(20),
  price number
);

insert into Summer values (100, 'FORTRAN', 20000);
insert into Summer values (150, 'PASCAL', 15000);
insert into Summer values (200, 'C', 10000);
insert into Summer values (250, 'FORTRAN', 20000);


select * from Summer;

select price "C 수강료"
from Summer
where class = 'C';

delete from Summer
where sid = 200;

-- 내가 작성한 것
delete from Summer
where price = 25000;

select price "C 수강료"
from Summer
where class = 'C';

insert into Summer values (null, 'JAVA', 25000);

select *
from Summer;

select count(*) "수강인원"
from Summer;

select count(sid) "수강인원"
from Summer;

select count(*) "수강인원"
from Summer
where sid is not null;


update Summer
set price = 15000
where class = 'FORTRAN';

select *
from Summer;

select distinct price "FORTRAN 수강료"
from Summer
where class='FORTRAN';

update Summer
set price=20000
where class='FORTRAN';

UPDATE Summer
set price = 15000
where class='FORTRAN' AND sid=100;

select * from Summer;

select price "FORTRAN 수강료"
from Summer
where class = 'FORTRAN';

update Summer
set price=20000
where class='FORTRAN';

delete from Summer
where sid is null;

create table summerprice
( class varchar(20),
  price number
  );
  
  insert into summerprice values ('FORTRAN', 20000);
  insert into summerprice values ('PASCAL', 15000);
  insert into summerprice values ('C', 10000);
  
  select *
  from summerprice;
  
  create table summerenroll
  (sid number,
  class varchar(20)
  );
  
  insert into summerenroll values(100, 'FORTRAN');
  insert into summerenroll values(150, 'PASCAL');
  insert into summerenroll values(200, 'C');
  insert into summerenroll values(250, 'FORTRAN');
  
  select * from summerenroll;
  
select price "C 수강료"
from Summerprice
where class = 'C';

delete from summerenroll
where sid = 200;
  
select price "C 수강료"
from Summerprice
where class = 'C';

insert into summerprice values ('JAVA', 25000);

select * from summerprice;

select * from summerenroll;

update summerprice
set price = 15000
where class = 'FORTRAN';

select price "FORTRAN 수강료"
from summerprice
where class = 'FORTRAN';


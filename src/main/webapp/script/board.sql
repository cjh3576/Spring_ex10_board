select * from
(select rownum R, MEM.* from
(select M.* , F.num, F.fname, F.oname
from MEMBER M Full join MemberFile F
on (M.id = F.id) 
where grade != 0 
order by M.id asc) MEM)
where R between 1 and 10


commit
select M.*, F.*
from member M inner join MEMBERFILE F
on (M.id=F.id)
where M.id='t1' and M.pw='t1'

select M.id, M.name, F.fname as memberFileDTO.fname
from member M inner join MEMBERFILE F
on (M.id=F.id)
where M.id='t1' and M.pw='t1'

select N.*, F.*
from notice N inner join files F
on (N.num=F.num)
where N.num=27



select * from member
select * from notice order by num desc
select * from FILES order by fnum desc

select max(fnum)+1 from files

delete FILES where num=1

create table memberfile(
	num number(8) constraint memberfile_num_pk primary key,
	id  varchar2(400), 
	fname varchar2(2000),
	oname varchar2(2000)
)


create table member(
	id varchar2(400) constraint member_id_pk primary key,
	pw varchar2(400),
	name varchar2(400),
	email varchar2(400),
	grade number(1)
)



create table files(
	fnum number(8) constraint files_fnum_pk primary key,
	num number(8) not null,
	fname varchar2(2000),
	oname varchar2(2000)
)

create table notice(
	num number(8),
	title varchar2(400),
	writer varchar2(400),
	contents clob,
	reg_date date,
	hit number(8),
	constraint notice_num_pk primary key (num)
)

create sequence notice_seq
start with 1
increment by 1
nomaxvalue
nocycle
nocache



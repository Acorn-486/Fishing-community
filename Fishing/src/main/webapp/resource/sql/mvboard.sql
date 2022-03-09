drop table mvboard;

create table mvboard(
	mvboardID int primary key,
	mvboardTitle varchar(50),
	mvboardDate datetime,
	mvboardContent varchar(4000),
	mvboardCnt int
);

select * from mvboard;

commit;
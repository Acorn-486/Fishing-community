drop table board;

create table board(
	boardID int primary key,
	boardTitle varchar(50),
	userID varchar(20),
	boardDate datetime,
	boardContent varchar(4000),
	boardCnt int,
	boardNotice int
);

select * from board;

commit;
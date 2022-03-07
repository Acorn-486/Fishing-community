drop table comment;

create table comment(
	boardID int primary key,
	commentID int primary key,
	userID varchar(20),
	commentDate datetime,
	commentContent varchar(100)
);

select * from comment;

commit;
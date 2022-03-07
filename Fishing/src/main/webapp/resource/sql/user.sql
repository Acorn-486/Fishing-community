drop table user;

create table user(
	userID varchar(20) primary key,
	userPassword varchar(20),
	userName varchar(20),
	userGender varchar(20),
	userEmail varchar(50),
	userBirth varchar(20),
	userPhone varchar(20),
	userDetail varchar(30),
	userAddress varchar(50),
	userZipCode varchar(20)
);

select * from user;

commit;
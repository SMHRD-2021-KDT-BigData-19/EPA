create table TEST(
	idx int not null auto_increment,
	title varchar(1000) not null,
	content varchar(3000) not null,
	writer varchar(1000) not null,
	indate datetime not null default now(),
	count int not null default 0,
	primary key(idx)
);

Select * from TEST
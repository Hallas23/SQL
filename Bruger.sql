drop table bruger;

create table bruger (
userid int not null,
username varchar(50) primary key,
iterations int not null,
salt binary(16) not null,
Hashpassword binary(16) not null
);



	SELECT username, iterations, salt, Hashpassword
	FROM bruger
	where username = 'Ole';
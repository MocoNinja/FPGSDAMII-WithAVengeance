create table IF NOT EXISTS USER(
	dni varchar(25) PRIMARY KEY,
	nombre varchar(25),
	apellido varchar(25)
);

insert into USER values ('aaa1', 'pepe', 'pepito');
insert into USER values ('bbb2', 'pepa', 'pepita');
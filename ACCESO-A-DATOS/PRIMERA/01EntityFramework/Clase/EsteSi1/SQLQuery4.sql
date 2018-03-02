Create table Clases(
	ID int primary key identity,
	curso nvarchar(2),
);

Create table Alumnos(
	ID int primary key identity,
	nombre nvarchar(50),
	Apellidos nvarchar(50),
	Genero nvarchar(50),
	edad int,
	claseID int foreign key references Clases(ID)
);


Insert into Clases values ('1H');
Insert into Clases values ('2H');
Insert into Clases values ('1E');
Insert into Clases values ('2E');
Insert into Alumnos values ('Pepe', 'Pepazo', 'Hombre', 10, 1);
Insert into Alumnos values ('Pepa', 'Pepazo', 'Mujer', 10, 1);
Insert into Alumnos values ('Maro', 'Pepazo', 'Hombre', 12, 2);
Insert into Alumnos values ('Mara', 'Pepazo', 'Mujer', 12, 2);
Insert into Alumnos values ('Guas', 'Pepazo', 'Hombre', 13, 3);
Insert into Alumnos values ('Guuasa', 'Pepazo', 'Mujer', 13, 3);
Insert into Alumnos values ('Guaso', 'Pepazo', 'Hombre', 18, 4);
Insert into Alumnos values ('Federica', 'Pepazo', 'Mujer', 19, 4);
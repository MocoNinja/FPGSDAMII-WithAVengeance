/*
CONSULTAS SQL PARA EL PROYECTO DE DESARROLLO DE UN GRIDVIEW CON CAPACIDAD DE INSERCIÓN, BORRADO Y MODIFICACIÓN DE UNA DB MEDIANTE PROCEDIMIENTOS
*/
Create PROCEDURE InsertarAlumno
    @Nombre NVARCHAR(50),
    @Apellidos NVARCHAR(50),
    @Genero NVARCHAR(50),
    @Edad int
AS
BEGIN
    INSERT INTO tblAlumnos
        (Nombre_Propio, Apellidos, Genero, Edad)
    VALUES
        ("Pedro", "Iglesias", "Masculino", 25)
END


CREATE PROCEDURE ModificarAlumno
    @ID int,
    @Nombre NVARCHAR(50),
    @Apellidos NVARCHAR(50),
    @Genero NVARCHAR(50),
    @Edad int
AS
BEGIN
    UPDATE tblAlumnos SET Nombre_Propio = @Nombre, Apellidos = @Apellidos, Genero = @Genero, Edad = @Edad WHERE ID = @ID;
END



CREATE PROCEDURE BorrarAlumno
    @ID int,
AS
BEGIN
    DELETE FROM tblAlumnos WHERE ID = @ID;
END
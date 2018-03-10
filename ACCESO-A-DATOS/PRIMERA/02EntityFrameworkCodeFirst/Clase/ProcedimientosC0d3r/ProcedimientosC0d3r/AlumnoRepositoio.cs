using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace ProcedimientosC0d3r
{
    public class AlumnoRepositoio
    {
        AlumnoDBContext bbdd = new AlumnoDBContext();

        public List<Alumno> GetAlumnos()
        {
            // ~ BBDD / Tabla / -> a lista
            return bbdd.Alumnos.ToList();
        }

        // Vamos a crear con código los procedimientos

        public void InsertarAlumno(Alumno alumno)
        {
            bbdd.Alumnos.Add(alumno);
            bbdd.SaveChanges(); // La base de datos no cambia realmente hasta que se guarden los cambios
        }

        public void ActualizarAlumno(Alumno alumno)
        {
            // bbdd.Alumnos: objeto tabla : tiene todos los alumnos en un monton de registros
            // El registro tiene sus campos; tenemos que mirar si alguno de esos es el alumno que le pasamos
            // Queremos encontrar el registro del alumno que le pasamos para actualizarlo con la modificacion
            // Hay que buscarlo, pero no vamos a hacer un select, usamos la siguiente funcion

            Alumno alumnoActualizar = bbdd.Alumnos.FirstOrDefault(tabla => tabla.AlumnoID == alumno.AlumnoID);

            // donde tabla es una referencia a la propia tabla; se busca en la tabla la id igual a la del alumno
            // cuando se encuentra la unica (o primera si estuviera reptido por cualquier razon) se devuelve el alumno
            // 'tabla' es el propio objeto. Se puede llamar como quieras
            alumnoActualizar.Nombre = alumno.Nombre;
            alumnoActualizar.Apellidos = alumno.Apellidos;
            alumnoActualizar.Genero = alumno.Genero;
            alumnoActualizar.Edad = alumno.Edad;
            bbdd.SaveChanges();
            /**
             * TODO
             * PROBAR SI FUNCIONA alumnoActualizar = alumno;
            */
        }

        public void BorrarAlumno(Alumno alumno)
        {
            Alumno alumnoMatar = bbdd.Alumnos.FirstOrDefault(tabla => tabla.AlumnoID == alumno.AlumnoID);
            bbdd.Alumnos.Remove(alumnoMatar);
            bbdd.SaveChanges();
        }
    }
}
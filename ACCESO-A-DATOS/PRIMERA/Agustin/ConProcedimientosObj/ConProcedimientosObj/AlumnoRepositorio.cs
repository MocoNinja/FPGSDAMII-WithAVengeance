using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConProcedimientosObj
{
    public class AlumnoRepositorio
    {
        AlumnoDBContext alumnoDBContext = new AlumnoDBContext();
    
        public List<Alumno> GetAlumnos()
        {
            return alumnoDBContext.Alumnos.ToList();
        }

        public void InsertarAlumno(Alumno alumno)
        {
            alumnoDBContext.Alumnos.Add(alumno);
            alumnoDBContext.SaveChanges();
        }

        public void ActualizarAlumno(Alumno alumno)
        {
            Alumno alumnoToActualizar = alumnoDBContext.Alumnos.FirstOrDefault(x => x.ID == alumno.ID);
            alumnoToActualizar.Nombre = alumno.Nombre;
            alumnoToActualizar.Apellidos = alumno.Apellidos;
            alumnoToActualizar.Genero = alumno.Genero;
            alumnoToActualizar.Edad = alumno.Edad;
            alumnoDBContext.SaveChanges();
        }

        public void EliminarAlumno(Alumno alumno)
        {
            Alumno alumnoToEliminar = alumnoDBContext.Alumnos.FirstOrDefault(x => x.ID == alumno.ID);
            alumnoDBContext.Alumnos.Remove(alumnoToEliminar);
            alumnoDBContext.SaveChanges();
        }
    }
}
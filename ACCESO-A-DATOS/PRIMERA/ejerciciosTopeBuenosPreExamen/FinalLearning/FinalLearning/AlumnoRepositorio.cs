using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalLearning
{
    public class AlumnoRepositorio
    {
        BaseDatos BD = new BaseDatos();

        public List<Alumno> SelectAlumnos()
        {
            return BD.TablaAlumnos.ToList();
        }

        public void InsertAlumno(Alumno Alumno)
        {
            BD.TablaAlumnos.Add(Alumno);
            BD.SaveChanges();
        }

        public void DeleteAlumno(Alumno AlumnoInput)
        {
            Alumno Target = BD.TablaAlumnos.FirstOrDefault(p => p.Id == AlumnoInput.Id);
            BD.TablaAlumnos.Remove(Target);
            BD.SaveChanges();
        }

        public void UpdateAlumno(Alumno AlumnoInput)
        {
            Alumno Target = BD.TablaAlumnos.FirstOrDefault(p => p.Id == AlumnoInput.Id);
            Target.Nombre = AlumnoInput.Nombre;
            Target.Apellidos = AlumnoInput.Apellidos;
            Target.IdPais = AlumnoInput.IdPais;
            BD.SaveChanges();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalLearning
{
    public class MatriculasRepositorio
    {
        BaseDatos BD = new BaseDatos();

        public List<Matriculas> SelectMatriculas()
        {
            return BD.TablaMatriculas.ToList();
        }

        public void InsertMatricula(Matriculas Matricula)
        {
            BD.TablaMatriculas.Add(Matricula);
            BD.SaveChanges();
        }

        public void DeleteMatricula(Matriculas MatriculaInput)
        {
            Matriculas Target = BD.TablaMatriculas.FirstOrDefault(p => p.IdAlumno == MatriculaInput.IdAlumno && p.IdClase == MatriculaInput.IdClase);
            BD.TablaMatriculas.Remove(Target);
            BD.SaveChanges();
        }

        public void UpdateMatricula(Matriculas MatriculaInput)
        {
            Matriculas Target = BD.TablaMatriculas.FirstOrDefault(p => p.IdAlumno == MatriculaInput.IdAlumno && p.IdClase == MatriculaInput.IdClase);
            Target.IdAlumno = MatriculaInput.IdAlumno;
            Target.IdClase = MatriculaInput.IdClase;
            Target.Calificacion = MatriculaInput.Calificacion;
            BD.SaveChanges();
        }

        public List<Matriculas> GetMatriculasFromClase(string IdClaseInput)
        {
            int IdClase = int.Parse(IdClaseInput);
            List<Matriculas> Matriculas = null;
            Matriculas = (
                from M in BD.TablaMatriculas
                where M.IdClase == IdClase
                select M
                ).ToList();
            return Matriculas;
        }
    }
}
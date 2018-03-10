using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalLearning
{
    public class PaisRepositorio
    {
        BaseDatos BD = new BaseDatos();

        public List<Pais> SelectPaises()
        {
            return BD.TablaPaises.ToList();
        }

        public void InsertPais(Pais Pais)
        {
            BD.TablaPaises.Add(Pais);
            BD.SaveChanges();
        }

        public void DeletePais(Pais PaisInput)
        {
            Pais Target = BD.TablaPaises.FirstOrDefault(p => p.Id == PaisInput.Id);
            BD.TablaPaises.Remove(Target);
            BD.SaveChanges();
        }

        public void UpdatePais(Pais PaisInput)
        {
            Pais Target = BD.TablaPaises.FirstOrDefault(p => p.Id == PaisInput.Id);
            Target.Nombre = PaisInput.Nombre;
            BD.SaveChanges();
        }

        public List<Alumno> GetAlumnosFromPais(string IdPaisLeida)
        {
            List<Alumno> Alumnos = null;
            int IdPais = int.Parse(IdPaisLeida);
            // Forma 1: Accediendo a la tabla
            Alumnos = BD.TablaPaises.Include("Alumnos").FirstOrDefault(p => p.Id == IdPais).Alumnos;
            return Alumnos;
        }
    }
}
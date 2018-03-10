using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _01ComoEnElExamen
{
    public class AlumnoRepositorio
    {
        public List<Clase> GetClases()
        {
            AlumnoDBContext bbdd = new AlumnoDBContext();
            // return bbdd.Clases.ToList();
            return bbdd.Clases.Include("Alumnos").ToList();
        }
    }
}
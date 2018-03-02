using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EsteSi3
{
    public class AlumnoRepositorio
    {
        public List<Clase> GetClases()
        {
            AlumnoDBContext alumnoDBContext = new AlumnoDBContext();
            return alumnoDBContext.Clases.Include("Alumnos").ToList();
        }

    }
}
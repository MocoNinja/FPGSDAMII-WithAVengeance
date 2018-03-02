using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;


namespace EsteSi3
{
    public class AlumnoDBContext : DbContext
    {
        public DbSet<Clase> Clases { get; set; }
        public DbSet<Alumno> Alumnos { get; set; }
    }
}
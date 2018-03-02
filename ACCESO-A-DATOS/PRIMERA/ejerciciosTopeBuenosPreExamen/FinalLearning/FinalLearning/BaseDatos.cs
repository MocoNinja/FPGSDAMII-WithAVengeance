using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace FinalLearning
{
    public class BaseDatos : DbContext
    {
        public DbSet<Alumno> TablaAlumnos { get; set; }
        public DbSet<Clase> TablaClases { get; set; }
        public DbSet<Pais> TablaPaises { get; set; }
        public DbSet<Matriculas> TablaMatriculas { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace ProcedimientosC0d3r
{
    // Hay que instalar el entity framework con el nu get (el 6 por lo de abajo)
    public class AlumnoDBContext : DbContext  // Va a ser el objeto de la base de datos
    {
        public DbSet<Alumno> Alumnos { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Alumno>().MapToStoredProcedures(); // tiene que ser de la 6!
            base.OnModelCreating(modelBuilder);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace _01ComoEnElExamen
{
    public class AlumnoDBContext : DbContext
    {
        // DbContext ~> objeto BBDD
        // DbSet ~> objeto Tabla

        public DbSet<Clase> Clases { get; set; } // Es decir, cada elemento del dbset sera de la clase clase
        public DbSet<Alumno> Alumnos { get; set; }

        // Clase repositorio ~> metemos métodos (consultas de seleccion) que podemos acceder cuando queramos
        
    }
}
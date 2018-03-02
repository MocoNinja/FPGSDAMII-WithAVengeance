using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace MisDiasDeCine
{
    public class BaseDatos : DbContext
    {
        public DbSet<Pelicula> TablaPeliculas { get; set; }
        public DbSet<Pais> TablaPaises { get; set; }
        public DbSet<Actor> TablaActores { get; set; }
        // Tabla que surge de la relacion N:N actor/pelicula
        public DbSet<Actuaciones> TablaActuaciones { get; set; }
    }
}
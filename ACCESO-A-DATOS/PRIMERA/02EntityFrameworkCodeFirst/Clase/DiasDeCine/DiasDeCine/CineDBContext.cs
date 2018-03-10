using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace DiasDeCine
{
    public class CineDBContext : DbContext
    {
        public DbSet<Pais> Paises { get; set; }
        public DbSet<Actor> Actores { get; set; }

    }
}
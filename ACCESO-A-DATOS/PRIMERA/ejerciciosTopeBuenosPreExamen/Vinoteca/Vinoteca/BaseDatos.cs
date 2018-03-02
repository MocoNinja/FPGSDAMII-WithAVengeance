using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Vinoteca
{
    public class BaseDatos : DbContext
    {
        public DbSet<Vino> Vinos { get; set; }
        public DbSet<Bodega> Bodegas { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace ExamenJGT
{
    public class BaseDatos : DbContext
    {
        public DbSet<Medida> TablaMedidas { get; set; }
        public DbSet<Receta> TablaRecetas { get; set; }
        public DbSet<Producto> TablaProductos { get; set; }
        public DbSet<Receta_Productos> TablaReceta_Productos { get; set; }
    }
}
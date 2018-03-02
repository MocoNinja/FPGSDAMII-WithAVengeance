using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Vinoteca
{
    public class BaseDatos : DbContext
    {
        public DbSet<Vino> TablaVinos { get; set; }
        public DbSet<Bodega> TablaBodegas { get; set; }
        public DbSet<Cliente> TablaClientes { get; set; }
        public DbSet<Compra> TablaCompras { get; set; }
        public DbSet<DetallesCompra> TablaDetallesCompras { get; set; }
    }
}
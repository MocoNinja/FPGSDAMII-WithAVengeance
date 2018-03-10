using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace ExamenJGT.Models
{
    public class Contexto : DbContext
    {
        public DbSet<ClasePrueba> TablaPrueba { get; set; }
        public DbSet<ClasePrueba2> TablaPrueba2 { get; set; }
        public DbSet<Cliente> Clientes { get; set; }
        public DbSet<Producto> Productos { get; set; }
        public DbSet<Pedido> Pedidos { get; set; }
        public DbSet<Detalle> Detalles { get; set; }
        public DbSet<ProductosDetalle> ProductosDetalles {get; set;}
    }
}
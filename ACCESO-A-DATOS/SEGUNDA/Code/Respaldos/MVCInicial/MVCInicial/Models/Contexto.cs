using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace MVCInicial.Models
{
    public class Contexto : DbContext
    {
        public DbSet<Marca> Marcas { get; set; }
        public DbSet<Serie> Series { get; set; }
        public DbSet<Vehiculo> Vehiculos { get; set; }
        public DbSet<VehiculosExtras> VehiculosExtras { get; set; }
        public DbSet<Extra> Extras { get; set; }
        public DbSet<Provincia> Provincias { get; set; }
        public DbSet<Cliente> Clientes { get; set; }
    }
}
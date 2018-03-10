using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace VistaControlador1.Models
{
    public class ContextModel: DbContext
    {
        public DbSet<MarcaModelo> Marcas { get; set; }
        public DbSet<SerieModelo> SerieM { get; set; }
        public DbSet<Automovil> Automoviles  { get; set; }
        public DbSet<ExtraModelo> Extra { get; set; }
        public DbSet<AutomovilesExtrasModelo> AutomovilesExtra { get; set; }
        public DbSet<Clientes> Clientes { get; set; }
        public DbSet<Provincia> Provincias { get; set; }
    }
}
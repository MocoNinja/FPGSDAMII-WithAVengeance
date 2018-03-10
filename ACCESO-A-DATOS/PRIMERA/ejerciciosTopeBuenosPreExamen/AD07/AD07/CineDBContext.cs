using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace AD07
{
	public class CineDBContext : DbContext
	{
		public DbSet<Actor> Actores { get; set; }
		public DbSet<Pais> Paises { get; set; }
		public DbSet<Pelicula> Peliculas { get; set; }
		public DbSet<PeliculaActor> PeliculasActores { get; set; }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
			modelBuilder.Entity<Actor>().MapToStoredProcedures();
			modelBuilder.Entity<Pais>().MapToStoredProcedures();
			modelBuilder.Entity<Pelicula>().MapToStoredProcedures();
			modelBuilder.Entity<PeliculaActor>().MapToStoredProcedures();
			base.OnModelCreating(modelBuilder);
		}
	}
}
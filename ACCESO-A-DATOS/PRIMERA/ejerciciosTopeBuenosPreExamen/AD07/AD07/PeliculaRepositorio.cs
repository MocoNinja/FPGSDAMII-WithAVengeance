using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AD07
{
	public class PeliculaRepositorio
	{
		CineDBContext peliculaDBContext = new CineDBContext();

		public List<Pelicula> GetPeliculas()
		{
			return peliculaDBContext.Peliculas.ToList();
		}

		public void InsertarPelicula(Pelicula pelicula)
		{
			peliculaDBContext.Peliculas.Add(pelicula);
			peliculaDBContext.SaveChanges();
		}

		public void ActualizarPelicula(Pelicula pelicula)
		{
			Pelicula peliculaToActualizar = peliculaDBContext.Peliculas.FirstOrDefault(x => x.ID == pelicula.ID);
			peliculaToActualizar.Titulo = pelicula.Titulo;
			peliculaToActualizar.Cartel = pelicula.Cartel;
			peliculaDBContext.SaveChanges();
		}

		public void EliminarPelicula(Pelicula pelicula)
		{
			Pelicula peliculaToEliminar = peliculaDBContext.Peliculas.FirstOrDefault(x => x.ID == pelicula.ID);
			peliculaDBContext.Peliculas.Remove(peliculaToEliminar);
			peliculaDBContext.SaveChanges();
		}
	}
}
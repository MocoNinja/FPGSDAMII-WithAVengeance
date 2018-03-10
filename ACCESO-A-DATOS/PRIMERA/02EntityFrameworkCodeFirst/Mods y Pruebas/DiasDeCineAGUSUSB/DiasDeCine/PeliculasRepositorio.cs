using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiasDeCine
{
    public class PeliculasRepositorio
    {
        CineDBContext dbContext = new CineDBContext();

        public List<Pelicula> getPeliculas()
        {
            return dbContext.Peliculas.ToList();
        }
        public void insertarPelicula(Pelicula pelicula)
        {
            dbContext.Peliculas.Add(pelicula);
            dbContext.SaveChanges();
        }
        public void modificarPelicula(Pelicula pelicula)
        {
            Pelicula peliculaAActualizar = dbContext.Peliculas.FirstOrDefault(p => p.ID == pelicula.ID);
            peliculaAActualizar.Titulo = pelicula.Titulo;
            peliculaAActualizar.Cartel = pelicula.Cartel;
            dbContext.SaveChanges();
        }
        public void eliminarPelicula(Pelicula pelicula)
        {
            Pelicula peliculaAActualizar = dbContext.Peliculas.FirstOrDefault(p => p.ID == pelicula.ID);
            dbContext.Peliculas.Remove(peliculaAActualizar);
            dbContext.SaveChanges();
        }
    }
}
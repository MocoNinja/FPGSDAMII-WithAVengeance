using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MisDiasDeCine
{
    public class PeliculaRepositorio
    {
        BaseDatos BD = new BaseDatos();

        public List<Pelicula> SelectPeliculas()
        {
            return BD.TablaPeliculas.ToList();
        }

        public void InsertPelicula(Pelicula PeliculaInput)
        {
            BD.TablaPeliculas.Add(PeliculaInput);
            BD.SaveChanges();
        }

        public void DeletePelicula(Pelicula PeliculaInput)
        {
            Pelicula Target = BD.TablaPeliculas.FirstOrDefault(a => a.Id == PeliculaInput.Id);
            BD.TablaPeliculas.Remove(Target);
            BD.SaveChanges();
        }

        public void UpdatePelicula(Pelicula PeliculaInput)
        {
            Pelicula Target = BD.TablaPeliculas.FirstOrDefault(a => a.Id == PeliculaInput.Id);
            Target.Nombre = PeliculaInput.Nombre;
            BD.SaveChanges();
        }

        
    }
}
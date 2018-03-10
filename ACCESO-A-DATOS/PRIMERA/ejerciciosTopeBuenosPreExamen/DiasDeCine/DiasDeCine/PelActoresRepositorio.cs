using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiasDeCine
{
    public class PelActoresRepositorio
    {
        CineDBContext cineDB = new CineDBContext();

        public List<PeliculaActor> getPelActores(string codPelicula)
        {
            Int32 codigo = Int32.Parse(codPelicula);
            List<PeliculaActor> lista = (from actores in cineDB.PeliculasActores
                                 where actores.PeliculaID == codigo
                                 select actores
                                ).ToList();
            return lista;
        }

        public void insertarPeliActor(PeliculaActor peliActor)
        {
            cineDB.PeliculasActores.Add(peliActor);
            cineDB.SaveChanges();
        }

        public void modificarPeliActor(PeliculaActor peliActor)
        {
            PeliculaActor peliActorActualizar = cineDB.PeliculasActores.FirstOrDefault(p => p.PeliculaID == peliActor.PeliculaID && p.ActorID == peliActor.ActorID);
            peliActorActualizar.ActorID = peliActor.ActorID;
            peliActorActualizar.nomPersonaje = peliActor.nomPersonaje;
            peliActorActualizar.sueldo = peliActor.sueldo;
            cineDB.SaveChanges();
        }

        public void eliminarPeliActor(PeliculaActor peliActor)
        {
            PeliculaActor peliActorEliminar = cineDB.PeliculasActores.FirstOrDefault(p => p.PeliculaID == peliActor.PeliculaID && p.ActorID == peliActor.ActorID);
            cineDB.PeliculasActores.Remove(peliActorEliminar);
            cineDB.SaveChanges();
        }
    }
}
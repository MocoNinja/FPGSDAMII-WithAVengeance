using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiasDeCine
{
    public class ActorRepositorio
    {
        CineDBContext cineDb = new CineDBContext();
        public List<Actor> getActores()
        {
            return cineDb.Actores.ToList();
        }
        public void insertarActor(Actor actor)
        {
            cineDb.Actores.Add(actor);
            cineDb.SaveChanges();
        }
        public void modificarActor(Actor actor)
        {
            Actor actorAActualizar = cineDb.Actores.FirstOrDefault(p => p.ID == actor.ID);
            actorAActualizar.Nombre = actor.Nombre;
            actorAActualizar.Apellidos = actor.Apellidos;
            actorAActualizar.PaisID = actor.PaisID;
            cineDb.SaveChanges();
        }
        public void eliminarActor(Actor actor)
        {
            Actor actorAEliminar = cineDb.Actores.FirstOrDefault(p => p.ID == actor.ID);
            cineDb.Actores.Remove(actorAEliminar);
            cineDb.SaveChanges();
        }
    }
}
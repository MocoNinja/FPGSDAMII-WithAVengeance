using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AD07
{
	public class ActorRepositorio
	{
		CineDBContext actorDBContext = new CineDBContext();

		public List<Actor> GetActores()
		{
			return actorDBContext.Actores.ToList();
		}

		public void InsertarActor(Actor actor)
		{
			actorDBContext.Actores.Add(actor);
			actorDBContext.SaveChanges();
		}

		public void ActualizarActor(Actor actor)
		{
			Actor actorToActualizar = actorDBContext.Actores.FirstOrDefault(x => x.ID == actor.ID);
			actorToActualizar.Nombre = actor.Nombre;
			actorToActualizar.Apellidos = actor.Apellidos;
			actorToActualizar.PaisID = actor.PaisID;
			actorDBContext.SaveChanges();
		}

		public void EliminarActor(Actor alumno)
		{
			Actor actorToEliminar = actorDBContext.Actores.FirstOrDefault(x => x.ID == alumno.ID);
			actorDBContext.Actores.Remove(actorToEliminar);
			actorDBContext.SaveChanges();
		}
	}
}
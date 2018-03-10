using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MisDiasDeCine
{
    public class ActorRepositorio
    {
        BaseDatos BD = new BaseDatos();

        public List<Actor> SelectActores()
        {
            return BD.TablaActores.ToList();
        }
        
        public void InsertActor(Actor ActorInput)
        {
            BD.TablaActores.Add(ActorInput);
            BD.SaveChanges();
        }

        public void DeleteActor(Actor ActorInput)
        {
            Actor Target = BD.TablaActores.FirstOrDefault(a => a.Id == ActorInput.Id);
            BD.TablaActores.Remove(Target);
            BD.SaveChanges();
        }

        public void UpdateActor(Actor ActorInput)
        {
            Actor Target = BD.TablaActores.FirstOrDefault(a => a.Id == ActorInput.Id);
            Target.Nombre = ActorInput.Nombre;
            Target.Apellidos = ActorInput.Apellidos;
            Target.IdPais = ActorInput.IdPais;
            BD.SaveChanges();
        }
    }
}
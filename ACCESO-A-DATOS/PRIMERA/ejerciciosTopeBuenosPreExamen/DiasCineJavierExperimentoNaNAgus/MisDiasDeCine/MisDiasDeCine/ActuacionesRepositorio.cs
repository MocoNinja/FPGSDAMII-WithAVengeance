using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MisDiasDeCine
{
    public class ActuacionesRepositorio
    {
        BaseDatos BD = new BaseDatos();

        public List<Actuaciones> SelectActuaciones()
        {
            return BD.TablaActuaciones.ToList();
        }
        public void InsertarActuacion(Actuaciones Insertada)
        {
            BD.TablaActuaciones.Add(Insertada);
            BD.SaveChanges();
        }

        public void DeleteActuacion(Actuaciones Insertada)
        {
            Actuaciones Borrar = BD.TablaActuaciones.FirstOrDefault(
                p => p.IdActor == Insertada.IdActor && p.IdPelicula == Insertada.IdPelicula);
            BD.TablaActuaciones.Remove(Borrar);
            BD.SaveChanges();
        }

        public void UpdateActuacion(Actuaciones Insertada)
        {
            Actuaciones Actualizar = BD.TablaActuaciones.FirstOrDefault(
                p => p.IdActor == Insertada.IdActor && p.IdPelicula == Insertada.IdPelicula);
            Actualizar.IdActor = Insertada.IdActor;
            Actualizar.IdPelicula = Insertada.IdPelicula;
            Actualizar.Sueldo = Insertada.Sueldo;
            Actualizar.NombrePersonaje = Insertada.NombrePersonaje;
            BD.SaveChanges();
        }

        public List<Actor> GetActoresFrom(string IdPeliculaInput)
        {
            List<Actor> Actores = new List<Actor>();
            int IdPelicula = int.Parse(IdPeliculaInput);

            List<Actuaciones> ActuacionesPelicula =
                (
                from ActuacionesSeleccionadas in BD.TablaActuaciones
                where ActuacionesSeleccionadas.IdPelicula == IdPelicula
                select ActuacionesSeleccionadas
                ).ToList();

            foreach (Actuaciones Act in ActuacionesPelicula)
            {
                Actor Rescatado = BD.TablaActores.FirstOrDefault(A => A.Id == Act.IdActor);
                Actores.Add(Rescatado);
            }

            return Actores;
        }
    }
}
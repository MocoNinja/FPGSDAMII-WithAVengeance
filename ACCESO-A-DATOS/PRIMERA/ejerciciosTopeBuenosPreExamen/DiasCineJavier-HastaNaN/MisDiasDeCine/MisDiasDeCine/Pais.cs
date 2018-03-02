using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MisDiasDeCine
{
    public class Pais
    {
        public int Id { get; set; }
        public string Nombre { get; set; }

        // Relación 1:N con actores -> a un país pertenecen varios actores

        public List<Actor> Actores;
    }
}
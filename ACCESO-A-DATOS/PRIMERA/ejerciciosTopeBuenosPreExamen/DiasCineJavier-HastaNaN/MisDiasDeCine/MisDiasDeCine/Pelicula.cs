using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MisDiasDeCine
{
    public class Pelicula
    {
        public int Id { get; set; }
        public string Nombre { get; set; }

        // Relación N:N con actores -> una película tiene varios actores

        public List<Actor> Actores { get; set; }
    }
}
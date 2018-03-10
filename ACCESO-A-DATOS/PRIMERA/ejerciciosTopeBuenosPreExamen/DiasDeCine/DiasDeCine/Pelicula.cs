using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiasDeCine
{
    public class Pelicula
    {
        public int ID { get; set; }
        public string Titulo { get; set; }
        public string Cartel { get; set; }
        public IList<Actor> SusActores { get; set; }
    }
}
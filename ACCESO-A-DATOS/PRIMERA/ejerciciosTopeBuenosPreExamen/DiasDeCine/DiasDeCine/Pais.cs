using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiasDeCine
{
    public class Pais
    {
        public int ID { get; set; }
        public string Nom_Pais { get; set; }
        public List<Actor> Actores { get; set; }
    }
}
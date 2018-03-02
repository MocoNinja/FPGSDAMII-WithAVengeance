using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamenJGT.Models
{
    public class ClasePrueba2
    {
        public int ID { get; set; }
        public int Nombre { get; set; }
        public ClasePrueba Puntero { get; set; }
        public int PunteroID { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MiConcesionario.Models
{
    public class Vehiculo
    {
        public int ID { get; set; }
        public string Matricula { get; set; }
        public string Color { get; set; }
        public int SerieID { get; set; }
        public Serie Serie { get; set; }
        public List<int> ExtrasID { get; set; }
        public List<ExtrasVehiculos> Extras { get; set; }
    }
}
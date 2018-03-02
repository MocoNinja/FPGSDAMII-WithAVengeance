using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VistaControlador1.Models
{
    public class Automovil
    {
        public int ID { get; set; }
        public string Matricula { get; set; }
        public string Color { get; set; }
        public SerieModelo Serie { get; set; }
        public int SerieID { get; set; }

        public List<SerieModelo> Series { get; set; }
        
        //Creamos una lista con los enteros que corresponden a los extras de cada coche (Clase AutomovilExtra)
        public List<int> ExtrasSeleccionados { get; set; }
        public List<AutomovilesExtrasModelo> AutoExtras { get; set; }
    }
}
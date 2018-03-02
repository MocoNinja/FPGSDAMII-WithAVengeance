using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VistaControlador1.Models
{
    public class MarcaModelo
    {
        public int ID { get; set; }
        public string  Nom_marca  { get; set; }
        public List<SerieModelo> MarcaSeries { get; set; }
    }
}
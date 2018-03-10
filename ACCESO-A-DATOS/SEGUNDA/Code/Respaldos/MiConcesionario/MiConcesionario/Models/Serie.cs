using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MiConcesionario.Models
{
    public class Serie
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public Marca Marca { get; set; }
        public int MarcaID { get; set; }
    }
}
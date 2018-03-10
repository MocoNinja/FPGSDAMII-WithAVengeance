using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCInicial.Models
{
    public class Vehiculo
    {
        public int Id { get; set; }
        public string Matricula { get; set; }
        public string Color { get; set; }

        // Relaciones
        public Serie Serie { get; set; }
        public int IdSerie { get; set; }
    }
}
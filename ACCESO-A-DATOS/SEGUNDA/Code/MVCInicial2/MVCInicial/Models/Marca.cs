using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCInicial.Models
{
    public class Marca
    {
        public int Id { get; set; } // El dice que para que sea autoincrementativo debe ser ID, pero a mi me suenta que debe ser Id
        public string Nombre { get; set; }

        // Relación con Series: Una marca tiene varias series
        public List<Serie> Series { get; set; }
    }
}
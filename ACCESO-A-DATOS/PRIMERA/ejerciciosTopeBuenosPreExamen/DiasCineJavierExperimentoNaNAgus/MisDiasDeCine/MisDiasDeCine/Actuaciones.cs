using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MisDiasDeCine
{
    public class Actuaciones
    {
        // Es la tabla intermedia que surge de la relación entre películas y acotres

        public Actor Actor { get; set; }
        public Pelicula Pelicula { get; set; }

        // Clave compuesta a partir de las Ids de estos dos elementos

        [Key, Column(Order = 1)]
        public int IdActor { get; set; }
        [Key, Column(Order = 2)]
        public int IdPelicula { get; set; }

        // Atributos propios de la relación

        public float Sueldo { get; set; }
        public string NombrePersonaje { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MisDiasDeCine
{
    public class Actor
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }

        // Relación 1:N con paises -> un actor pertenece a un único país

        public int IdPais { get; set; }
        [ForeignKey("IdPais")]
        public Pais Pais { get; set;  }

        // Relación N:N con películas -> un actor ha participado en varias

        public List<Pelicula> Peliculas { get; set; }
    }
}
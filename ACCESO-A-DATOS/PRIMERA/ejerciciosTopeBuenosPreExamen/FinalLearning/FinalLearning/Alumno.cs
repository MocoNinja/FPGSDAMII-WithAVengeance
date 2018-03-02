using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace FinalLearning
{
    public class Alumno
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }

        // Relación 1:N con País -> Un alumno pertenece a un único Pais

        public int IdPais { get; set; }
        [ForeignKey("IdPais")]
        public Pais Pais { get; set; }

        // Relación N:N con Clase -> Un alumno va a estar matriculado en varias clases
        public List<Clase> Clases { get; set; }
    }
}
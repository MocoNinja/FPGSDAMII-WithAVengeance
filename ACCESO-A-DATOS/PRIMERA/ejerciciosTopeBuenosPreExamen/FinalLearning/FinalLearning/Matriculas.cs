using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace FinalLearning
{
    public class Matriculas
    {
        // Tabla intermedia de la relacion N:N Alumno : Clase

        public Alumno Alumno { get; set; }
        public Clase Clase { get; set; }

        [Key, Column(Order = 1)]
        public int IdAlumno { get; set; }

        [Key, Column (Order = 2)]
        public int IdClase { get; set; }

        // Atributo propio de la relación

        public int Calificacion { get; set; }
    }
}
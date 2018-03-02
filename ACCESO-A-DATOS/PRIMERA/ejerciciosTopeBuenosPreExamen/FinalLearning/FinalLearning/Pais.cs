using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalLearning
{
    public class Pais
    {
        public int Id { get; set; }
        public string Nombre { get; set; }

        // Relación 1:N con Alumno: Varios alumnos pueden ser de un mismo país

        public List<Alumno> Alumnos { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalLearning
{
    public class Clase
    {
        public int Id { get; set; }
        public string Nombre { get; set; }

        // Relación N:N con Alumnos: A una clase, van a pertenecer varios alumnos
        public List<Alumno> Alumnos { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProcedimientosC0d3r
{
    public class Alumno // la entidad
    {
        public int AlumnoID { get; set; }
        public int Edad { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public string Genero { get; set; }
    }
}
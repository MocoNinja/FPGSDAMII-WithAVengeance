using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _01ComoEnElExamen
{
    /**
     *  Código que representa la base de datos
     *  Va a tener los campos:
     *  ID (int)
     *  Curso (String)
     *  La relación con los alumnos del curso (Una lista)
     */
    public class Clase
    {
        // C# -> el campo puede definir los getter y setter de la siguiente manera
        public int ID { get; set; }
        public string Curso { get; set; }
        public List<Alumno> Alumnos { get; set; }
    }
}
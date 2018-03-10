using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace _01ComoEnElExamen
{
    [Table("tblAlumnos")]
    public class Alumno
    {
        [Column("idAlumno")]
        public int ID { get; set; }
        [Column("nombre")]
        public string Nombre { get; set; }
        [Column("apellidos")]
        public string Apellidos { get; set; }
        [Column("genero")]
        public string Genero { get; set; }
        [Column("edad")]
        public int edad { get; set; }
        // Al igual que antes, necesitamos un puntero para la clase
        public Clase Clase { get; set; }
    }
}
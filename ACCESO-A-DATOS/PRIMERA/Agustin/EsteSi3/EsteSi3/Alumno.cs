using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;

namespace EsteSi3
{
    [Table("tblAlumnos")]
    public class Alumno
    {
        public int ID { get; set; }
        [Column("Nombre_Propio")]
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public string Genero { get; set; }
        public int Edad { get; set; }
        public int ClaseID { get; set; }
        [ForeignKey("ClaseID")]
        public Clase Clase { get; set; }
    }
}
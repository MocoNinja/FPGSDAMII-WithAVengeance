using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;

namespace DiasDeCine
{
    public class Actor
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public int PaisID { get; set; }
        [ForeignKey("PaisID")]
        public Pais Pais { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace VistaControlador1.Models
{
    public class Provincia
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Codigo { get; set; }
        public string Nombre { get; set; }
    }
}
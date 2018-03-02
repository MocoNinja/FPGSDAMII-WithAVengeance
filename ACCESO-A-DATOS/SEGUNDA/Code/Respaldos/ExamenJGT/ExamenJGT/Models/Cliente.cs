using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamenJGT.Models
{
    public class Cliente
    {
        public int ID { get; set; }
        public string CIF { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public string Logotipo { get; set; }
    }
}
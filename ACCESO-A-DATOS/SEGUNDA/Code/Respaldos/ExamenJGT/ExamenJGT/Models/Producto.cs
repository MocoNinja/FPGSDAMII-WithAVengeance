using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamenJGT.Models
{
    public class Producto
    {
        public int ID { get; set; }
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Foto { get; set; }
        public int Cantidad { get; set; }
        public double Precio { get; set; }
    }
}
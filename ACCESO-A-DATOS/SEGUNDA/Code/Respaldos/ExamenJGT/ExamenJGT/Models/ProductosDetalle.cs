using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamenJGT.Models
{
    public class ProductosDetalle
    {
        public int ID { get; set; }
        public int DetalleID { get; set; }
        public Detalle Detalle { get; set; }
        public int ProductoID { get; set; }
        public int Producto { get; set; }
        public int Cantidad { get; set; }
    }
}
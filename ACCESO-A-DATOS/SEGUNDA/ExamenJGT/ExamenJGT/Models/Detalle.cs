using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamenJGT.Models
{
    public class Detalle
    {
        public int ID { get; set; }
        public int PedidoID { get; set; }
        public Pedido Pedido { get; set; }
        public List<int> ProductosDetallesIDs { get; set; }
        public List<ProductosDetalle> ProductosDetalles { get; set; }
    }
}
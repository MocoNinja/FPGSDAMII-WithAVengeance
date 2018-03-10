using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamenJGT.Models
{
    public class Pedido
    {
        public int ID { get; set; }
        public string NumeroPedido { get; set; }
        public DateTime FechaExpedicion { get; set; }
        public int ClienteID { get; set; }
        public Cliente Cliente { get; set; }
    }
}
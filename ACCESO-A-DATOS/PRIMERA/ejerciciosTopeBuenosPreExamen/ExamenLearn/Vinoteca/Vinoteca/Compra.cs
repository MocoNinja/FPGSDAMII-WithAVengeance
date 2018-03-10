using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Vinoteca
{
    public class Compra
    {
        public int Id { get; set; }

        // Relación 1:N con cliente: una compra está realizada por un único cliente
        public int IdCliente { get; set; }
        [ForeignKey("IdCliente")]
        public Cliente Cliente { get; set; }
    }
}
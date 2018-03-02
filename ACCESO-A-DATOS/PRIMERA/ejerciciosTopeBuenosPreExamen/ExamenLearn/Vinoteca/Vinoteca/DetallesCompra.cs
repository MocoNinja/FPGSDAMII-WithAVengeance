using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Vinoteca
{
    public class DetallesCompra
    {
        // Atributos de la relación N:N
        public Compra Compra { get; set; }
        public Vino Vino { get; set; }
        [Key, Column(Order=1)]
        public int IdCompra { get; set; }
        [Key, Column(Order=2)]
        public int IdVino { get; set; }
        // Atributos propios de la relación
        public int Precio;
        public int Botellas;
    }
}
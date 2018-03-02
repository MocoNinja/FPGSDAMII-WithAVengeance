using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Vinoteca
{
    public class Cliente
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }

        // Relación 1:N con compras: un cliente puede haber realizado varias compras
        
        public List<Compra> Compras { get; set; }
    }
}
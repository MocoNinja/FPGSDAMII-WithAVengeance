using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Vinoteca
{
    public class Vino
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public float Precio { get; set; }

        // Relación 1:N con Bodegas: un vino pertenece a una sóla bodega

        public int IdBodega { get; set; }
        [ForeignKey("IdBodega")]
        public Bodega Bodega { get; set; }
    }
}
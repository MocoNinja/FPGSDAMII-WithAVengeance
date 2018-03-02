using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ExamenJGT
{
    public class Receta_Productos
    {
        // Relación N:N Receta : Productos

        public Receta Receta { get; set; }
        public Producto Producto { get; set; }

        // Creamos la clave de esta tabla intermedia como combinación de las ajenas

        [Key, Column(Order=1)]
        public int IdReceta { get; set; }
        [Key, Column(Order = 2)]
        public int IdProducto { get; set; }

        // Atributos Propios de la relación

        public double Cantidad { get; set; }

        // Este atributo propio es a su vez una referencia a la tabla de medida
        // Es una relación 1:N cada elemento puede tener un sólo tipo de medida
        // que tendremos que incluir aquí como clave foránea

        public int MedidaId { get; set; }
        [ForeignKey("MedidaId")]
        public Medida Medida { get; set; }
    }
}
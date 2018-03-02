using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamenJGT
{
    public class Medida
    {
        public int Id { get; set; }
        public string TipoMedida { get; set; }

        // Relación con Receta_Productos: varios objetos de la tabla intermedia van
        // a contener un tipo de medida

        public List<Receta_Productos> RecetaProductos { get; set; }
    }
}
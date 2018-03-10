using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Vinoteca
{
    public class Bodega
    {
        public int Id { get; set; }
        public string Nombre { get; set; }

        // Relación 1:N con Vino : A una bodega pueden pertenecer varios vinos

        public List<Vino> Vinos { get; set; }
    }
}
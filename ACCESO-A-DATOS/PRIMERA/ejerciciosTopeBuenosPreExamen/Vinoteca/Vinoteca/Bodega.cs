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
        public List<Vino> Vinos { get; set; }
    }
}
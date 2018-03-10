using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCInicial.Models
{
    public class VehiculosExtras
    {
        public int Id { get; set; }

        public int VehiculoID { get; set; }
        public Vehiculo Vehiculo { get; set; }

        public int ExtraID { get; set; }
        public Extra Extra { get; set; }
    }
}
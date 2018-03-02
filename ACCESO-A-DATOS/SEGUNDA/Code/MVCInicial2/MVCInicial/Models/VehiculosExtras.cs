using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCInicial.Models
{
    public class VehiculosExtras
    {
        public int Id { get; set; }

        public int IdVehiculo { get; set; }
        public Vehiculo Vehiculo { get; set; }

        public int IdExtra { get; set; }
        public Extra Extra { get; set; }
    }
}
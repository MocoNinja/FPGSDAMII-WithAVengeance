using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MiConcesionario.Models
{
    public class ExtrasVehiculos
    {
        public int ID { get; set; }
        public int VehiculoID { get; set; }
        public Vehiculo Vehiculo { get; set; }
        public int ExtraID { get; set; }
        public Extra Extra { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCInicial.Models
{
    public class Cliente
    {
        public int ID { get; set; }
        public string NIF { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public string Dirección { get; set; }
        // Relación con Provincia
        public Provincia Provincia { get; set; }
        public int ProvinciaID { get; set; }
        // Relación con Vehículos
        public List<Vehiculo> Vehiculos { get; set; }
        public List<int> VehiculosID { get; set; }
    }
}
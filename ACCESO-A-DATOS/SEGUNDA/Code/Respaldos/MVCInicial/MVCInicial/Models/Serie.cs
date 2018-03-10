using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCInicial.Models
{
    public class Serie
    {
        public int Id { get; set; }
        public string Nombre { get; set; }

        // Relación con Marca: una serie pertenece a una sola marca
        public Marca Marca { get; set; }
        public int? MarcaID { get; set; } // Permite nulos

        public List<Vehiculo> Vehiculos { get; set; }
    }
}
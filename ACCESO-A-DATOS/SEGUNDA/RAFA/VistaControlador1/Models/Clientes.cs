using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VistaControlador1.Models
{
    public class Clientes
    {
        public int ID { get; set; }
        public string NIF { get; set; }
        public string Apellidos { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }

        public int ProvinciaID { get; set; }
        public Provincia Provincia { get; set; }

        public List<int> AutomovilesEnPropiedad { get; set; }
        public List<Automovil> Autos { get; set; }
    }
}
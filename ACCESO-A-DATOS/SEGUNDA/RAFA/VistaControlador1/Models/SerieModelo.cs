using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;



namespace VistaControlador1.Models
{
    public class SerieModelo
    {
        public int ID { get; set; }
        public string Nom_Serie { get; set; }

        public MarcaModelo Marca { get; set; }
        public int? MarcaID { get; set; }//Con el interrogante permite valores nulos

        public List<Automovil> Automoviles { get; set; }
    }
}
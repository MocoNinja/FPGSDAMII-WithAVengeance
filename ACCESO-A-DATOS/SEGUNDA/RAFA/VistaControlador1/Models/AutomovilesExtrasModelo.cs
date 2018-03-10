using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VistaControlador1.Models
{
    public class AutomovilesExtrasModelo
    {
        public int ID { get; set; }
        public int automovilID { get; set; }
        public Automovil Automovil { get; set; }
        public int ExtraID { get; set; }
        public ExtraModelo Extra { get; set; }
 
    }
}
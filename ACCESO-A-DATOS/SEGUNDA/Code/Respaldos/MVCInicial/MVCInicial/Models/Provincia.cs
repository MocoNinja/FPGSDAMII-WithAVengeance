using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
// using.System.ComponentModel.DataAnnotations // Para definir la clave
// using.System.Collections.Generic // Para definir la clave
namespace MVCInicial.Models
{
    public class Provincia
    {
        public int ID { get; set; } // Comentado en agustin
        //[Key, DatabaseGenerated(DatabaseGeneratedOption.None)] // Para que sea clave primaria Y no se genere automáticamente
        public int Codigo { get; set; } // Lo ha llamado ID para lo de lasd relaciones y campos nombrados
        public string Nombre { get; set; }
    }  
}
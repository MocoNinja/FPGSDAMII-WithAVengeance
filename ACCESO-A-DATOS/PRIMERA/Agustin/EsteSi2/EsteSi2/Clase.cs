//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EsteSi2
{
    using System;
    using System.Collections.Generic;
    
    public partial class Clase
    {
        public Clase()
        {
            this.Alumno = new HashSet<Alumno>();
        }
    
        public int ID { get; set; }
        public string Curso { get; set; }
    
        public virtual ICollection<Alumno> Alumno { get; set; }
    }
}

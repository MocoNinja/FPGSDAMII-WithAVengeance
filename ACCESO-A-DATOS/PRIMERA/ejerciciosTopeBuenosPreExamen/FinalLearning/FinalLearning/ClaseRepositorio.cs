using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalLearning
{
    public class ClaseRepositorio
    {
        BaseDatos BD = new BaseDatos();

        public List<Clase> SelectClases()
        {
            return BD.TablaClases.ToList();
        }
    }
}
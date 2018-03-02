using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Vinoteca
{
    public class VinoRepositorio
    {
        public BaseDatos BD = new BaseDatos();

        public List<Vino> SelectVinos()
        {
            return BD.Vinos.ToList();
        }
        
        public void InsertVino(Vino VinoInsertado)
        {
            BD.Vinos.Add(VinoInsertado);
            BD.SaveChanges();
        }

        public void DeleteVino(Vino VinoSeleccionado)
        {
            Vino Borrar = BD.Vinos.FirstOrDefault(p => p.Id == VinoSeleccionado.Id) ;
            BD.Vinos.Remove(Borrar);
            BD.SaveChanges();
        }

        public void UpdateVino(Vino VinoSeleccionado)
        {
            Vino Actualizar = BD.Vinos.FirstOrDefault(p => p.Id == VinoSeleccionado.Id);
            Actualizar.IdBodega = VinoSeleccionado.IdBodega;
            Actualizar.Nombre = VinoSeleccionado.Nombre;
            BD.SaveChanges();
        }
    }
}
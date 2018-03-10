using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Vinoteca
{
    public class BodegaRepositorio
    {
        public BaseDatos BD = new BaseDatos();

        public List<Bodega> SelectBodegas()
        {
            return BD.Bodegas.ToList();
        }

        public void InsertBodega(Bodega BodegaInsertada)
        {
            BD.Bodegas.Add(BodegaInsertada);
            BD.SaveChanges();
        }

        public void DeleteBodega(Bodega BodegaSeleccionada)
        {
            // BD.Bodegas.Remove(BodegaInsertada); // No Funciona
            Bodega Borrar = BD.Bodegas.FirstOrDefault(p => p.Id == BodegaSeleccionada.Id);
            BD.Bodegas.Remove(Borrar);
            BD.SaveChanges();
        }

        public void UpdateBodega(Bodega BodegaSeleccionada)
        {
            Bodega Actualizar = BD.Bodegas.FirstOrDefault(p => p.Id == BodegaSeleccionada.Id);
            Actualizar.Nombre = BodegaSeleccionada.Nombre;
            BD.SaveChanges();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Vinoteca
{
    public class BodegaRepositorio
    {
        BaseDatos BD = new BaseDatos();

        public List<Bodega> SelectBodegas()
        {
            return BD.TablaBodegas.ToList();
        }

        public void InsertBodega(Bodega Bodega)
        {
            BD.TablaBodegas.Add(Bodega);
            BD.SaveChanges();
        }

        public void DeleteBodega(Bodega Bodega)
        {
            Bodega Target = BD.TablaBodegas.FirstOrDefault(b => b.Id == Bodega.Id);
            BD.TablaBodegas.Remove(Target);
            BD.SaveChanges();
        }

        public void UpdateBodega(Bodega Bodega)
        {
            Bodega Target = BD.TablaBodegas.FirstOrDefault(b => b.Id == Bodega.Id);
            Target.Nombre = Bodega.Nombre;
            BD.SaveChanges();
        }

        public List<Vino> GetVinosFrom(string IdBodegaInput)
        {
            int IdBodega = int.Parse(IdBodegaInput);
            List<Vino> Vinos = null;

            // Consulta
           // /*
            Vinos = (
                from SusVinos in BD.TablaVinos
                where SusVinos.IdBodega == IdBodega
                select SusVinos
                ).ToList();
            //*/
            /*
            // Tabla
            Bodega Bodega = BD.TablaBodegas.Include("Vinos").FirstOrDefault(p => p.Id == IdBodega);
            Vinos = Bodega.Vinos;
            */
            return Vinos;

        }
    }
}
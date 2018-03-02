using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Vinoteca
{
    public class VinoRepositorio
    {
        BaseDatos BD = new BaseDatos();

        public List<Vino> SelectVinos()
        {
            return BD.TablaVinos.ToList();
        }

        public void InsertVino(Vino Vino)
        {
            BD.TablaVinos.Add(Vino);
            BD.SaveChanges();
        }

        public void DeleteVino(Vino Vino)
        {
            Vino Target = BD.TablaVinos.FirstOrDefault(b => b.Id == Vino.Id);
            BD.TablaVinos.Remove(Target);
            Target.IdBodega = Vino.IdBodega;
            BD.SaveChanges();
        }

        public void UpdateVino(Vino Vino)
        {
            Vino Target = BD.TablaVinos.FirstOrDefault(b => b.Id == Vino.Id);
            Target.Nombre = Vino.Nombre;
            Target.Bodega = Vino.Bodega;
            Target.IdBodega = Vino.IdBodega;
            BD.SaveChanges();
        }
    }
}
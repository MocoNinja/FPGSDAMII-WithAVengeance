using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExamenJGT
{
    public class RecetasRepositorio
    {
        BaseDatos BD = new BaseDatos();

        public List<Receta> SelectRecetas()
        {
            return BD.TablaRecetas.ToList();
        }

        public void InsertReceta(Receta Insertando)
        {
            BD.TablaRecetas.Add(Insertando);
            BD.SaveChanges();
        }

        public void DeleteReceta(Receta Borrando)
        {
            Receta Rescatar = BD.TablaRecetas.FirstOrDefault(elemento => elemento.Id == Borrando.Id);
            BD.TablaRecetas.Remove(Rescatar);
            BD.SaveChanges();
        }

        public void UpdateReceta(Receta Actualizando)
        {
            Receta Rescatar = BD.TablaRecetas.FirstOrDefault(elemento => elemento.Id == Actualizando.Id);
            Rescatar.Nom_Receta = Actualizando.Nom_Receta;
            Rescatar.Foto = Actualizando.Foto;
            Rescatar.Comentarios = Actualizando.Comentarios;
            BD.SaveChanges();
        }
    }
}
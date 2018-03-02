using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MisDiasDeCine
{
    public class PaisRepositoio
    {
        BaseDatos BD = new BaseDatos();

        public List<Pais> SelectPaises()
        {
            return BD.TablaPaises.ToList();
        }

        public void InsertPais(Pais PaisInput)
        {
            BD.TablaPaises.Add(PaisInput);
            BD.SaveChanges();
        }

        public void DeletePais(Pais PaisInput)
        {
            Pais Target = BD.TablaPaises.FirstOrDefault(a => a.Id == PaisInput.Id);
            BD.TablaPaises.Remove(Target);
            BD.SaveChanges();
        }

        public void UpdatePais(Pais PaisInput)
        {
            Pais Target = BD.TablaPaises.FirstOrDefault(a => a.Id == PaisInput.Id);
            Target.Nombre = PaisInput.Nombre;
            BD.SaveChanges();
        }

        public List<Actor> GetActores(string IdPaisInput)
        {
            int IdPais = int.Parse(IdPaisInput);
            List<Actor> Actores = null;
            // Método sencillo -> usando la tabla
            // Pais Pais = BD.TablaPaises.Include("Actores").FirstOrDefault(p => p.Id == IdPais);
            // Actores = Pais.Actores;
            // Método complejo -> usando consultas
            Actores = (
                from ActoresPais in BD.TablaActores
                where ActoresPais.IdPais == IdPais
                select ActoresPais
                ).ToList();
            return Actores;
        }
    }
}
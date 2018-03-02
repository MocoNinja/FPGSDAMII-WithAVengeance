using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace DiasDeCine
{
    public class PaisRepositorio
    {
        CineDBContext cineDb = new CineDBContext();

        public List<Pais> getPaises()
        {
            return cineDb.Paises.ToList();
        }

        public List<Actor> getActors(string cod_pais)
        {
            int xxx = Int32.Parse(cod_pais);
            List<Actor> lista = (from actores in cineDb.Actores
                                   where actores.PaisID == xxx
                                   select actores
                                ).ToList();
            return lista;
        }

        public List<Actor> getActors2(string cod_pais)
        {
            int xxx = Int32.Parse(cod_pais);
            Pais pais = cineDb.Paises.Include("Actores").FirstOrDefault(x => x.ID == xxx);
            return pais.Actores;
        }

        public void insertarPais(Pais pais)
        {
            cineDb.Paises.Add(pais);
            cineDb.SaveChanges();
        }
        public void modificarPais(Pais pais) {
            Pais paisAActualizar = cineDb.Paises.FirstOrDefault(p => p.ID == pais.ID);
            paisAActualizar.Nom_Pais = pais.Nom_Pais;
            cineDb.SaveChanges();
        }
        public void eliminarPais(Pais pais)
        {
            Pais paisAEliminar = cineDb.Paises.FirstOrDefault(p => p.ID == pais.ID);
            cineDb.Paises.Remove(paisAEliminar);
            cineDb.SaveChanges();
        }
    }
}
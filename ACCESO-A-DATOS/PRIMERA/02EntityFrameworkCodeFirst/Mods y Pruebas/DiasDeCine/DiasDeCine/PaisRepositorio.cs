using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiasDeCine
{
    public class PaisRepositorio
    {
        CineDBContext cineDb = new CineDBContext();
        public List<Pais> getPaises()
        {
            return cineDb.Paises.ToList();
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
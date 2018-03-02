using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AD07
{
	public class PaisRepositorio
	{
		CineDBContext paisDBContext = new CineDBContext();

		public List<Pais> GetPaises()
		{
			return paisDBContext.Paises.ToList();
		}

		public List<Actor> GetActors(string cod_pais)
		{
			int a = Int32.Parse(cod_pais);
			Pais pais = paisDBContext.Paises.Include("Actores").FirstOrDefault(x => x.ID == a);
			return pais.Actores;
		}

		public List<Actor> GetActorsx(string cod_pais)
		{
			int a = Int32.Parse(cod_pais);
			List<Actor> lista = (from actores in paisDBContext.Actores
								 where actores.PaisID == a
								 select actores
				).ToList();
			return lista;
		}

		public void InsertarPais(Pais pais)
		{
			paisDBContext.Paises.Add(pais);
			paisDBContext.SaveChanges();
		}

		public void ActualizarPais(Pais pais)
		{
			Pais actorToActualizar = paisDBContext.Paises.FirstOrDefault(x => x.ID == pais.ID);
			actorToActualizar.Nom_Pais = pais.Nom_Pais;
			paisDBContext.SaveChanges();
		}

		public void EliminarPais(Pais pais)
		{
			Pais paisToEliminar = paisDBContext.Paises.FirstOrDefault(x => x.ID == pais.ID);
			paisDBContext.Paises.Remove(paisToEliminar);
			paisDBContext.SaveChanges();
		}
	}
}
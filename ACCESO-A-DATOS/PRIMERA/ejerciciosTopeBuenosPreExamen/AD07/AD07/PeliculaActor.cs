using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace AD07
{
	public class PeliculaActor
	{
		public Pelicula Pelicula { get; set; }
		public Actor Actor { get; set; }

		[Key, Column(Order = 1)]
		public int PeliculaID { get; set; }

		[Key, Column(Order = 2)]
		public int ActorID { get; set; }

		public string nomPersonaje { get; set; }
		public int sueldo { get; set; }
	}
}
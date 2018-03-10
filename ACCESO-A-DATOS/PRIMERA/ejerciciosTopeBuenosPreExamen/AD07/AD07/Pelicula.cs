using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AD07
{
	public class Pelicula
	{
		public int ID { get; set; }
		public String Titulo { get; set; }
		public String Cartel { get; set; }
		public IList<Actor> SusActores { get; set; }
	}
}
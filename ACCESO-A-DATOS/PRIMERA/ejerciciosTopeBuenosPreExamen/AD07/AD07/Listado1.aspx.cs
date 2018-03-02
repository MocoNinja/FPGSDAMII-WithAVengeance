using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AD07
{
	public partial class Listado1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			CineDBContext cineDB = new CineDBContext();
			GridListado.DataSource = (from Personajes in cineDB.Actores
									  from Peli in Personajes.SusPeliculas
									  select new
									  {
										  Nombre_Actor = Personajes.Nombre,
										  Apellidos_Actor = Personajes.Apellidos,
										  Titulo_Pelicula = Peli.Titulo
									  }).ToList();
			GridListado.DataBind();
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			int a = Int32.Parse(DropDownListActor.SelectedValue);
			int p = Int32.Parse(DropDownListPeli.SelectedValue);
			// int aa = Int32.Parse(TextBoxActor.Text);
			// int pp = Int32.Parse(TextBoxPeli.Text);

			CineDBContext cineDB = new CineDBContext();
			Pelicula peli = cineDB.Peliculas.FirstOrDefault(x => x.ID == p);
			cineDB.Actores.Include("SusPeliculas").FirstOrDefault(y => y.ID == a).SusPeliculas.Add(peli);
			cineDB.SaveChanges();
			GridListado.DataBind();
			Page.Response.Redirect(Page.Request.Url.ToString(), true);
		}

		protected void Button2_Click(object sender, EventArgs e)
		{
			int a = Int32.Parse(DropDownListActor.SelectedValue);
			int p = Int32.Parse(DropDownListPeli.SelectedValue);
			// int aa = Int32.Parse(TextBoxActor.Text);
			// int pp = Int32.Parse(TextBoxPeli.Text);

			CineDBContext cineDB = new CineDBContext();
			Pelicula peli = cineDB.Peliculas.FirstOrDefault(x => x.ID == p);
			cineDB.Actores.Include("SusPeliculas").FirstOrDefault(y => y.ID == a).SusPeliculas.Remove(peli);
			cineDB.SaveChanges();
			GridListado.DataBind();
			Page.Response.Redirect(Page.Request.Url.ToString(), true);
		}
	}
}
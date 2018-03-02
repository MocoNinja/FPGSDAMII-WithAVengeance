using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiasDeCine
{
    public partial class PeliculasActores : System.Web.UI.Page
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
            CineDBContext cineDB = new CineDBContext();
            Pelicula peli = cineDB.Peliculas.FirstOrDefault(x => x.ID == 6);

            Actor acto = cineDB.Actores.Include("SusPeliculas").FirstOrDefault(y => y.ID == 7);
            List<Pelicula> pp = acto.SusPeliculas.ToList();

            cineDB.Actores.Include("SusPeliculas").FirstOrDefault(y => y.ID == 7).SusPeliculas.Add(peli);
            cineDB.SaveChanges();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiasDeCine
{
    public partial class Galeria1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//si no venimos desde la actualizacion de la pagina
            {
                cambiarImagenes();
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            cambiarImagenes();
        }

        private void cambiarImagenes()
        {
            Random aleatorio = new Random();
            int i = aleatorio.Next(1, 9);//numeros aleatorios entre 1 y 8 
            Image1.ImageUrl = "~/imagenes/" + i.ToString() + ".jpg";
        }
    }
}
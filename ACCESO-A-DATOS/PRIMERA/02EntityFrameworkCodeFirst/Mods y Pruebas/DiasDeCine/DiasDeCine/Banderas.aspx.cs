using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiasDeCine
{
    public partial class Banderas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void plas_Click(object sender, EventArgs e)
        {
            if (archivito.HasFile)
            {
                string fileName = Path.GetFileName(archivito.PostedFile.FileName);
                archivito.PostedFile.SaveAs(Server.MapPath("./img/") + fileName);
                Response.Redirect(Request.Url.AbsoluteUri);
            }

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalLearning
{
    public partial class Matriculas1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ((System.Web.UI.WebControls.TextBox)DetailsView1.FindControl("textitooo")).Text = DropDownList1.SelectedValue;
        }
    }
}
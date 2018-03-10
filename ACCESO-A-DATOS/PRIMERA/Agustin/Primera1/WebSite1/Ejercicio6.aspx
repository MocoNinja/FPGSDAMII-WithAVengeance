<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ejercicio6.aspx.cs" Inherits="Ejercicio6" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>

<script runat="server">
    void Page_Load(Object sender, EventArgs e)
    {
        OleDbConnection conexion;
        OleDbDataAdapter adaptador;
        DataTable dt;

        if (ListEmpresas.SelectedValue != "")
        {
            conexion = new OleDbConnection("Provider=MicroSoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath(@"escuela_empresa.mdb") + ";");
            adaptador = new OleDbDataAdapter("select * from empresas where cod_empresa=" + ListEmpresas.SelectedValue, conexion);
            dt = new DataTable();
            adaptador.Fill(dt);

            direccion.Text = dt.Rows[0]["endereço"].ToString();
            telefono.Text = dt.Rows[0]["telefone"].ToString();
            email.Text = dt.Rows[0]["e_mail"].ToString();
            sector.SelectedValue = dt.Rows[0]["sector"].ToString();
        }


    }


</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:AccessDataSource ID="selSectores" runat="server"
             SelectCommand="select * from sectores order by nom_sector"
             DataFile="~/App_Data/escuela_empresa.mdb"/>

        <asp:AccessDataSource ID="selEmpresas" runat="server"
             SelectCommand="select * from empresas order by empresa"
             DataFile="~/App_Data/escuela_empresa.mdb"/>

    <table align="center" cellspacing="20">
        <tr><td>
        <asp:ListBox ID="ListEmpresas" runat="server"
             DataSourceID="selEmpresas"
             DataValueField="cod_empresa"
             DataTextField="empresa"
             AutoPostBack="true"
            />
        </td></tr>
        <tr><td>
        <asp:DropDownList ID="sector" runat="server"
             DataSourceID="selSectores"
             DataValueField="cod_sector"
             DataTextField ="nom_sector"
            />
        </td></tr>
        <tr><td>
        <asp:TextBox ID="direccion" runat="server"/>
        </td></tr>
        <tr><td>
        <asp:TextBox ID="telefono" runat="server"/>
        </td></tr>
        <tr><td>
        <asp:TextBox ID="email" runat="server"/>
        </td></tr>
    </table>
    </form>
</body>
</html>

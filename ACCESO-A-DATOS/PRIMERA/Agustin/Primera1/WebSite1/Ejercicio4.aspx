<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ejercicio4.aspx.cs" Inherits="imagenes_Ejercicio4" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>
<script runat="server">
    void Page_Load(Object objeto, EventArgs e)
    {
        OleDbConnection conexion;
        OleDbDataAdapter comando;
        DataTable dt;

        conexion = new OleDbConnection("Provider=MicroSoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath(@"escuela_empresa.mdb") + ";");
        comando = new OleDbDataAdapter("select * from empresas", conexion);
        dt = new DataTable();
        comando.Fill(dt);

        listEmpresas.DataSource = dt;
        DataBind(); //refresco de pantalla
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
        <asp:GridView ID="listEmpresas" runat="server"></asp:GridView>
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ejercicio4.aspx.cs" Inherits="Ejercicio4" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>El ejercicio de antes, pero con C#</title>
    <script runat="server">

        void Page_Load(Object o, EventArgs a)
        {
            OleDbConnection conexion;
            OleDbDataAdapter comando; // El capturador de datos
            DataTable daticos;


            conexion = new OleDbConnection("Provider=MicroSoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath(@"App_Data\escuela_empresa.mdb") + ";");
            comando = new OleDbDataAdapter("SELECT * FROM Empresas", conexion);
            daticos = new DataTable();
            comando.Fill(daticos);

            listica.DataSource = daticos;
            DataBind(); // ~~Refrescar la pantalla
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <asp:GridView runat="server" ID="listica" />
        </div>
    </form>
</body>
</html>

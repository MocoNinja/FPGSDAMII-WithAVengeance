﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ejercicio8.aspx.cs" Inherits="Ejercicio8" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>
<script runat="server">
    void Page_Load(Object sender, EventArgs e)
    {
        OleDbConnection conexion;
        OleDbDataAdapter adaptador;
        DataTable dt;

        conexion = new OleDbConnection("Provider=MicroSoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath(@"escuela_empresa.mdb") + ";");
        adaptador = new OleDbDataAdapter("select (max(cod_sector)+1) AS maximo from sectores", conexion);
        dt = new DataTable();
        adaptador.Fill(dt);

        codigoS.Text = dt.Rows[0]["maximo"].ToString();
    }

    private void insercion(Object objeto, EventArgs ev)
    {
        selSectores.Insert();
        Page_Load(null, null);
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
        <center>
        <asp:TextBox ID="codigoS" BorderWidth="0" Width="0" runat="server"></asp:TextBox>

        <asp:Label ID="Label1" runat="server" Text="Introduce sector : "></asp:Label>
        <asp:TextBox ID="nombreS" runat="server"></asp:TextBox>

        <asp:Button ID="Button1" runat="server" Text="Insertar" OnClick="insercion" />

        </center>
        <asp:AccessDataSource ID="selSectores" runat="server"
             DataFile="~/escuela_empresa.mdb"
             SelectCommand="select * from sectores order by nom_sector"    
             DeleteCommand="delete * from sectores where cod_sector=@cod_sector"
             UpdateCommand="update sectores set nom_sector=? where cod_sector=@cod_sector"
             InsertCommand="insert into sectores (cod_sector, nom_sector) values (@codigo, @n_sector)"
        >
            <InsertParameters>
                <asp:FormParameter Name="codigo" FormField="codigoS" />
                <asp:FormParameter Name="n_sector" FormField="nombreS" />
            </InsertParameters>
        </asp:AccessDataSource>
        <asp:GridView ID="GridView1" runat="server"
             DataSourceID="selSectores"
             AutoGenerateDeleteButton="true"
             AutoGenerateEditButton="true"
             DataKeyNames="cod_sector"
             AutoGenerateColumns="false"
             HorizontalAlign="Center"
             AlternatingRowStyle-BackColor="Gainsboro"
        >
            <Columns>
                <asp:BoundField DataField="nom_sector" HeaderText="Nom. Sector" />
            </Columns>
        </asp:GridView>



    </div>
    </form>
</body>
</html>
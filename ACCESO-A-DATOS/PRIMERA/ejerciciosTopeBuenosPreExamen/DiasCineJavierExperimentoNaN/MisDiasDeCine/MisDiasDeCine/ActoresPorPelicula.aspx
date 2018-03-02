<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActoresPorPelicula.aspx.cs" Inherits="MisDiasDeCine.ActoresPorPelicula" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="LasPelis" DataTextField="Nombre" DataValueField="Id">
        </asp:DropDownList>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SusActores">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                <asp:BoundField DataField="IdPais" HeaderText="IdPais" SortExpression="IdPais" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="LasPelis" runat="server" SelectMethod="SelectPeliculas" TypeName="MisDiasDeCine.PeliculaRepositorio"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="SusActores" runat="server" SelectMethod="GetActoresFrom" TypeName="MisDiasDeCine.PeliculaRepositorio">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="IdSeleccionado" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>

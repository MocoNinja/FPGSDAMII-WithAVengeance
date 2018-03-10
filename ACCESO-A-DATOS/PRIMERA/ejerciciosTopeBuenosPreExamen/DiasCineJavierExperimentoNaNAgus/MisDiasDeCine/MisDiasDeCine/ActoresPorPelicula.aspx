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
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="Movies" DataTextField="Nombre" DataValueField="Id">
        </asp:DropDownList>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LosActores">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                <asp:BoundField DataField="IdPais" HeaderText="IdPais" SortExpression="IdPais" />
            </Columns>
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="Actuaciones">
            <Fields>
                <asp:BoundField DataField="IdActor" HeaderText="IdActor" SortExpression="IdActor" />
                <asp:BoundField DataField="IdPelicula" HeaderText="IdPelicula" SortExpression="IdPelicula" />
                <asp:BoundField DataField="Sueldo" HeaderText="Sueldo" SortExpression="Sueldo" />
                <asp:BoundField DataField="NombrePersonaje" HeaderText="NombrePersonaje" SortExpression="NombrePersonaje" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="Movies" runat="server" SelectMethod="SelectPeliculas" TypeName="MisDiasDeCine.PeliculaRepositorio"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="Actuaciones" runat="server" DataObjectTypeName="MisDiasDeCine.Actuaciones" DeleteMethod="DeleteActuacion" InsertMethod="InsertarActuacion" SelectMethod="SelectActuaciones" TypeName="MisDiasDeCine.ActuacionesRepositorio" UpdateMethod="UpdateActuacion"></asp:ObjectDataSource>
    </form>
</body>
</html>

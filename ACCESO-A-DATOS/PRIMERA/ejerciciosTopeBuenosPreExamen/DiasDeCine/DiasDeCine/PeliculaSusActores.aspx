<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PeliculaSusActores.aspx.cs" Inherits="DiasDeCine.PeliculaSusActores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DropDownList ID="PeliSeleccionada" runat="server" AutoPostBack="True" DataSourceID="datosPeliculas" DataTextField="Titulo" DataValueField="ID" SelectValue="1">
        </asp:DropDownList>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="datosPeliActores" GridLines="Horizontal" DataKeyNames="PeliculaID,ActorID">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="PeliculaID" Visible="false" HeaderText="PeliculaID" SortExpression="PeliculaID" />
                <asp:TemplateField HeaderText="ActorID" SortExpression="ActorID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDown1" runat="server" Text='<%# Bind("ActorID") %>' DataSourceID="datosActores" DataTextField="Nombre" DataValueField="ID" Enabled="false"/>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDown1" runat="server" Text='<%# Bind("ActorID") %>' DataSourceID="datosActores" DataTextField="Nombre" DataValueField="ID" Enabled="False" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="nomPersonaje" HeaderText="nomPersonaje" SortExpression="nomPersonaje" />
                <asp:BoundField DataField="sueldo" HeaderText="sueldo" SortExpression="sueldo" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="datosPeliActores" DefaultMode="Insert" GridLines="Horizontal" Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <Fields>
                <asp:TemplateField HeaderText="PeliculaID" SortExpression="PeliculaID">
                    <InsertItemTemplate>
                        <asp:TextBox ID="PeliInsertar" runat="server" Text='<%# Bind("PeliculaID") %>'></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ActorID" SortExpression="ActorID">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ActorSeleccionado" runat="server" Text='<%# Bind("ActorID") %>' DataSourceID="datosActores" DataTextField="Nombre" DataValueField="ID"/>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="nomPersonaje"  HeaderText="nomPersonaje" SortExpression="nomPersonaje" />
                <asp:BoundField DataField="sueldo" HeaderText="sueldo" SortExpression="sueldo" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        </asp:DetailsView>
        <asp:ObjectDataSource ID="datosPeliActores" runat="server" DataObjectTypeName="DiasDeCine.PeliculaActor" DeleteMethod="eliminarPeliActor" InsertMethod="insertarPeliActor" SelectMethod="getPelActores" TypeName="DiasDeCine.PelActoresRepositorio" UpdateMethod="modificarPeliActor">
            <SelectParameters>
                <asp:FormParameter DefaultValue="1" FormField="PeliSeleccionada" Name="codPelicula" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="datosPeliculas" runat="server" SelectMethod="getPeliculas" TypeName="DiasDeCine.PeliculasRepositorio"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="DatosActores" runat="server" SelectMethod="getActores" TypeName="DiasDeCine.ActorRepositorio"></asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>

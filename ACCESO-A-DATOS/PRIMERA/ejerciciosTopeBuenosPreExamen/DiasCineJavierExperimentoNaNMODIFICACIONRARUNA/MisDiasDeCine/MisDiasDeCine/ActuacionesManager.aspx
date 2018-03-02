<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActuacionesManager.aspx.cs" Inherits="MisDiasDeCine.ActuacionesManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="Actuaciones" DataKeyNames="IdActor,IdPelicula">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="Actor" SortExpression="IdActor">
                     <EditItemTemplate>
                       <asp:DropDownList Text='<%# Bind("IdActor") %>' ID="DropDownList132" runat="server" DataSourceID="Actores" 
                            DataValueField="Id" DataTextField="Nombre"/>
                    </EditItemTemplate>
                    <ItemTemplate>
                          <asp:DropDownList Text='<%# Bind("IdActor") %>' ID="DropDownList313" runat="server" DataSourceID="Actores" 
                            DataValueField="Id" DataTextField="Nombre" Enabled="false"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Película" SortExpression="IdPelicula">
                    <EditItemTemplate>
                       <asp:DropDownList Text='<%# Bind("IdPelicula") %>' ID="DropDownList414" runat="server" DataSourceID="Peliculas" 
                            DataValueField="Id" DataTextField="Nombre" />
                    </EditItemTemplate>
                    <ItemTemplate>
                          <asp:DropDownList Text='<%# Bind("IdPelicula") %>' ID="DropDownList515" runat="server" DataSourceID="Peliculas" 
                            DataValueField="Id" DataTextField="Nombre" Enabled="false"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Sueldo" HeaderText="Sueldo" SortExpression="Sueldo" />
                <asp:BoundField DataField="NombrePersonaje" HeaderText="NombrePersonaje" SortExpression="NombrePersonaje" />
            </Columns>
        </asp:GridView>
        <div>
        </div>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="Actuaciones" Height="50px" Width="125px" DefaultMode="Insert">
            <Fields>
                <asp:TemplateField HeaderText="Actor" SortExpression="IdActor">
                     <InsertItemTemplate>
                       <asp:DropDownList Text='<%# Bind("IdActor") %>' ID="DropDownList12" runat="server" DataSourceID="Actores" 
                            DataValueField="Id" DataTextField="Nombre" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                          <asp:DropDownList Text='<%# Bind("IdActor") %>' ID="DropDownList13" runat="server" DataSourceID="Actores" 
                            DataValueField="Id" DataTextField="Nombre" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Película" SortExpression="IdPelicula">
                    <InsertItemTemplate>
                       <asp:DropDownList Text='<%# Bind("IdPelicula") %>' ID="DropDownList14" runat="server" DataSourceID="Peliculas" 
                            DataValueField="Id" DataTextField="Nombre" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                          <asp:DropDownList Text='<%# Bind("IdPelicula") %>' ID="DropDownList15" runat="server" DataSourceID="Peliculas" 
                            DataValueField="Id" DataTextField="Nombre" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Sueldo" HeaderText="Sueldo" SortExpression="Sueldo" />
                <asp:BoundField DataField="NombrePersonaje" HeaderText="NombrePersonaje" SortExpression="NombrePersonaje" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="Actores" runat="server" SelectMethod="SelectActores" TypeName="MisDiasDeCine.ActorRepositorio"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="Peliculas" runat="server" SelectMethod="SelectPeliculas" TypeName="MisDiasDeCine.PeliculaRepositorio"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="Actuaciones" runat="server" DataObjectTypeName="MisDiasDeCine.Actuaciones" InsertMethod="InsertarActuacion" SelectMethod="SelectActuaciones" TypeName="MisDiasDeCine.ActuacionesRepositorio" DeleteMethod="DeleteActuacion" UpdateMethod="UpdateActuacion"></asp:ObjectDataSource>
    </form>
</body>
</html>

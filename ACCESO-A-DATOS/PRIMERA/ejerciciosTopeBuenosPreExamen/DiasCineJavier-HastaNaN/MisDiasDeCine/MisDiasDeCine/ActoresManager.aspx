<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActoresManager.aspx.cs" Inherits="MisDiasDeCine.Actores" %>

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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            DataSourceID="DatosActor" DataKeyNames="Id">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="false" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                <asp:TemplateField HeaderText="Pais" SortExpression="IdPais">
                    <EditItemTemplate>
                       <asp:DropDownList runat="server" ID="adad" DataSourceID="DatosPais" 
                            DataTextField="Nombre" DataValueField="Id" Text='<%# Bind("IdPais") %>'/>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList runat="server" ID="adad" DataSourceID="DatosPais" 
                            DataTextField="Nombre" DataValueField="Id" Text='<%# Bind("IdPais") %>' Enabled="false"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataSourceID="DatosActor" Height="50px" Width="125px" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="false"/>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                <asp:TemplateField HeaderText="Pais" SortExpression="IdPais">
                    <InsertItemTemplate>
                       <asp:DropDownList runat="server" ID="adad" DataSourceID="DatosPais" 
                            DataTextField="Nombre" DataValueField="Id" Text='<%# Bind("IdPais") %>'/>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList runat="server" ID="adad" DataSourceID="DatosPais" 
                            DataTextField="Nombre" DataValueField="Id" Text='<%# Bind("IdPais") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="DatosActor" runat="server" DataObjectTypeName="MisDiasDeCine.Actor" DeleteMethod="DeleteActor" InsertMethod="InsertActor" SelectMethod="SelectActores" TypeName="MisDiasDeCine.ActorRepositorio" UpdateMethod="UpdateActor"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="DatosPais" runat="server" SelectMethod="SelectPaises" TypeName="MisDiasDeCine.PaisRepositoio"></asp:ObjectDataSource>
    </form>
</body>
</html>

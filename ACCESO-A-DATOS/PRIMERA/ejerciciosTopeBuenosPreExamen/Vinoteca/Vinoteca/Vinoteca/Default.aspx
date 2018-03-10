<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Vinoteca.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <th>Vinos</th>
                <th>Bodegas</th>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="VinosGV" runat="server" AutoGenerateColumns="False" DataSourceID="DatosVinos" DataKeyNames="Id">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="false"/>
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                            <asp:TemplateField HeaderText="IdBodega" SortExpression="IdBodega">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="LaBodega" runat="server" Text='<%# Bind("IdBodega") %>'
                                        DataSourceID="DatosBodegas" DataValueField="Id" DataTextField="Nombre"/>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="LaBodega" runat="server" Text='<%# Bind("IdBodega") %>'
                                        DataSourceID="DatosBodegas" DataValueField="Id" DataTextField="Nombre" Enabled="false"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
                <td>
                    <asp:GridView ID="BodegasGV" runat="server" AutoGenerateColumns="False" DataSourceID="DatosBodegas" DataKeyNames="Id">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="false"/>
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <th>Vinos: Nuevo</th>
                <th>Bodegas: Nuevo</th>
            </tr>
            <tr>
                <td>
                    <asp:DetailsView ID="VinosDV" runat="server" AutoGenerateRows="False" DataSourceID="DatosVinos" Height="50px" Width="125px" DefaultMode="Insert">
                        <Fields>
                            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="false"/>
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                            <asp:TemplateField HeaderText="IdBodega" SortExpression="IdBodega">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="LaBodega" runat="server" Text='<%# Bind("IdBodega") %>' DataSourceID="DatosBodegas" DataValueField="Id" DataTextField="Nombre"/>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="LaBodega" runat="server" Text='<%# Bind("IdBodega") %>' DataSourceID="DatosBodegas" DataValueField="Id" DataTextField="Nombre"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" />
                        </Fields>
                    </asp:DetailsView>
                </td>
                <td>
                    <asp:DetailsView ID="BodegasDV" runat="server" AutoGenerateRows="False" DataSourceID="DatosBodegas" Height="50px" Width="125px" DefaultMode="Insert">
                        <Fields>
                            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="false"/>
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                            <asp:CommandField ShowInsertButton="True" />
                        </Fields>
                    </asp:DetailsView>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="DatosVinos" runat="server" DataObjectTypeName="Vinoteca.Vino" DeleteMethod="DeleteVino" InsertMethod="InsertVino" SelectMethod="SelectVinos" TypeName="Vinoteca.VinoRepositorio" UpdateMethod="UpdateVino"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="DatosBodegas" runat="server" DataObjectTypeName="Vinoteca.Bodega" DeleteMethod="DeleteBodega" InsertMethod="InsertBodega" SelectMethod="SelectBodegas" TypeName="Vinoteca.BodegaRepositorio" UpdateMethod="UpdateBodega"></asp:ObjectDataSource>
    </form>
</body>
</html>

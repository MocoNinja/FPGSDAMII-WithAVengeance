<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Bodegon.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 125px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <th>Ver Vinos</th>
                <th class="auto-style1">Ver Bodegas</th>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="VinosGV" runat="server" AutoGenerateColumns="False" DataSourceID="DatosVinos">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="IdWinery" HeaderText="IdWinery" SortExpression="IdWinery" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td class="auto-style1">
                    <asp:GridView ID="BodegasGV" runat="server" AutoGenerateColumns="False" DataSourceID="DatosBodegas">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <th>Añadir Vinos</th>
                <th class="auto-style1">Añadir Bodegas</th>
            </tr>
            <tr>
                <td>
                    <asp:DetailsView ID="VinosDV" runat="server" AutoGenerateRows="False" DataSourceID="DatosVinos" Height="50px" Width="125px" DefaultMode="Insert">
                        <Fields>
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" SortExpression="Id" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="IdWinery" HeaderText="IdWinery" SortExpression="IdWinery" />
                            <asp:CommandField ShowInsertButton="True" />
                        </Fields>
                    </asp:DetailsView>
                </td>
                <td class="auto-style1">
                    <asp:DetailsView ID="BodegasDV" runat="server" AutoGenerateRows="False" DataSourceID="DatosBodegas" Height="50px" Width="125px" DefaultMode="Insert">
                        <Fields>
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" SortExpression="Id" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:CommandField ShowInsertButton="True" />
                        </Fields>
                    </asp:DetailsView>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="DatosVinos" runat="server" DataObjectTypeName="Bodegon.Wine" InsertMethod="InsertWine" SelectMethod="SelectWines" TypeName="Bodegon.DataRepository" DeleteMethod="DeleteWine"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="DatosBodegas" runat="server" DataObjectTypeName="Bodegon.Winery" InsertMethod="InsertWinery" SelectMethod="SelectWinery" TypeName="Bodegon.DataRepository"></asp:ObjectDataSource>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BodegasManager.aspx.cs" Inherits="Vinoteca.BodegasManager" %>

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
        <asp:GridView ID="GVBodegas" runat="server" AutoGenerateColumns="False"
            DataSourceID="DatosBodegas" DataKeyNames="Id">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="false"/>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            </Columns>
        </asp:GridView>
        <asp:DetailsView ID="DVBodegas" runat="server" 
            AutoGenerateRows="False" DataSourceID="DatosBodegas" 
            Height="50px" Width="125px"
            DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="false" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="DatosBodegas" runat="server" DataObjectTypeName="Vinoteca.Bodega" DeleteMethod="DeleteBodega" InsertMethod="InsertBodega" SelectMethod="SelectBodegas" TypeName="Vinoteca.BodegaRepositorio" UpdateMethod="UpdateBodega"></asp:ObjectDataSource>
    </form>
</body>
</html>

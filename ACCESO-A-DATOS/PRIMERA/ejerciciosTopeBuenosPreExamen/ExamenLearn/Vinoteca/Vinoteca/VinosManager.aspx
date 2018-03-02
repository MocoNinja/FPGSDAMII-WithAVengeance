<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VinosManager.aspx.cs" Inherits="Vinoteca.VinosManager" %>

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
        <asp:GridView ID="GVVinos" runat="server" AutoGenerateColumns="False"
            DataSourceID="DatosVinos" DataKeyNames="Id">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="false"/>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:TemplateField HeaderText="IdBodega" SortExpression="IdBodega">
                    <EditItemTemplate>
                        <asp:DropDownList Text='<%# Bind("IdBodega") %>' 
                            ID="DropDownList2" runat="server" DataSourceID="DatosBodegas" 
                            DataValueField="Id" DataTextField="Nombre"></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList Text='<%# Bind("IdBodega") %>' 
                            ID="DropDownList1" runat="server" DataSourceID="DatosBodegas" 
                            DataValueField="Id" DataTextField="Nombre" Enabled="false"></asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
            </Columns>
        </asp:GridView>
        <asp:DetailsView ID="DVVinos" runat="server" AutoGenerateRows="False" 
            DataSourceID="DatosVinos" Height="50px" Width="125px" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
                <asp:BoundField DataField="IdBodega" HeaderText="IdBodega" SortExpression="IdBodega" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="DatosVinos" runat="server" DataObjectTypeName="Vinoteca.Vino" DeleteMethod="DeleteVino" InsertMethod="InsertVino" SelectMethod="SelectVinos" TypeName="Vinoteca.VinoRepositorio" UpdateMethod="UpdateVino"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="DatosBodegas" runat="server" DataObjectTypeName="Vinoteca.Bodega" DeleteMethod="DeleteBodega" InsertMethod="InsertBodega" SelectMethod="SelectBodegas" TypeName="Vinoteca.BodegaRepositorio" UpdateMethod="UpdateBodega"></asp:ObjectDataSource>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecetasApp.aspx.cs" Inherits="ExamenJGT.RecetasApp" %>

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
        <asp:DropDownList ID="RecetasDD" runat="server" AutoPostBack="True" DataSourceID="ListaRecetas" DataTextField="Nom_Receta" DataValueField="Id">
        </asp:DropDownList>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            DataSourceID="DatosIntermedia" DataKeyNames="IdReceta,IdProducto">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="IdProducto" SortExpression="IdProducto">
                    <EditItemTemplate>
                        <asp:DropDownList Text='<%# Bind("IdProducto") %>' ID="DropDownList22" runat="server" Enabled="false" DataSourceID="ListaProductos" DataValueField="Id" DataTextField="Nom_Producto" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList Text='<%# Bind("IdProducto") %>' ID="DropDownList21" runat="server" Enabled="false" DataSourceID="ListaProductos" DataValueField="Id" DataTextField="Nom_Producto" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
                <asp:TemplateField HeaderText="MedidaId" SortExpression="MedidaId">
                    <EditItemTemplate>
                       <asp:DropDownList Text='<%# Bind("MedidaId") %>' ID="DropDownList11" runat="server" DataSourceID="ListaMedidas" DataValueField="Id" DataTextField="TipoMedida" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList Text='<%# Bind("MedidaId") %>' ID="DropDownList12" runat="server" Enabled="false" DataSourceID="ListaMedidas" DataValueField="Id" DataTextField="TipoMedida" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <p>Meter los decimales con . !!!</p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataSourceID="DatosIntermedia" Height="50px" Width="125px" DefaultMode="Insert">
            <Fields>
                <asp:TemplateField HeaderText="IdReceta" SortExpression="IdReceta">
                    <InsertItemTemplate>
                        <asp:TextBox ID="Insertator" runat="server" Text='<%# Bind("IdReceta") %>' Enabled="false"></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="IdProducto" SortExpression="IdProducto">
                    <InsertItemTemplate>
                        <asp:DropDownList Text='<%# Bind("IdProducto") %>' ID="DropDownList2" runat="server" DataSourceID="ListaProductos" DataValueField="Id" DataTextField="Nom_Producto" />
                    </InsertItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" />
                <asp:TemplateField HeaderText="MedidaId" SortExpression="MedidaId">
                    <InsertItemTemplate>
                        <asp:DropDownList Text='<%# Bind("MedidaId") %>' ID="DropDownList1" runat="server" DataSourceID="ListaMedidas" DataValueField="Id" DataTextField="TipoMedida" />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="ListaRecetas" runat="server" SelectMethod="SelectRecetas" TypeName="ExamenJGT.RecetasRepositorio"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ListaMedidas" runat="server" SelectMethod="SelectMedidas" TypeName="ExamenJGT.MedidaRepositorio"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ListaProductos" runat="server" SelectMethod="SelectProductos" TypeName="ExamenJGT.ProductoRepositorio"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="DatosIntermedia" runat="server" DataObjectTypeName="ExamenJGT.Receta_Productos" DeleteMethod="DeleteReceta_Productos" InsertMethod="InsertReceta_Productos" SelectMethod="SelectRecetaProductosFromReceta" TypeName="ExamenJGT.Receta_ProductosRepositorio" UpdateMethod="UpdateReceta_Productos">
            <SelectParameters>
                <asp:ControlParameter ControlID="RecetasDD" Name="IdInsertada" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>

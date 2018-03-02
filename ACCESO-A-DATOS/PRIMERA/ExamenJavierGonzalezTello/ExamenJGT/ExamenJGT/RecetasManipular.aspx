<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecetasManipular.aspx.cs" Inherits="ExamenJGT.RecetasManipular" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <a href="Default.aspx">Volver al índice...</a>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="DatosRecetas" DataKeyNames="Id">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="false"/>
                <asp:BoundField DataField="Nom_Receta" HeaderText="Receta" SortExpression="Nom_Receta" />
                <asp:BoundField DataField="Comentarios" HeaderText="Comentarios" SortExpression="Comentarios" />
                <asp:TemplateField HeaderText="Foto" SortExpression="Foto">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Foto") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <img src="./<%# Eval("Foto") %>" width="50px" height="50px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br /> <br />
        
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataSourceID="DatosRecetas" Height="50px" Width="125px" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="false"/>
                <asp:BoundField DataField="Nom_Receta" HeaderText="Nombre" SortExpression="Nom_Receta" />
                <asp:BoundField DataField="Comentarios" HeaderText="Comentarios" SortExpression="Comentarios" />
                <asp:BoundField DataField="Foto" HeaderText="Ruta Foto" SortExpression="Foto" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="DatosRecetas" runat="server" DataObjectTypeName="ExamenJGT.Receta" DeleteMethod="DeleteReceta" InsertMethod="InsertReceta" SelectMethod="SelectRecetas" TypeName="ExamenJGT.RecetasRepositorio" UpdateMethod="UpdateReceta"></asp:ObjectDataSource>
    </form>
</body>
</html>

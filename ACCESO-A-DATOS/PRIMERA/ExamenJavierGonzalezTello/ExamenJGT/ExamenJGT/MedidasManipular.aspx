<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedidasManipular.aspx.cs" Inherits="ExamenJGT.MedidasManipular" %>

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
            DataSourceID="DatosMedidas" DataKeyNames="Id">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="false"/>
                <asp:BoundField DataField="TipoMedida" HeaderText="TipoMedida" SortExpression="TipoMedida" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"
            DataSourceID="DatosMedidas" Height="50px" Width="125px" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="false"/>
                <asp:BoundField DataField="TipoMedida" HeaderText="TipoMedida" SortExpression="TipoMedida" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="DatosMedidas" runat="server" DataObjectTypeName="ExamenJGT.Medida" DeleteMethod="DeleteMedida" InsertMethod="InsertMedida" SelectMethod="SelectMedidas" TypeName="ExamenJGT.MedidaRepositorio" UpdateMethod="UpdateMedida"></asp:ObjectDataSource>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaisManager.aspx.cs" Inherits="MisDiasDeCine.ActorManager" %>

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
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False" DataSourceID="DatosPais" DataKeyNames="Id">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="false"/>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            </Columns>
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataSourceID="DatosPais" Height="50px" Width="125px" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="false" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="DatosPais" runat="server" DataObjectTypeName="MisDiasDeCine.Pais" DeleteMethod="DeletePais" InsertMethod="InsertPais" SelectMethod="SelectPaises" TypeName="MisDiasDeCine.PaisRepositoio" UpdateMethod="UpdatePais"></asp:ObjectDataSource>
    </form>
</body>
</html>

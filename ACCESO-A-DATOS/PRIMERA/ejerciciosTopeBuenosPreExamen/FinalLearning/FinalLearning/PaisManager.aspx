<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaisManager.aspx.cs" Inherits="FinalLearning.PaisManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataSourceID="DatosPaises" DataKeyNames="Id">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="false"/>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataSourceID="DatosPaises" Height="50px" Width="125px" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="false"/>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="DatosPaises" runat="server" DataObjectTypeName="FinalLearning.Pais" DeleteMethod="DeletePais" InsertMethod="InsertPais" SelectMethod="SelectPaises" TypeName="FinalLearning.PaisRepositorio" UpdateMethod="UpdatePais"></asp:ObjectDataSource>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="_01SinCodigo2.WebForm1" %>

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
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=DibujosAnimadosPrueba1Entities" 
            DefaultContainerName="DibujosAnimadosPrueba1Entities" EnableFlattening="False" EntitySetName="Series" 
            EntityTypeFilter="Series" Select="it.[nombre], it.[claseID], it.[IDSerie]">
        </asp:EntityDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="EntityDataSource1">
            <Columns>
                <asp:BoundField DataField="nombre" HeaderText="nombre" ReadOnly="True" SortExpression="nombre" />
                <asp:BoundField DataField="claseID" HeaderText="claseID" ReadOnly="True" SortExpression="claseID" />
                <asp:BoundField DataField="IDSerie" HeaderText="IDSerie" ReadOnly="True" SortExpression="IDSerie" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>

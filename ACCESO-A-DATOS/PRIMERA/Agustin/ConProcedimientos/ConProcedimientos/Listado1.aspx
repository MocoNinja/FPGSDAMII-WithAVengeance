<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado1.aspx.cs" Inherits="ConProcedimientos.Listado1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="Datos" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="true" />
                <asp:BoundField DataField="Nombre_Propio" HeaderText="Nombre" SortExpression="Nombre_Propio" />
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                <asp:BoundField DataField="Genero" HeaderText="Género" SortExpression="Genero" />
                <asp:BoundField DataField="Edad" HeaderText="Edad" SortExpression="Edad" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" CellPadding="4" DataSourceID="Datos" DefaultMode="Insert" ForeColor="#333333" GridLines="None" AutoGenerateRows="false">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="ID" InsertVisible="false" HeaderText="ID" ReadOnly="true" />
                <asp:BoundField DataField="Nombre_Propio" HeaderText="Nombre" SortExpression="Nombre_Propio" />
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                <asp:BoundField DataField="Genero" HeaderText="Género" SortExpression="Genero" />
                <asp:BoundField DataField="Edad" HeaderText="Edad" SortExpression="Edad" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:EntityDataSource Select="*" ID="Datos" runat="server" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntitySetName="tblAlumnos" ConnectionString="name=AlumnoDBContext" DefaultContainerName="AlumnoDBContext">
        </asp:EntityDataSource>
    </div>
    </form>
</body>
</html>

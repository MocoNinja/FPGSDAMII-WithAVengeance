<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ProceduresReal.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
                ConnectionString="name=ColegioProceduresEntities" 
                DefaultContainerName="ColegioProceduresEntities" 
                EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
                EntitySetName="Alumnos" EntityTypeFilter="Alumnos" 
                >
            </asp:EntityDataSource>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idAlumno" 
            DataSourceID="EntityDataSource1">
            <Columns>
                <asp:BoundField DataField="idAlumno" HeaderText="idAlumno" ReadOnly="True" SortExpression="idAlumno" />
                <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                <asp:BoundField DataField="apellidos" HeaderText="apellidos" SortExpression="apellidos" />
                <asp:BoundField DataField="genero" HeaderText="genero" SortExpression="genero" />
                <asp:BoundField DataField="edad" HeaderText="edad" SortExpression="edad" />
                <asp:BoundField DataField="claseID" HeaderText="claseID" SortExpression="claseID" />
            </Columns>
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="idAlumno" DataSourceID="EntityDataSource1" DefaultMode="Insert" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                <asp:BoundField DataField="apellidos" HeaderText="apellidos" SortExpression="apellidos" />
                <asp:BoundField DataField="genero" HeaderText="genero" SortExpression="genero" />
                <asp:BoundField DataField="edad" HeaderText="edad" SortExpression="edad" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="culo.aspx.cs" Inherits="ProcedimientosC0d3r.culo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AlumnoID" DataSourceID="ObjectDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="AlumnoID" HeaderText="AlumnoID" SortExpression="AlumnoID" />
                <asp:BoundField DataField="Edad" HeaderText="Edad" SortExpression="Edad" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                <asp:BoundField DataField="Genero" HeaderText="Genero" SortExpression="Genero" />
            </Columns>
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="ObjectDataSource1" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="AlumnoID" HeaderText="AlumnoID" SortExpression="AlumnoID" Visible="False" />
                <asp:BoundField DataField="Edad" HeaderText="Edad" SortExpression="Edad" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                <asp:BoundField DataField="Genero" HeaderText="Genero" SortExpression="Genero" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>


        <asp:ObjectDataSource ID="ObjectDataSource1" 
            runat="server" 
            DataObjectTypeName="ProcedimientosC0d3r.Alumno" 
            DeleteMethod="BorrarAlumno" 
            InsertMethod="InsertarAlumno" 
            SelectMethod="GetAlumnos" 
            TypeName="ProcedimientosC0d3r.AlumnoRepositoio" 
            UpdateMethod="ActualizarAlumno">
        </asp:ObjectDataSource>
    </form>
</body>
</html>

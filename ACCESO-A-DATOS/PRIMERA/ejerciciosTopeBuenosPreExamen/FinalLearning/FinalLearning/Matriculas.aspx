<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Matriculas.aspx.cs" Inherits="FinalLearning.Matriculas1" %>

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
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="DatosClases" DataTextField="Nombre" DataValueField="Id">
        </asp:DropDownList>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LasMatriculas" DataKeyNames="IdClase,IdAlumno">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="IdAlumno" HeaderText="IdAlumno" SortExpression="IdAlumno" />
                <asp:BoundField DataField="IdClase" HeaderText="IdClase" SortExpression="IdClase" />
                <asp:BoundField DataField="Calificacion" HeaderText="Calificacion" SortExpression="Calificacion" />
            </Columns>
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="LasMatriculas" Height="50px" Width="125px" DefaultMode="Insert">
            <Fields>
                <asp:TemplateField HeaderText="IdClase" SortExpression="IdClase">
                    <InsertItemTemplate>
                        <asp:TextBox ID="textitooo" runat="server" Text='<%# Bind("IdClase") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList Text='<%# Bind("IdClase") %>' ID="DropDownList5" runat="server" DataSourceID="DatosClases" DataValueField="Id" DataTextField="Nombre" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="IdAlumno" SortExpression="IdAlumno">
                    <InsertItemTemplate>
                        <asp:DropDownList Text='<%# Bind("IdAlumno") %>' ID="DropDownList2" runat="server" DataSourceID="DatosAlumnos" DataValueField="Id" DataTextField="Nombre" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList Text='<%# Bind("IdAlumno") %>' ID="DropDownList3" runat="server" DataSourceID="DatosAlumnos" DataValueField="Id" DataTextField="Nombre" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Calificacion" HeaderText="Calificacion" SortExpression="Calificacion" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="DatosClases" runat="server" SelectMethod="SelectClases" TypeName="FinalLearning.ClaseRepositorio"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="DatosAlumnos" runat="server" SelectMethod="SelectAlumnos" TypeName="FinalLearning.AlumnoRepositorio"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="LasMatriculas" runat="server" DataObjectTypeName="FinalLearning.Matriculas" DeleteMethod="DeleteMatricula" InsertMethod="InsertMatricula" SelectMethod="GetMatriculasFromClase" TypeName="FinalLearning.MatriculasRepositorio" UpdateMethod="UpdateMatricula">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="IdClaseInput" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>

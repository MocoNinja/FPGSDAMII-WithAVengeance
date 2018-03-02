<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlumnoManager.aspx.cs" Inherits="FinalLearning.AlumnoManager" %>

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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            DataSourceID="DatosAlumnos" DataKeyNames="Id">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="false"/>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                <asp:TemplateField HeaderText="Pais" SortExpression="IdPais">
                    <EditItemTemplate>
                        <asp:DropDownList Text='<%# Bind("IdPais") %>' ID="DropDownList1" runat="server" DataSourceID="DatosPais" 
                            DataValueField="Id" DataTextField="Nombre" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList Text='<%# Bind("IdPais") %>' ID="DropDownList1" runat="server" DataSourceID="DatosPais" 
                            DataValueField="Id" DataTextField="Nombre" Enabled="false"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="DatosAlumnos"
            Height="50px" Width="125px" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="false"/>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                <asp:TemplateField HeaderText="Pais" SortExpression="IdPais">
                    <InsertItemTemplate>
                        <asp:DropDownList Text='<%# Bind("IdPais") %>' ID="DropDownList1" runat="server" DataSourceID="DatosPais" 
                            DataValueField="Id" DataTextField="Nombre" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList Text='<%# Bind("IdPais") %>' ID="DropDownList1" runat="server" DataSourceID="DatosPais" 
                            DataValueField="Id" DataTextField="Nombre" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="DatosAlumnos" runat="server" DataObjectTypeName="FinalLearning.Alumno" DeleteMethod="DeleteAlumno" InsertMethod="InsertAlumno" SelectMethod="SelectAlumnos" TypeName="FinalLearning.AlumnoRepositorio" UpdateMethod="UpdateAlumno"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="DatosPais" runat="server" SelectMethod="SelectPaises" TypeName="FinalLearning.PaisRepositorio"></asp:ObjectDataSource>
    </form>
</body>
</html>

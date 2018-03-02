<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ejercicio5.aspx.cs" Inherits="Ejercicio5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:AccessDataSource ID="selCiudades" runat="server"
             DataFile="~/escuela_empresa.mdb"
             SelectCommand="select * from Locals"    
        />

        <asp:AccessDataSource ID="selAlumnos" runat="server"
             DataFile="~/escuela_empresa.mdb"
             SelectCommand="select * from Alunos" 
             FilterExpression ="cod_cidade='{0}'"
        >
            <FilterParameters>
                <asp:ControlParameter ControlID="desCiudades" PropertyName="SelectedValue" />
            </FilterParameters>
        </asp:AccessDataSource>


        <asp:DropDownList ID="desCiudades" runat="server"
            DataSourceID ="selCiudades"
            DataValueField="cod_local"
            DataTextField="nom_local"
            AutoPostBack="true"
        />

        <asp:GridView ID="GridView1" runat="server"
             DataSourceID="selAlumnos"
             AutoGenerateColumns="false"
        >
            <Columns>
                <asp:BoundField DataField="nome" HeaderText="Nombre" />
                <asp:BoundField DataField="cod_cidade" HeaderText="Ciudad" />
            </Columns>
        </asp:GridView>

    </div>
    </form>
</body>
</html>

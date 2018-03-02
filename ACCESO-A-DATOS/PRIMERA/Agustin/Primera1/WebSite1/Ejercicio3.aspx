<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ejercicio3.aspx.cs" Inherits="Ejercicio3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:AccessDataSource ID="selAlumnos" runat="server"
        DataFile="escuela_empresa.mdb"
        DataSourceMode="DataReader"    
        SelectCommand ="select * from Alunos"
    />

        <asp:GridView ID="GridView1" runat="server"
             DataSourceID ="selAlumnos"    
             AutoGenerateColumns="false"
             AlternatingRowStyle-BackColor="Gainsboro"
             HorizontalAlign="Center"
        >
            <Columns>
                <asp:BoundField DataField="Nome" HeaderText="Nombre"/>
                <asp:ImageField DataImageUrlField="foto" HeaderText="Foto"
                    DataImageUrlFormatString="imagenes/{0}" 
                     ControlStyle-Height="100px"/>
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>

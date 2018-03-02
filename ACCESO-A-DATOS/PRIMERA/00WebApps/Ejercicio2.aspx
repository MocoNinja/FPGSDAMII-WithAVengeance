<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ejercicio2.aspx.cs" Inherits="Ejercicio2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Accediendo a una base de datos</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <!-- 
            DataSourceMode: En este caso solo lectura, si no se pone nada, es ambas;
            SelectCommand: Sentencia SQL de select
         -->
        <asp:AccessDataSource ID="selAlumnos" runat="server" 
            DataFile="App_Data/escuela_empresa.mdb"
            DataSourceMode="DataReader"
            SelectCommand="SELECT * FROM Alunos"
        />

        <!--
            AutoGenerateColumns: por defecto esta a true y mete todo
        -->

        <asp:GridView ID="verAlumnos" runat="server" 
            DataSourceID="selAlumnos"
            AutoGenerateColumns="false"
            BackColor="MediumPurple"
            AlternatingRowStyle-BackColor="Tomato"
            AlternatingRowStyle-Font-Italic="true"  
        >
            <Columns>
                <asp:BoundField DataField="num_hijos" HeaderText="Hijos"/>
                <asp:BoundField DataField="Nome" HeaderText="Nombre"/>
                <asp:BoundField DataField="foto" HeaderText="Nombre"/>
                <asp:ImageField DataImageUrlField="foto" DataImageUrlFormatString="foticos/{0}.png" ControlStyle-Height="100px" HeaderText="foto"/>

            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>

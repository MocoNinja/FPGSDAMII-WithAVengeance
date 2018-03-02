<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ejercicio5.aspx.cs" Inherits="Ejercicio5" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Ejercicio 5</title>
</head>
<body>
	<form id="form1" runat="server">
		<div>

			<!-- Fuente de datos -->
			<!-- Aquí la raíz del servidor no es ../ sino ~ -->
			<asp:AccessDataSource ID="selLocals" runat="server"
				DataFile="App_Data/escuela_empresa.mdb"
				DataSourceMode="DataReader"
				SelectCommand="SELECT cod_local, nom_local FROM Locals" />

			<!-- Ver el juego: el '{0}' es el primer elemento de un vector -->
			<!-- Aquí vamos a meter más objetos para interactuar con los otros -> FilterParameters -->
			<!-- Esto es un vector -> El primer elemento que pongamos será el {0} -->

			<asp:AccessDataSource ID="selAlunos" runat="server"
				DataFile="App_Data/escuela_empresa.mdb"
				SelectCommand="SELECT * FROM Alunos"
				FilterExpression="cod_cidade='{0}'">



				<FilterParameters>
					<asp:ControlParameter ControlID="locals" PropertyName="SelectedValue" />
				</FilterParameters>

			</asp:AccessDataSource>

			<!-- Selector de ciudades -->

			<asp:DropDownList ID="locals" runat="server"
				DataSourceID="selLocals"
				DataValueField="cod_local"
				DataTextField="nom_local"
				AutoPostBack="true" />

			<!-- Aquí se cargarán automáticamente los alumnos de la ciudad seleccionada -->

			<asp:GridView ID="lisAlumnos" runat="server"
				DataSourceID="selAlunos"
				DataSourceMode="DataReader"
				AutoGenerateColumns="false"
				BackColor="MediumPurple"
				AlternatingRowStyle-BackColor="Tomato"
				AlternatingRowStyle-Font-Italic="true">

				<Columns>
					<asp:BoundField DataField="num_hijos" HeaderText="Hijos" />
					<asp:BoundField DataField="Nome" HeaderText="Nombre" />
					<asp:BoundField DataField="cod_cidade" HeaderText="Ciudá" />
					<asp:ImageField DataImageUrlField="foto"
						DataImageUrlFormatString="foticos/{0}.png"
						ControlStyle-Height="100px"
						HeaderText="foto" />
				</Columns>

			</asp:GridView>

		</div>
	</form>

</body>
</html>

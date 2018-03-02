<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ejercicio6.aspx.cs" Inherits="Ejercicio6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Seleccionar empresas por sector</title>
</head>
<body>

	<asp:AccessDataSource ID="conSectores" runat="server"
		DataFile="App_Data/escuela_empresa.mdb"
		DataSourceMode="DataReader"
		SelectCommand="SELECT cod_sector, nom_sector FROM Sectores" />

	<asp:AccessDataSource ID="conEmpresas" runat="server"
		DataFile="App_Data/escuela_empresa.mdb"
		SelectCommand="SELECT * FROM Empresas"
		FilterExpression="Sector='{0}'">

		<FilterParameters>
			<asp:ControlParameter ControlID="listaSectores" PropertyName="SelectedValue" />
		</FilterParameters>

	</asp:AccessDataSource>

	<form id="form1" runat="server">
		<div>
			<asp:DropDownList ID="listaSectores" runat="server"
				DataSourceID="conSectores"
				DataValueField="cod_sector"
				DataTextField="nom_sector"
				AutoPostBack="true" />

			<asp:GridView ID="listaEmpresas" runat="server"
				DataSourceID="conEmpresas"
				DataSourceMode="DataReader"
				AutoGenerateColumns="true"
				BackColor="MediumPurple"
				AlternatingRowStyle-BackColor="Tomato"
				AlternatingRowStyle-Font-Italic="true">
			</asp:GridView>
		</div>
	</form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ejercicio7.aspx.cs" Inherits="Ejercicio7" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>

<script runat="server">

	void Page_Load(Object o, EventArgs e)
	{
		OleDbConnection conexion;
		OleDbDataAdapter adaptador; // El capturador de datos
		DataTable dt = new DataTable();

		conexion = new OleDbConnection("Provider=MicroSoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath(@"App_Data\escuela_empresa.mdb") + ";");

		String codigoEmpresa = listEmpresas.SelectedValue; // La primera vez que se entra a la pagina no hay valor seleccionado

		if (codigoEmpresa != "")
		{
			adaptador = new OleDbDataAdapter("SELECT * FROM Empresas WHERE cod_empresa=" + codigoEmpresa, conexion);
			adaptador.Fill(dt);

			direccion.Text = dt.Rows[0]["endereço"].ToString();
			telefono.Text = dt.Rows[0]["telefone"].ToString();
			emilio.Text = dt.Rows[0]["e_mail"].ToString();

			listSectores.SelectedValue = dt.Rows[0]["sector"].ToString(); // Ojo, que no es un ñapón!!

			DataBind(); // Refrescar la pantalla
			}
	}

</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Un poquico de C#</title>
	<!--
		Tenemos una lista de empresas
		Sale un selector de sectores con la empresa selecciona marcada
		Y luego los datos de direccion y tal de la empresa
		-->
</head>
<body>
	<form id="form1" runat="server">
		<div>

			<label>Selecciona una empresa...</label>
			<br />
			<br />

			<asp:AccessDataSource ID="selSectores" runat="server"
				SelectCommand="SELECT * FROM sectores ORDER BY nom_sector"
				DataFile="~/App_Data/escuela_empresa.mdb" />

			<asp:AccessDataSource ID="selEmpresas" runat="server"
				SelectCommand="SELECT * FROM empresas ORDER BY empresa"
				DataFile="~/App_Data/escuela_empresa.mdb" />

			<asp:ListBox ID="listEmpresas" runat="server"
				DataSourceID="selEmpresas"
				DataValueField="cod_empresa"
				DataTextField="empresa"
				AutoPostBack="true" />

			<br />
			<br />

			<label>Sectores: </label>
			<asp:DropDownList ID="listSectores" runat="server"
				DataSourceID="selSectores"
				DataValueField="cod_sector"
				DataTextField="nom_sector" />

			<br />
			<br />
			<label>Dirección</label>
			<asp:TextBox ID="direccion" runat="server" />

			<br />
			<br />
			<label>Teléfono</label>
			<asp:TextBox ID="telefono" runat="server" />

			<br />
			<br />
			<label>E-Milio</label>
			<asp:TextBox ID="emilio" runat="server" />
		</div>
	</form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ejercicio8.aspx.cs" Inherits="Ejercicio8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <!--
        Ejercicio sólo con ASP.NET
        Tenemos dos desplegables: sector y empresas
        tabla cargos -> cod_cargo y desc_cargo
        Contactos -> cod_empresa, cod_cargo, nombre, telefone
        Cuando seleccionemos un un sector, salen las empresas de dicho sector
        Cuando seleccionemos la empresa, aparece en un view inferior los datos de dicho cargo
    -->
    <form id="form1" runat="server">
        <div>
            <!-- 1) Seleccionar los datos de el sector -->

            <label>Seleccione el sector de su empresa: </label>
            <asp:AccessDataSource ID="sectoresSel" runat="server"
                DataFile="~/App_Data/escuela_empresa.mdb"
                DataSourceMode="DataReader"
                SelectCommand="SELECT * FROM Sectores"
            />

            <!-- 2) Cargamos los datos en un select -->

            <asp:DropDownList ID="sectoresView" runat="server"
                DataSourceID="sectoresSel"
                DataValueField="cod_sector"
                DataTextField="nom_sector"
                AutoPostBack="true"
            />
            <br /> <br />
            <!-- 3) Buscamos los datos de la empresa con ese sector -->

            <label>Seleccione su empresa: </label>
            <asp:AccessDataSource ID="empresasSel" runat="server"
		        DataFile="App_Data/escuela_empresa.mdb"
		        SelectCommand="SELECT * FROM Empresas"
		        FilterExpression="Sector='{0}'">

	        	<FilterParameters>
			        <asp:ControlParameter ControlID="sectoresView" PropertyName="SelectedValue" />
		        </FilterParameters>
	        </asp:AccessDataSource>

            <!-- 4) Metemos esos datos en su desplegable -->

            <asp:DropDownList ID="empresasView" runat="server"
                DataSourceID="empresasSel"
                DataValueField="cod_empresa"
                DataTextField="Empresa"
                AutoPostBack="true"
            />
            <br /> <br />

            <!-- 5) Seleccionamos los datos  de contactos -->

            <label>Contactos: </label>
            <asp:AccessDataSource ID="contactosSel" runat="server"
                DataFile="~/App_Data/escuela_empresa.mdb"
                DataSourceMode="DataSet"
                SelectCommand="SELECT Cargos.desc_cargo, Contactos.nombre, Contactos.telefone, Contactos.cod_empresa FROM Contactos, Cargos WHERE Contactos.cod_cargo = Cargos.cod_cargo"
                FilterExpression="cod_empresa = '{0}'"
            >
                <FilterParameters>
			        <asp:ControlParameter ControlID="empresasView" PropertyName="SelectedValue" />
		        </FilterParameters>
             </asp:AccessDataSource>

            <!-- 6) Metemos estos datos en la vista final -->

            <asp:GridView ID="contactosView" runat="server"
                DataSourceID="contactosSel"
				AutoGenerateColumns="true"
            />
        </div>

        <!-- Nota: va de puto culo y hace lo que le sale de la punta del cipote;  Probar seleccionando Comercio e Industria y cambiando las empresas que salen como un puto pirado para poder ver algo de 
            la funcionalidad que cabría esperar >_< -->
    </form>
</body>
</html>

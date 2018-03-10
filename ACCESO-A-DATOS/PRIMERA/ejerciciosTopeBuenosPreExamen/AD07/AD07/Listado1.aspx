<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado1.aspx.cs" Inherits="AD07.Listado1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<!-- actores -->
			<h1>actores</h1>
			<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ObjectDataSourceActor">
				<Columns>
					<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
					<asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
					<asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
					<asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
					<asp:BoundField DataField="PaisID" HeaderText="Pais" SortExpression="PaisID" />

					<asp:TemplateField HeaderText="Pais">
						<ItemTemplate>
							<asp:DropDownList ID="DropDownList1" runat="server" DataValueField="ID" DataTextField="Nom_Pais" Text='<%# Bind("PaisID") %>' Enabled="false" AutoPostBack="true" DataSourceID="ObjectDataSourcePais"></asp:DropDownList>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:DropDownList ID="DropDownList2" runat="server" DataValueField="ID" DataTextField="Nom_Pais" Text='<%# Bind("PaisID") %>' AutoPostBack="true" DataSourceID="ObjectDataSourcePais"></asp:DropDownList>
						</EditItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>

			<!-- insertar actores -->
			<h1>insertar actores</h1>
			<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="ObjectDataSourceActor" DefaultMode="Insert">
				<Fields>
					<asp:BoundField DataField="ID" InsertVisible="false" HeaderText="ID" SortExpression="ID" />
					<asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
					<asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
					<asp:TemplateField HeaderText="Pais">
						<EditItemTemplate>
							<asp:DropDownList ID="DropDownList3" runat="server" DataValueField="ID" DataTextField="Nom_Pais" Text='<%# Bind("PaisID") %>' AutoPostBack="true" DataSourceID="ObjectDataSourcePais"></asp:DropDownList>
						</EditItemTemplate>
					</asp:TemplateField>
					<asp:CommandField ShowInsertButton="True" />
				</Fields>
			</asp:DetailsView>
			<br />

			<!-- paises -->
			<h1>paises</h1>
			<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ObjectDataSourcePais">
				<Columns>
					<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
					<asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
					<asp:BoundField DataField="Nom_Pais" HeaderText="Pais" SortExpression="Nombre" />
				</Columns>
			</asp:GridView>

			<!-- insertar paises -->
			<h1>insertar paises</h1>
			<asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataSourceID="ObjectDataSourcePais" DefaultMode="Insert">
				<Fields>
					<asp:BoundField DataField="ID" InsertVisible="false" HeaderText="ID" SortExpression="ID" />
					<asp:BoundField DataField="Nom_Pais" HeaderText="Pais" SortExpression="Nombre" />
					<asp:CommandField ShowInsertButton="True" />
				</Fields>
			</asp:DetailsView>
			<br />

			<!-- peliculas -->
			<h1>peliculas</h1>
			<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ObjectDataSourcePelicula">
				<Columns>
					<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
					<asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
					<asp:BoundField DataField="Titulo" HeaderText="Titulo" SortExpression="Titulo" />
					<asp:BoundField DataField="Cartel" HeaderText="Cartel" SortExpression="Cartel" />
				</Columns>
			</asp:GridView>

			<!-- insertar peliculas -->
			<h1>insertar peliculas</h1>
			<asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataSourceID="ObjectDataSourcePelicula" DefaultMode="Insert">
				<Fields>
					<asp:BoundField DataField="ID" InsertVisible="false" HeaderText="ID" SortExpression="ID" />
					<asp:BoundField DataField="Titulo" HeaderText="Titulo" SortExpression="Titulo" />
					<asp:BoundField DataField="Cartel" HeaderText="Cartel" SortExpression="Cartel" />
					<asp:CommandField ShowInsertButton="True" />
				</Fields>
			</asp:DetailsView>
			<br />

			<!-- peliculasActores -->
			<h1>peliculasActores</h1>
			<asp:GridView ID="GridListado" runat="server"></asp:GridView>
			<asp:Button ID="Button1" runat="server" Text="Insertar" OnClick="Button1_Click" />

			<asp:DropDownList ID="DropDownListActor" runat="server" DataValueField="ID" DataTextField="Nombre" AutoPostBack="true" DataSourceID="ObjectDataSourceActor"></asp:DropDownList>
			<asp:DropDownList ID="DropDownListPeli" runat="server" DataValueField="ID" DataTextField="Titulo" AutoPostBack="true" DataSourceID="ObjectDataSourcePelicula"></asp:DropDownList>

			<asp:TextBox ID="TextBoxActor" runat="server" Width="25" placeholder="idA"></asp:TextBox>
			<asp:TextBox ID="TextBoxPeli" runat="server" Width="25" placeholder="idP"></asp:TextBox>


			<asp:Button ID="Button2" runat="server" Text="Eliminar" OnClick="Button2_Click" />

			<!-- paisActores -->
			<h1>paisActores</h1>
			<asp:DropDownList ID="pais" runat="server" DataValueField="ID" DataTextField="Nom_Pais" AutoPostBack="true" DataSourceID="ObjectDataSourcePais"></asp:DropDownList>
			<asp:GridView ID="GridView4" runat="server" DataSourceID="ObjectDataSourcePaisActor"></asp:GridView>

			<!-- data source -->
			<asp:ObjectDataSource ID="ObjectDataSourceActor" runat="server" DataObjectTypeName="AD07.Actor" DeleteMethod="EliminarActor" InsertMethod="InsertarActor" UpdateMethod="ActualizarActor" SelectMethod="GetActores" TypeName="AD07.ActorRepositorio"></asp:ObjectDataSource>
			<asp:ObjectDataSource ID="ObjectDataSourcePais" runat="server" DataObjectTypeName="AD07.Pais" DeleteMethod="EliminarPais" InsertMethod="InsertarPais" UpdateMethod="ActualizarPais" SelectMethod="GetPaises" TypeName="AD07.PaisRepositorio"></asp:ObjectDataSource>
			<asp:ObjectDataSource ID="ObjectDataSourcePelicula" runat="server" DataObjectTypeName="AD07.Pelicula" DeleteMethod="EliminarPelicula" InsertMethod="InsertarPelicula" UpdateMethod="ActualizarPelicula" SelectMethod="GetPeliculas" TypeName="AD07.PeliculaRepositorio"></asp:ObjectDataSource>
			<asp:ObjectDataSource ID="ObjectDataSourcePaisActor" runat="server" SelectMethod="GetActors" TypeName="AD07.PaisRepositorio">
				<SelectParameters>
					<asp:FormParameter DefaultValue="1" FormField="pais" Name="cod_pais" Type="String" />
				</SelectParameters>
			</asp:ObjectDataSource>
		</div>
	</form>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ejercicio7.aspx.cs" Inherits="Ejercicio7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:AccessDataSource ID="selSectores" runat="server"
             DataFile="~/escuela_empresa.mdb"
             SelectCommand="select * from sectores order by nom_sector"    
        />

        <asp:DropDownList ID="sector" runat="server"
             DataSourceID="selSectores"    
             DataValueField="cod_sector"
             DataTextField="nom_sector"
             AutoPostBack="true"
        />

       <asp:AccessDataSource ID="selEmpresas" runat="server"
            DataFile="~/escuela_empresa.mdb"
            SelectCommand="select * from empresas order by Empresa"    
            FilterExpression="Sector='{0}'"
        >
           <FilterParameters>
                <asp:ControlParameter ControlID="sector" PropertyName="SelectedValue" />
           </FilterParameters>
       </asp:AccessDataSource>

       <asp:DropDownList ID="empresas" runat="server"
            DataSourceID="selEmpresas"    
            DataValueField="cod_empresa"
            DataTextField="Empresa"
            AutoPostBack="true"
        />

       <asp:AccessDataSource ID="selContactos" runat="server"
            DataFile="~/escuela_empresa.mdb"
            SelectCommand="select * from contactos inner join cargos on (contactos.cod_cargo = cargos.cod_cargo)"    
            FilterExpression="cod_empresa='{0}'"
        >
           <FilterParameters>
                <asp:ControlParameter ControlID="empresas" PropertyName="SelectedValue" />
           </FilterParameters>
       </asp:AccessDataSource>

        <asp:GridView ID="GridView1" runat="server"
             DataSourceID="selContactos"    
             AutoGenerateColumns="false"
             AlternatingRowStyle-BackColor="Gainsboro"
             HorizontalAlign="Center"
             Width="50%"
        >
            <Columns>
                <asp:BoundField DataField="desc_cargo" HeaderText="Cargo" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="telefone" HeaderText="Teléfono" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>

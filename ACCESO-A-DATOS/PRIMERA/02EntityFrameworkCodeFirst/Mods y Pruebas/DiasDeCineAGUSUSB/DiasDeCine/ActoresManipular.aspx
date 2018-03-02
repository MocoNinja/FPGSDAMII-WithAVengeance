<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActoresManipular.aspx.cs" Inherits="DiasDeCine.ActoresManipular" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="datosActores" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="false" SortExpression="ID" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                <asp:TemplateField HeaderText="PaisID" SortExpression="PaisID">
                    <EditItemTemplate>
                        <asp:DropDownList Text='<%# Bind("PaisID") %>' ID="DropDownList1" runat="server" DataSourceID="datosPaises" DataValueField="ID" DataTextField="Nom_Pais"></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList Text='<%# Bind("PaisID") %>' ID="DropDownList1" runat="server" DataSourceID="datosPaises" DataValueField="ID" DataTextField="Nom_Pais" Enabled="False"></asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="datosActores" DefaultMode="Insert" GridLines="Horizontal" Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <Fields>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="false" SortExpression="ID" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                <asp:TemplateField HeaderText="PaisID" SortExpression="PaisID">
                    <ItemTemplate>
                        <asp:DropDownList Text='<%# Bind("PaisID") %>' ID="DropDownList1" runat="server" DataSourceID="datosPaises" DataValueField="ID" DataTextField="Nom_Pais"></asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        </asp:DetailsView>
        <asp:ObjectDataSource ID="datosActores" runat="server" DataObjectTypeName="DiasDeCine.Actor" DeleteMethod="eliminarActor" InsertMethod="insertarActor" SelectMethod="getActores" TypeName="DiasDeCine.ActorRepositorio" UpdateMethod="modificarActor"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="datosPaises" runat="server" SelectMethod="getPaises" TypeName="DiasDeCine.PaisRepositorio"></asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>

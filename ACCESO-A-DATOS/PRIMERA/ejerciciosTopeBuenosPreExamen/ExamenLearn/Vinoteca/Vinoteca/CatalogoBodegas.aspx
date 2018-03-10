<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CatalogoBodegas.aspx.cs" Inherits="Vinoteca.CatalogoBodegas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="Bodegas" DataTextField="Nombre" DataValueField="Id">
            </asp:DropDownList>
        </div>
        <asp:ObjectDataSource ID="Bodegas" runat="server" SelectMethod="SelectBodegas" TypeName="Vinoteca.BodegaRepositorio"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="VinosDeLaBodega" runat="server" SelectMethod="GetVinosFrom" TypeName="Vinoteca.BodegaRepositorio">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="IdBodegaInput" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="VinosDeLaBodega">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" SortExpression="Id" Visible="False" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:TemplateField HeaderText="IdBodega" SortExpression="IdBodega">
                    <ItemTemplate>
                                <asp:DropDownList Text='<%# Bind("IdBodega") %>' 
                            ID="DropDownList1" runat="server" DataSourceID="Bodegas" 
                            DataValueField="Id" DataTextField="Nombre" Enabled="false"></asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActoresPorPais.aspx.cs" Inherits="MisDiasDeCine.ActoresPorPais" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="LosPaises" DataTextField="Nombre" DataValueField="Id">
        </asp:DropDownList>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SusActores">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="false" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                <asp:TemplateField HeaderText="IdPais" SortExpression="IdPais">
                <ItemTemplate>
                        <asp:DropDownList runat="server" ID="adad" DataSourceID="LosPaises" 
                            DataTextField="Nombre" DataValueField="Id" Text='<%# Bind("IdPais") %>' Enabled="false"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="LosPaises" runat="server" SelectMethod="SelectPaises" TypeName="MisDiasDeCine.PaisRepositoio"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="SusActores" runat="server" SelectMethod="GetActores" TypeName="MisDiasDeCine.PaisRepositoio">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="IdPaisInput" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>

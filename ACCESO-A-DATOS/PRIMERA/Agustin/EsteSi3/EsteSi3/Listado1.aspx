<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado1.aspx.cs" Inherits="EsteSi3.Listado1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datos" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Curso" HeaderText="Curso" SortExpression="Curso" />
                <asp:TemplateField HeaderText="Alumnos">
                    <ItemTemplate>
                        <asp:GridView ID="GridView2" runat="server" DataSource='<%# Eval("Alumnos") %>'>
                        </asp:GridView>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    
    </div>
        <asp:ObjectDataSource ID="datos" runat="server" SelectMethod="GetClases" TypeName="EsteSi3.AlumnoRepositorio"></asp:ObjectDataSource>
    </form>
</body>
</html>

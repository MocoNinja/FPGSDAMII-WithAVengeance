<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ejercicio2.aspx.cs" Inherits="Ejercicio2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
<script runat="server">
    protected void Page_Load(Object objeto, EventArgs ea)
    {
        ciudad.Items.Add("Zaragoza");
        ciudad.Items.Add("Madrid");
    }

</script>


    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="ciudad" runat="server"/>
    </div>
    </form>
</body>
</html>

	<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ejercicio1.aspx.cs" Inherits="Ejercicio1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Probando ASP con C#</title>
    
</head>
<body>
    <script runat="server">
        // Este método existe y se ejecuta cuando se carga la página
        protected void Page_Load(Object objeto, EventArgs ea)
        {
            ciudad.Items.Add("Zaragoza");
            ciudad.Items.Add("Huesca");
            ciudad.Items.Add("Teruel");
            ciudad.Items.Add("Hell");
        }
    </script>

    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="ciudad" runat="server" />
    </div>
    </form>
</body>
</html>

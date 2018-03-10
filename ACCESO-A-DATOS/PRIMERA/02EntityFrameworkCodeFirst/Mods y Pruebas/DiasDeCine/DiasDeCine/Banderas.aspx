<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Banderas.aspx.cs" Inherits="DiasDeCine.Banderas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="archivito" runat="server" />
            <asp:Button ID="plas" runat="server" OnClick="plas_Click" />
        </div>
    </form>
</body>
</html>

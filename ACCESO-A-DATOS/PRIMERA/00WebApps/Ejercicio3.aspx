<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ejercicio3.aspx.cs" Inherits="Ejercicio3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ejercicio 2</title>
    <script runat="server">
        String[] vector = { "Zaragoza", "Huesca", "Teruel", "Hell" };
        String[] frutas = { "Sandías", "Melocotones", "Peras", "Melonas" };

        ListItem[] objetos =
        {
            new ListItem("Objeto 1", "1"),
            new ListItem("Objeto 2", "2"),
            new ListItem("Objeto 3", "3")
        };

        protected void Page_Load(Object o, EventArgs ea)
        {
            for (int i = 0; i < vector.Length; i++)
            {
                ciudades.Items.Add(vector[i]);
            }

            foreach (String fruta in frutas)
            {
                fruticas.Items.Add(fruta);
            }
            foreach (ListItem objetico in objetos)
            {
                prueba1.Items.Add(objetico);
            }
        }

        private void cambiar()
        {
            perrete.Attributes.Add("src", "Samoyed_hero1.jpg");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:CheckBoxList ID="ciudades" runat="server"></asp:CheckBoxList>
        <asp:CheckBoxList ID="fruticas" runat="server" />
        <asp:CheckBoxList ID="prueba1" runat="server" />
        <asp:Button ID="plaka" runat="server" OnClientClick="cambiar()" />
        <asp:image ID="perrete" src="Samoyed.jpg" runat="server"></asp:image>
    </div>
    </form>
</body>

</html>

<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ExamenJGT._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Mis Recetas</h1>
        <p class="lead">Examen Javier González Tello</p>
    </div>

    <ul>
        <li><a href="MedidasManipular.aspx">Manipular las medidas</a></li>
        <li><a href="ProductosManipular.aspx">Manipular los productos</a></li>
        <li><a href="RecetasManipular.aspx">Definir las recetas</a></li>
        <li><a href="RecetasApp.aspx">Gestionar las recetas (NO olvidar tener recetas en la BD!!! )</a></li>
    </ul>
    

</asp:Content>

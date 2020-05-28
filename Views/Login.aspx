<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PETCHECK.Views.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title> Login </title>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="msgbox" runat="server"> </div>

    <div class="login-panel mt-1">
        <div class="login-banner d-flex"> 
            <img class="img-logo" src="../IMG/LOGO.png" width="194" height="69" />
            <h3 class="d-block text-snow pt-4 pl-4"> Iniciar Sesion </h3>
        </div>
        <h6 class="text-center mt-2"> Rellena los siguientes campos </h6>

        <form> 

            <div class="form-group">
                <label> Usuario: </label>
                <asp:TextBox runat="server" ID="TxtUser" PlaceHolder="Aruleto" required> </asp:TextBox>
                <small> Introduce tu usuario. </small>
            </div>

            <div class="form-group">
                <label> Constraseña: </label>
                <asp:TextBox runat="server" ID="TxtPsw" TextMode="Password" PlaceHolder="**************" required> </asp:TextBox>
                <small> Introduzca su Constaseña. </small>
            </div>
            
            <h6 class="text-center text-underline"> <a href="mailto:Soporte@PetCheck.com.sv?subject=Recuperar_Contraseña" class="text-main"> Olvidé mi Contraseña.  </a> </h6>
            <br />
            <asp:Button runat="server" ID="BtnLogin" Text="Iniciar" CssClass=" btn-summit " OnClick="BtnLogin_Click" />

        </form>
    </div>
    
</asp:Content>

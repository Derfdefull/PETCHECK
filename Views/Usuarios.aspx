<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Main.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="PETCHECK.Views.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="border-radius rounded-border-top bg-main">
            <div class="d-block">
                <h4 class="p-1 pl-4 d-inline-block"> Lista de Usuarios </h4>
                <a href="Usuarios.aspx?New=true" class="btn link d-inline-block right" > 
                   <span style="font-size: 26px; color: #ffffff">
                   <i class="fas fa-plus-circle"></i> 
                   </span>       
                </a>
                <a href="/Help/Ayuda-Usuarios.pdf" class="btn link d-inline-block right " > 
                   <span style="font-size: 26px; color: #ffffff">
                   <i class="fas fa-question-circle"></i> 
                   </span>  
                </a>
            </div>

         <div class=" d-inline-flex ml-5  m-1  ">
                <asp:TextBox runat="server" CssClass="form-control " ID="TxtSearch" PlaceHolder="Buscar" MaxLength="30"></asp:TextBox>
                <asp:Button runat="server" ID="BtnSearch" OnClick="BtnSearch_Click"  CssClass=" btn-summit" Text="Buscar" />
         </div>
 

            <div class="w-100 bg-white p-3">
                <div runat="server" id="listpanel" class="row">
                   <%
            if (UserList.Count > 0)
                foreach (var usr in UserList)
                { %>
                    <div class="col-3">
                        <div class="reg border-radius  bg-main m-1">
                            <h6 class="p-1 m-0"> <%= usr.Alias %> </h6>
                            <div class="bg-white p-1 text-main text-center">
                               
                                <small class="pt-2"> Nombre: </small>
                                <small class="pb-2">  <%= usr.Nombre %> </small>
     
                                <small> Tipo: </small>
                                <small  class="pb-2"> <%= (usr.Tipo == true) ? "Administrador" : "Limitado" %> </small>
 
                                <small> Usuario: </small>
                                <small class="pb-2"> <%= usr.Alias %> </small>
                                
          
                            </div>
                            <div class=" d-flex text-center">
                                <a href="Usuarios.aspx?Edit=<%= usr.idUsuario %>" class=" btn-summit no-dec"> Editar </a>
                                
                            </div>
                        </div>
                    </div>
                <%}  else {
                        if(Request.QueryString["K"] != null)
                        {%>
                            <h1 class="text-main"> Lo sentimos, no hay datos que coincidan. </h1>
                        <%}
                                else
                                {%>
                            <h1 class="text-main"> No hay informacion para mostrar </h1>
                                <%}

                            }%>
                </div>
              </div>
            </div>
 


    <% if (Request.QueryString["New"] != null)
         { %>
        <div id="myModal" class="Mymodal">
          <div class="Mymodal-content rounded bg-main">

            <span class="Myclose">&times;</span>

              <h4 class="ml-2 p-1"> Nuevo Usuario </h4>
              <div class="bg-white pl-5 pr-5 pt-4">
                  <form method="post">
                     <div class="row">
                         
                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Nombre: </label>
                                <asp:TextBox runat="server" ID="TxtRName" PlaceHolder="Erick Hernandez" required MaxLength="30"></asp:TextBox>
                                <small class="text-main"> Introduce el nombre del usuario. </small>
                            </div>
                         </div>

                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Usuario: </label>
                                <asp:TextBox runat="server" ID="TxtRUser" PlaceHolder="Aruleto" required MaxLength="18"> </asp:TextBox>
                                <small class="text-main"> Introduce nombre de usuario. </small>
                            </div>
                         </div>
                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main">Contraseña: </label>
                                <asp:TextBox runat="server" ID="TxtRPws" PlaceHolder="************" required MaxLength="18"></asp:TextBox>
                                <small class="text-main"> Introduce la contraseña del usuario. </small>
                            </div>
                         </div>

                        
                     </div>

                    <asp:Button runat="server" ID="BtnCreate" Text="Crear" CssClass=" btn-summit " OnClick="BtnCreate_Click" />
                  </form>
                  <br />
                  

                   
              </div>
          </div>
        </div>
        <script src="../Scripts/Modal.js"></script>
       
    <% } %>
     
    <% if (Request.QueryString["Edit"] != null)
         {  var i = int.Parse(Request.QueryString["Edit"]);
            Edit = db.Usuario.First(st => st.idUsuario == i);%>
        <div id="myModal" class="Mymodal"  >
          <div class="Mymodal-content rounded bg-main"  style="max-width: 800px;">

            <span class="Myclose">&times;</span>

              <h4 class="ml-2 p-1"> Editar Usuario - <%= Edit.Alias %> </h4>
              <div class="bg-white pl-4 pr-4 pt-4">
                  <form method="post">
                     <div class="row">
                         <div class="col-6">
                             <div class="form-group">
                                <label class="text-main"> Nombre: </label>
                                 <% TxtEName.Text = Edit.Nombre; %>
                                <asp:TextBox runat="server" ID="TxtEName" PlaceHolder="Erick Hernandez" required MaxLength="30"> </asp:TextBox>
                                <small class="text-main"> Introduce el nombre del usuario. </small>
                            </div>
                         </div>

                         <div class="col-6">
                             <div class="form-group">
                                <label class="text-main"> Usuario: </label>
                                 <% TxtEUser.Text = Edit.Alias; %>
                                <asp:TextBox runat="server" ID="TxtEUser" PlaceHolder="Aruleto" required MaxLength="18"> </asp:TextBox>
                                <small class="text-main"> Introduce nombre de usuario. </small>
                            </div>
                         </div>

                         <div class="col-12"> </div>

                         <div class="col-6">
                             <div class="form-group">
                                 <% _ = Edit.Tipo == true ? CmbEType.SelectedIndex = 0 : CmbEType.SelectedIndex = 1; %>
                                <label class="text-main"> Tipo: </label>
                                <asp:DropDownList ID="CmbEType" runat="server">
                                     <asp:ListItem> Administrador </asp:ListItem>
                                    <asp:ListItem> Sub-Admin </asp:ListItem>
                                 </asp:DropDownList>
                                <small class="text-main"> Selecciona el tipo de usuario. </small>
                            </div>
                         </div>
                         <% if (main.Tipo == true || Edit.Alias == main.Alias)
                             {%>
                             <div class="col-6">
                                 <div class="form-group">
                                    <label class="text-main">Contraseña: </label>
                                    <asp:TextBox runat="server" ID="TxtEPwd" PlaceHolder="************" required MaxLength="18"></asp:TextBox>
                                    <small class="text-main"> Introduce la contraseña del usuario. </small>
                                </div>
                             </div>
                         <%} %>
                        
                     </div>

                    <asp:Button runat="server" ID="BtnEdit" Text="Guardar" CssClass=" btn-summit " OnClick="BtnEdit_Click" />
                  </form>
                  <br />
                  
              </div>
          </div>
        </div>
        <script src="../Scripts/Modal.js"></script>
    <% } %>


    <% else if ( Request.QueryString["Er"] != null)
             { %>
                <% if (Request.QueryString["Er"] == "0")
                        { %>
                            <script>
                                swal("Usuario Editado!", "Usuario fue Editado con exito", "success");
                            </script>
                    <%}
                     if (Request.QueryString["Er"] == "1")
            { %>
                            <script>
                                swal("Usuario Creado!", "Usuario fue creado con exito", "success");
                            </script>
                    <%}

                      if (Request.QueryString["Er"] == "2")
            { %>
                    <script>
                        swal("Algo salio mal!", "puede que algun dato este fuera de lugar, o el Usuario ya esta registrado.", "warning");
                    </script>
            <%}
                     if (Request.QueryString["Er"] == "404")
            { %>
                    <script>
                        swal("Erro 404!", "Servidores Inactivos", "error");
                    </script>
            <%}
    } %>

</asp:Content>

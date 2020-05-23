<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Main.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="PETCHECK.Views.Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <div class="border-radius rounded-border-top bg-main">
            <div class="d-block">
                <h4 class="p-1 pl-4 d-inline-block"> Lista de Clientes </h4>
                <a href="Clientes.aspx?New=true" class="btn link d-inline-block right" > 
                   <span style="font-size: 26px; color: #ffffff">
                   <i class="fas fa-plus-circle"></i> 
                   </span>       
                </a>
                <a href="/Help/Ayuda-Clientes.pdf" class="btn link d-inline-block right " > 
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
                <div class="row">
                    <%
            if (UserList.Count > 0)
                foreach (var clt in UserList)
                { %>
                        <div class="col-3">
                            <div class="reg border-radius  bg-main m-1">
                                <h6 class="p-1 m-0"> <%= clt.Nombre %> </h6>
                                <div class="bg-white p-1 text-main text-center">
                               
                                    <small class="pt-2"> Telefono: </small>
                                    <small class="pb-2">  <%= clt.Telefono %> </small>
     
                                    <small> Direccion: </small>
                                    <small style="overflow: auto; overflow-x: hidden;  min-height: 125px;"> 
                                        <%= clt.Direccion %>
                                    </small>
          
                                </div>
                                <div class=" d-flex text-center">
                                    <a href="Clientes.aspx?Edit=<%= clt.idUsuario %>" class=" btn-summit no-dec"> Editar </a>
                                    <a href="Clientes.aspx?Pets=<%= clt.idUsuario %>" class=" btn-summit no-dec"> Mascotas </a>
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

              <h4 class="ml-2 p-1"> Nuevo Cliente </h4>
              <div class="bg-white pl-5 pr-5 pt-4">
                  <form method="post">
                     <div class="row">
                         <div class="col-6">
                             <div class="form-group">
                                <label class="text-main"> Nombre del Cliente: </label>
                                <asp:TextBox runat="server" ID="TxtRName" PlaceHolder="Isabel Hernandez" required MaxLength="30"> </asp:TextBox>
                                <small class="text-main"> Introduce el nombre del cliente. </small>
                            </div>
                         </div>

                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Telefono: </label>
                                <asp:TextBox runat="server" ID="TxtRPhone" PlaceHolder="77777777" TextMode="Number" required MaxLength="8"> </asp:TextBox>
                                <small class="text-main"> Introduce el numero telefonico. </small>
                            </div>
                         </div>

                         <div class="col-12">
                             <div class="form-group">
                                <label class="text-main"> Direccion: </label>
                                <asp:TextBox runat="server" ID="TxtRAddress" PlaceHolder="Sensuntepeque, Cabañas, El Salvador." TextMode="MultiLine" required MaxLength="125"> </asp:TextBox>
                                <small class="text-main"> Introduce la direccion del cliente. </small>
                            </div>
                         </div>
                     </div>

                    <asp:Button runat="server" ID="BtnSave" Text="Registrar" CssClass=" btn-summit " OnClick="BtnSave_Click" />
                  </form>
                  <br />
                  
                   
              </div>
          </div>
        </div>
        <script src="../Scripts/Modal.js"></script>
       
    <% } %>
     
    <% if (Request.QueryString["Edit"] != null)
         { var i = int.Parse(Request.QueryString["Edit"]);
            Edit = db.Usuario.First(st => st.idUsuario == i);%>
        <div id="myModal" class="Mymodal">
          <div class="Mymodal-content rounded bg-main">

            <span class="Myclose">&times;</span>

              <h4 class="ml-2 p-1"> Editar Cliente - <%= Edit.Nombre %> </h4>
              <div class="bg-white pl-5 pr-5 pt-4">
                  <form method="post">
                     <div class="row">
                         <div class="col-6">
                             <div class="form-group">
                                <label class="text-main"> Nombre del Cliente: </label>
                                 <% TxtEName.Text = Edit.Nombre; %>
                                <asp:TextBox runat="server" ID="TxtEName" PlaceHolder="Isabel Hernandez" MaxLength="30" required> </asp:TextBox>
                                <small class="text-main"> Introduce el nombre del cliente. </small>
                            </div>
                         </div>

                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Telefono: </label>
                                <% TxtEPhone.Text = Edit.Telefono.ToString(); %>
                                 <asp:TextBox runat="server" ID="TxtEPhone" PlaceHolder="77777777" TextMode="Number" MaxLength="8" required> </asp:TextBox>
                                <small class="text-main"> Introduce el numero telefonico. </small>
                            </div>
                         </div>

                         <div class="col-12">
                             <div class="form-group">
                                <label class="text-main"> Direccion: </label>
                                 <% TxtEAddress.Text = Edit.Direccion; %>
                                <asp:TextBox runat="server" ID="TxtEAddress" PlaceHolder="Sensuntepeque, Cabañas, El Salvador." MaxLength="120" TextMode="MultiLine"> </asp:TextBox>
                                <small class="text-main"> Introduce la direccion del cliente. </small>
                            </div>
                         </div>
                     </div>

                    <asp:Button runat="server" ID="BtnEdit" Text="Guardar" CssClass=" btn-summit " OnClick="BtnEdit_Click" />
                  </form>
                  <br />

                 
              </div>
          </div>
        </div>
        <script src="../Scripts/Modal.js"></script>
       
    <% } %>

    <% if (Request.QueryString["Pets"] != null)
         { %>
        <div id="myModal" class="Mymodal">
          <div class="Mymodal-content">
            <span class="Myclose">&times;</span>
            <p>Some text in the Modal..</p>
          </div>
        </div>
        <script src="../Scripts/Modal.js"></script>
       
    <% } %>


    <% else if ( Request.QueryString["Er"] != null)
             { %>
                <% if (Request.QueryString["Er"] == "0")
                        { %>
                            <script>
                                swal("Cliente Editado!", "El cliente ha sido editado exitosamente.", "success");
                            </script>
                    <%}
                     if (Request.QueryString["Er"] == "1")
            { %>
                            <script>
                                swal("Cliente Registrado!", "El cliente ha sido registrado exitosamente.", "success");
                            </script>
                    <%}

                      if (Request.QueryString["Er"] == "2")
            { %>
                    <script>
                        swal("Algo salio mal!", "puede que algun dato este fuera de lugar, o el cliente ya este registrada.", "warning");
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

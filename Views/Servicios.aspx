<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Main.Master" AutoEventWireup="true" CodeBehind="Servicios.aspx.cs" Inherits="PETCHECK.Views.Servicios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <div class="border-radius rounded-border-top bg-main">
            <div class="d-block">
                <h4 class="p-1 pl-4 d-inline-block"> Lista de Servicios </h4>
                <a href="Servicios.aspx?New=true" class="btn link d-inline-block right" > 
                   <span style="font-size: 26px; color: #ffffff">
                   <i class="fas fa-plus-circle"></i> 
                   </span>       
                </a>
                <a href="#" class="btn link d-inline-block right " > 
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
            if (ServList.Count > 0)
                foreach (var srv in ServList)
                { %>
                        <div class="col-3">
                            <div class="reg border-radius  bg-main m-1">
                                <h6 class="p-1 m-0"> <%= srv.Nombre %> </h6>
                                <div class="bg-white p-1 text-main text-center">
                                    
                                    <small> Precio: </small>
                                    <small> $<%= srv.Precio %> </small>

                                    <small class="pt-2"> Descripcion: </small>
                                    <small style="overflow: auto; overflow-x: hidden;  min-height: 125px;">   <%= srv.Descripcion %> </small>
     
          
                                </div>
                                <div class=" d-flex text-center">
                                    <a href="Servicios.aspx?Edit=<%= srv.idServicio %>" class=" btn-summit no-dec"> Editar </a>
                                    
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

              <h4 class="ml-2 p-1"> Nuevo Servicio </h4>
              <div class="bg-white pl-5 pr-5 pt-4">
                  <form method="post">
                     <div class="row">
                         <div class="col-6">
                             <div class="form-group">
                                <label class="text-main"> Nombre del Servicio: </label>
                                <asp:TextBox runat="server" ID="TxtRName" PlaceHolder="Vacuna..." required MaxLength="55"> </asp:TextBox>
                                <small class="text-main"> Introduce el nombre del servicio. </small>
                            </div>
                         </div>

                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Precio: </label>
                                <asp:TextBox runat="server" ID="TxtRPrice" PlaceHolder="9,99" pattern="[0-9]+([\,][0-9]+)?" TextMode="Number" required MaxLength="8"> </asp:TextBox>
                                <small class="text-main"> Introduce el precio por el servicio. </small>
                            </div>
                         </div>

                         <div class="col-12">
                             <div class="form-group">
                                <label class="text-main"> Descripcion: </label>
                                <asp:TextBox runat="server" ID="TxtRDescription" PlaceHolder="Inyeccion dedicada a prevenir..." TextMode="MultiLine" required MaxLength="125"> </asp:TextBox>
                                <small class="text-main"> Introduce la descripcion del servicio. </small>
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
            Edit = db.Servicio.First(st => st.idServicio == i);%>
        <div id="myModal" class="Mymodal">
          <div class="Mymodal-content rounded bg-main">

            <span class="Myclose">&times;</span>

              <h4 class="ml-2 p-1"> Editar Servicio - <%= Edit.Nombre %> </h4>
              <div class="bg-white pl-5 pr-5 pt-4">
                  <form method="post">
                     <div class="row">
                         <div class="col-6">
                             <div class="form-group">
                               
                                 <% TxtEName.Text = Edit.Nombre; %>
                               <label class="text-main"> Nombre del Servicio: </label>
                                <asp:TextBox runat="server" ID="TxtEName" PlaceHolder="Vacuna..." required MaxLength="55"> </asp:TextBox>
                                <small class="text-main"> Introduce el nombre del servicio. </small>
                            </div>
                         </div>

                         <div class="col-4">
                             <div class="form-group">
                               
                                <% TxtEPrice.Text = Edit.Precio.ToString(); %>
                                <label class="text-main"> Precio: </label>
                                <asp:TextBox runat="server" ID="TxtEPrice" PlaceHolder="9,99" pattern="[0-9]+([\.,][0-9]+)?" step="any"  TextMode="Number" required MaxLength="8"> </asp:TextBox>
                                <small class="text-main"> Introduce el precio por el servicio. </small>
                            </div>
                         </div>

                         <div class="col-12">
                             <div class="form-group">
                                
                                 <% TxtEDescription.Text = Edit.Descripcion; %>
                                 <label class="text-main"> Descripcion: </label>
                                <asp:TextBox runat="server" ID="TxtEDescription" PlaceHolder="Inyeccion dedicada a prevenir..." TextMode="MultiLine" required MaxLength="125"> </asp:TextBox>
                                <small class="text-main"> Introduce la descripcion del servicio. </small>
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

    


    <% else if ( Request.QueryString["Er"] != null)
             { %>
                <% if (Request.QueryString["Er"] == "0")
                        { %>
                            <script>
                                swal("Servicio Editado!", "El Servicio ha sido editado exitosamente.", "success");
                            </script>
                    <%}
                     if (Request.QueryString["Er"] == "1")
            { %>
                            <script>
                                swal("Servicio Registrado!", "El Servicio ha sido registrado exitosamente.", "success");
                            </script>
                    <%}

                      if (Request.QueryString["Er"] == "2")
            { %>
                    <script>
                        swal("Algo salio mal!", "puede que algun dato este fuera de lugar, o el Servicio ya este registrada.", "warning");
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

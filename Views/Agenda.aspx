<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Main.Master" AutoEventWireup="true" CodeBehind="Agenda.aspx.cs" Inherits="PETCHECK.Views.Agenda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="border-radius rounded-border-top bg-main">
            <div class="d-block">
                <h4 class="p-1 pl-4 d-inline-block"> Lista de Citas </h4>
                <a href="Agenda.aspx?New=true" class="btn link d-inline-block right" > 
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
               <asp:TextBox runat="server" CssClass="form-control " ID="TxtInit" TextMode="Date"></asp:TextBox>
               <asp:Button runat="server" ID="BtnFilter"   CssClass=" btn-summit" Text="Flitrar" />
         </div>
            <div class="w-100 bg-white p-4">
                <div class="row">
                    <%
            if (CList.Count > 0)
                foreach (var ct in CList)
                { %>
                     <div class=" bg-main rounded col-auto m-1">
                      <a href="#" class="btn link bg-main text-white" style="font-size: 14px; text-decoration:none;"> 
                        <span style="font-size: 36px; color: snow;">
                        <i class="fas fa-dog"></i>   
                        </span>
                          <div class="pl-3">
                             <br /> Doctor: <%= ct.Usuario.Nombre %>
                             <br /> Mascota: <%= ct.Mascota1.Nombre %>
                             <br /> <%= ct.Fecha.ToString("dddd MM/yyyy hh:mm:ss tt", System.Globalization.CultureInfo.CurrentCulture) %>
                             <br /> <%= ct.Servicio1.Nombre %>
                          </div>
                        </a>
                      </div>
                    
                    <%}  else {

                        if(Request.QueryString["K"] != null)
                        {%>
                            <h1 class="text-main"> Lo sentimos, no hay datos que coincidan con las fechas ingresadas. </h1>
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

              <h4 class="ml-2 p-1"> Nueva Cita </h4>
              <div class="bg-white pl-5 pr-5 pt-4">
                  <form method="post">
                     <div class="row">
                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Doctor: </label> 
                               
                                 <asp:DropDownList runat="server" ID="cmbRDoc" required>
                                </asp:DropDownList>
                                <small class="text-main"> Selecciona el Doctor de la consulta. </small>
                            </div>
                         </div>

                         <div class="col-4">
                          <div class="form-group">
                                <label class="text-main"> Mascota: </label> 
                               
                                 <asp:DropDownList runat="server" ID="cmbRPet" required>
                                </asp:DropDownList>
                                <small class="text-main"> Selecciona la mascota a tratar. </small>
                            </div>
                         </div>

                         <div class="col-4">
                      <div class="form-group">
                                <label class="text-main"> Servicio: </label> 
                               
                                 <asp:DropDownList runat="server" ID="cmbRServ" required>
                                </asp:DropDownList>
                                <small class="text-main"> Selecciona el servicio a brindar. </small>
                            </div>
                         </div>

                         <div class="col-4">
                        <div class="form-group">
                                <label class="text-main"> Fecha: </label> 
                                <asp:TextBox runat="server" ID="TxtRDate" TextMode="Date" required ></asp:TextBox>
                                <small class="text-main"> Introduzca la Fecha de la cita. </small>
                            </div>
                         </div>
                         

                      <div class="col-4">
                        <div class="form-group">
                                <label class="text-main"> Fecha: </label> 
                                <asp:TextBox runat="server" ID="TxtRTime" TextMode="Time" required ></asp:TextBox>
                                <small class="text-main"> Introduzca la Hora de la cita. </small>
                            </div>
                        </div>

                    </div>
                    <asp:Button runat="server" ID="BtnSave" Text="Registrar" CssClass=" btn-summit" OnClick="BtnSave_Click"  />
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
                                swal("Cita Editada!", "La Cita ha sido editado exitosamente.", "success");
                            </script>
                    <%}
                     if (Request.QueryString["Er"] == "1")
            { %>
                            <script>
                                swal("Cita Registrado!", "La Cita ha sido registrado exitosamente.", "success");
                            </script>
                    <%}

                      if (Request.QueryString["Er"] == "2")
            { %>
                    <script>
                        swal("Algo salio mal!", "puede que algun dato este fuera de lugar, o la Cita ya este registrada.", "warning");
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

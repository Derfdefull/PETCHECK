<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Main.Master" AutoEventWireup="true" CodeBehind="Mascotas.aspx.cs" Inherits="PETCHECK.Views.Mascotas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <div class="border-radius rounded-border-top bg-main">
            <div class="d-block">
                <h4 class="p-1 pl-4 d-inline-block"> Lista de Mascotas </h4>
                <a href="Mascotas.aspx?New=true" class="btn link d-inline-block right" > 
                   <span style="font-size: 26px; color: #ffffff">
                   <i class="fas fa-plus-circle"></i> 
                   </span>       
                </a>
                <a href="/Help/Ayuda-mascotas.pdf" class="btn link d-inline-block right " > 
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
                    <% if (PetList.Count > 0)
                foreach (var pet in PetList)
                { %>

                        <div class="col-3">
                            <div class="reg border-radius  bg-main m-1">
                                <h6 class="p-1 m-0"> <%= pet.Nombre %> </h6>
                                <div class="bg-white p-1 text-main text-center">
                               
                                    <small class="pt-2"> Genero: </small>
                                    <small class="pb-2">  <%= pet.Genero %> </small>
                                
                                    <small> Raza: </small>
                                    <small class="pb-2">  <%= pet.Raza %> </small>
                                
                                    <small> Peso y Estatura: </small>
                                    <small> <%= pet.Peso %> kg <%= pet.Estatura %> inch</small>
                                    <br />
                                </div>
                                <div class=" d-flex text-center">
                                    <a href="./Mascotas.aspx?Edit=<%= pet.idMascota %>" class=" btn-summit no-dec"> Editar </a>
                                    <a href="./Mascotas.aspx?Own=<%= pet.Dueño %>" class=" btn-summit no-dec"> Dueño </a>
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

              <h4 class="ml-2 p-1"> Nuevo Mascota </h4>
              <div class="bg-white pl-5 pr-5 pt-4">
                  <form method="post">
                     <div class="row">
                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Nombre: </label>
                                <asp:TextBox runat="server" ID="TxtRName" PlaceHolder="Panchito"  required MaxLength="18"> </asp:TextBox>
                                <small class="text-main"> Introduce el nombre de la mascota. </small>
                            </div>
                         </div>

                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Raza: </label>
                                <asp:TextBox runat="server" ID="TxtRRace" PlaceHolder="Dogo" MaxLength="15"  required> </asp:TextBox>
                                <small class="text-main"> Introduce la raza de la mascota. </small>
                            </div>
                         </div>

                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Especie: </label>
                                <asp:TextBox runat="server" ID="TxtRSpecies" PlaceHolder="Perro" MaxLength="15"  required> </asp:TextBox>
                                <small class="text-main"> Introduce la especie de la mascota. </small>
                            </div>
                         </div>

                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Genero: </label>
                               <asp:DropDownList ID="CmbRGender" runat="server">
                                     <asp:ListItem> Macho </asp:ListItem>
                                    <asp:ListItem> Hembra </asp:ListItem>
                                 </asp:DropDownList>
                                <small class="text-main"> Introduce el genero de la mascota. </small>
                            </div>
                         </div>

                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Estatura: </label>
                                <asp:TextBox runat="server" ID="TxtRTall" PlaceHolder="1,6" pattern="[0-9]+([\,][0-9]+)?" MaxLength="8" required="true"> </asp:TextBox>
                                <small class="text-main"> Introduce estatura de la mascota en pulgadas. </small>
                            </div>
                         </div>

                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Peso: </label>
                                <asp:TextBox runat="server" ID="TxtRWeight" PlaceHolder="15" pattern="[0-9]+([\,][0-9]+)?" MaxLength="8" required="true"> </asp:TextBox>
                                <small class="text-main"> Introduce el peso en Kilogramos. </small>
                            </div>
                         </div>


                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Fecha de Nacimiento: </label>
                                <asp:TextBox runat="server" ID="TxtRDate"  TextMode="Date" ReadOnly> </asp:TextBox>
                                <small class="text-main"> Introduce la fecha de nacimiento de la mascota. </small>
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
       

    <%} else if (Request.QueryString["Edit"] != null)
        {
            var i = int.Parse(Request.QueryString["Edit"]);
            Edit = db.Mascota.First(st => st.idMascota == i);%>

        <div id="myModal" class="Mymodal">
          <div class="Mymodal-content rounded bg-main">

            <span class="Myclose">&times;</span>

              <h4 class="ml-2 p-1"> Editar Mascota - <%= Edit.Nombre %></h4>
              <div class="bg-white pl-5 pr-5 pt-4">
                  <form method="post">
                     <div class="row">
                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Nombre: </label>
                                <% TxtEName.Text = Edit.Nombre; %> 
                                <asp:TextBox runat="server" ID="TxtEName" PlaceHolder="Panchito" MaxLength="18" required="true"> </asp:TextBox>
                                <small class="text-main"> Introduce el nombre de la mascota. </small>
                            </div>
                         </div>

                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Raza: </label>
                                 <% TxtERace.Text = Edit.Raza; %> 
                                <asp:TextBox runat="server" ID="TxtERace" PlaceHolder="Dogo" MaxLength="15"  required="true"> </asp:TextBox>
                                <small class="text-main"> Introduce la raza de la mascota. </small>
                            </div>
                         </div>

                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Especie: </label>
                                 <% TxtESpecies.Text = Edit.Especie; %> 
                                <asp:TextBox runat="server" ID="TxtESpecies" PlaceHolder="Perro" MaxLength="15"  required="true"> </asp:TextBox>
                                <small class="text-main"> Introduce la especie de la mascota. </small>
                            </div>
                         </div>

                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Genero: </label>
                                 <% CmbEGender.Text = Edit.Genero; %>
                               <asp:DropDownList ID="CmbEGender" runat="server">
                                     <asp:ListItem> Macho </asp:ListItem>
                                    <asp:ListItem> Hembra </asp:ListItem>
                                 </asp:DropDownList>
                                <small class="text-main"> Introduce el genero de la mascota. </small>
                            </div>
                         </div>

                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Estatura: </label>
                                 <% TxtETall.Text = Edit.Estatura.ToString(); %>
                                <asp:TextBox runat="server" ID="TxtETall" PlaceHolder="1.6"  pattern="[0-9]+([\,][0-9]+)?" step="any" MaxLength="8" required="true"> </asp:TextBox>
                                <small class="text-main"> Introduce estatura de la mascota en pulgadas. </small>
                            </div>
                         </div>

                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Peso: </label>
                                  <% TxtEWeight.Text = Edit.Peso.ToString(); %>
                                <asp:TextBox runat="server" ID="TxtEWeight" PlaceHolder="15" pattern="[0-9]+([\,][0-9]+)?" step="any" MaxLength="8" required="true"> </asp:TextBox>
                                <small class="text-main"> Introduce el peso en Kilogramos. </small>
                            </div>
                         </div>


                         <div class="col-4">
                             <div class="form-group">
                                <label class="text-main"> Fecha de Nacimiento: </label>
                                <asp:TextBox runat="server" ID="TxtEDate"  PlaceHolder="15" TextMode="Date" required="true"> </asp:TextBox>

                                <small class="text-main"> Introduce la fecha de nacimiento de la mascota. 
                                    
                                   <strong> Fecha Actual:<%= DateTime.Parse(Edit.Fecha_Nacimiento.ToString()).ToString("dd/MM/yyyy") %> </strong></small>
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

    <% else if (Request.QueryString["Own"] != null)
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
                                swal("Mascota Actualizada!", "la mascota ha sido Editada exitosamente.", "success");
                            </script>
                    <%}
                     if (Request.QueryString["Er"] == "1")
            { %>
                            <script>
                                swal("Mascota Registrada!", "la mascota ha sido registrado exitosamente.", "success");
                            </script>
                    <%}

                      if (Request.QueryString["Er"] == "2")
            { %>
                    <script>
                        swal("Algo salio mal!", "puede que algun dato este fuera de lugar, o la mascota ya este registrada.", "warning");
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

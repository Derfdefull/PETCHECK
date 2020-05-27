<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Main.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="PETCHECK.Views.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-6 pr-4 pl-4 ">
            <div class="bg-white p-2 rounded shadow" style="height: 300px; max-height: 300px;">
                <h2> MISIÓN </h2>
                <p style=" text-align: justify;"> 
                Ofrecer solución a las problemáticas de registro y manejo de información dentro de las clínicas veterinarias del país, para 
                brindar un mejor servicio, enfocándonos en conseguir el bienestar más óptimo posible de los animales, y no menos importante,
                el de los dueños.</p>

            </div>
        </div>

         <div class="col-6">
             <div class="bg-white p-2 rounded shadow " style="height: 300px; max-height: 300px;">
                <h2> VISIÓN </h2>
                <p style="text-align: justify;"> 
                Ofrecer y realizar servicios veterinarios de gran calidad y alto nivel técnico, dirigidos a nuestros clientes y a sus mascotas
                para satisfacer con excelencia sus necesidades mediante una mejor gestión de su información.</p>

            </div>
        </div>

        <div class="col-6 mt-1"> 
            <div class=" text-center table ">
             <asp:Calendar ID="Calendar1" runat="server" DayNameFormat="FirstLetter" Font-Names="Tahoma" Font-Size="11px" NextMonthText="<" PrevMonthText=">" SelectMonthText="»" SelectWeekText="›" CssClass="myCalendar" CellPadding="0">
            <OtherMonthDayStyle ForeColor="#b0b0b0" />
            <DayStyle CssClass="myCalendarDay" ForeColor="#2d3338" />
            <DayHeaderStyle CssClass="myCalendarDayHeader" ForeColor="#2d3338" />
            <SelectedDayStyle Font-Bold="True" Font-Size="12px" CssClass="myCalendarSelector" />
            <TodayDayStyle CssClass="myCalendarToday" />
            <SelectorStyle CssClass="myCalendarSelector" />
            <NextPrevStyle CssClass="myCalendarNextPrev" />
            <TitleStyle CssClass="myCalendarTitle" />
                    </asp:Calendar>
                </div>
            </div>
        <div class="col-6 mt-1"> 
             <nav class="bg-main border-radius rounded-border-top ">
              <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <a class="nav-item nav-link active notes-link" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Dia</a>
                <a class="nav-item nav-link notes-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Semana</a>
                <a class="nav-item nav-link notes-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Mes</a>
              </div>
            </nav>

            <div class="tab-content bg-main notes" id="nav-tabContent">
              <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">

               <% foreach (var cita in CToday)
                   {%>
                  <div class="note-card">
                      <a href="#" class="btn link d-flex " style="font-size: 12px; text-decoration:none ;"> 
                        <span style="font-size: 36px; color: #4E96C2;">
                        <i class="fas fa-dog"></i>   
                        </span>
                          <div class="pl-3">
                            <%= cita.Mascota1.Nombre %>
                              <br /> <%= cita.Fecha.ToString("hh:mm:ss tt", System.Globalization.CultureInfo.InvariantCulture) %>
                              <br /> <%= cita.Servicio1.Nombre %>
                          </div>
                    </a>
                  </div>
                  <%} %>
                  
               </div>
              <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">

                  <% foreach (var cita in CWeek)
                   {%>
                  <div class="note-card">
                      <a href="#" class="btn link d-flex " style="font-size: 12px; text-decoration:none ;"> 
                        <span style="font-size: 36px; color: #4E96C2;">
                        <i class="fas fa-dog"></i>   
                        </span>
                          <div class="pl-3">
                            <%= cita.Mascota1.Nombre %>
                              <br /> <%= cita.Fecha.ToString("dddd dd MMMM- hh:mm tt", System.Globalization.CultureInfo.CreateSpecificCulture("es-US")) %>
                              <br /> <%= cita.Servicio1.Nombre %>
                          </div>
                    </a>
                  </div>
                  <%} %>
              </div>
              <div class="tab-pane fade " id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">

                  <%
                          foreach (var cita in C)
                      {%>
                 
                  <div class="note-card ">
                      <a href="#" class="btn link d-flex " style="font-size: 12px; text-decoration:none ;"> 
                        <span style="font-size: 36px; color: #4E96C2;">
                        <i class="fas fa-dog"></i>   
                        </span>
                          <div class="pl-3">
                            <%= cita.Mascota1.Nombre %>
                              <br /> <%= cita.Fecha.ToString("dddd dd MMMM- hh:mm tt", System.Globalization.CultureInfo.CreateSpecificCulture("es-US")) %>
                              <br /> <%= cita.Servicio1.Nombre %>
                          </div>
                    </a>
                  </div>
                  <%} %>
              </div>
            </div>
         </div>
            

   
      </div>


</asp:Content>

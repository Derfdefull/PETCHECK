<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Main.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="PETCHECK.Views.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-6">
            <div class="row text-center">
                 <div class="col-3 bg-white rounded m-1 border-main">
                    <a href="#" class="btn link no-dec text-center"> 
                        <span style="font-size: 36px; color: #4E96C2;">
                        <i class="fas fa-user-friends"></i>   
                        </span>
                        <br />
                        Agregar Usuario
                    </a>
                </div>

                <div class="col-3 bg-white rounded m-1 border-main">
                    <a href="#" class="btn link  no-dec text-center"> 
                        <span style="font-size: 36px; color: #4E96C2;">
                        <i class="fas fa-dog"></i>  
                        </span>
                        <br />
                        Agregar Mascota
                    </a>
                </div>

                <div class="col-3 bg-white rounded m-1 border-main">
                    <a href="#" class="btn link  no-dec text-center"> 
                        <span style="font-size: 36px; color: #4E96C2;">
                        <i class="fas fa-user-friends"></i>
                        </span>
                        <br />
                        Agregar Cliente
                    </a>
                </div>

                <div class="col-3 bg-white rounded m-1 border-main">
                    <a href="#" class="btn link  no-dec text-center"> 
                        <span style="font-size: 36px; color: #4E96C2;">
                       <i class="fas fa-calendar-alt"></i>  
                        </span>
                        <br />
                        Nueva Cita
                    </a>
                </div>

                <div class="col-3 bg-white rounded m-1 border-main">
                    <a href="#" class="btn link  no-dec text-center"> 
                        <span style="font-size: 36px; color: #4E96C2;">
                        <i class="fas fa-star-of-life"></i>   
                        </span>
                        <br />
                        Nuevo Servicio
                    </a>
                </div>

                <div class="col-3 bg-white rounded m-1 border-main">
                    <a href="#" class="btn link  no-dec text-center"> 
                        <span style="font-size: 36px; color: #4E96C2;">
                        <i class="fas fa-user-nurse"></i>   
                        </span>
                        <br />
                        Registrar Consulta
                    </a>
                </div>

               
            </div>
        </div>
      <div class="col-4">
                <div class="bg-light">
             <asp:Calendar ID="Calendar1" runat="server" DayNameFormat="FirstLetter" Font-Names="Tahoma" Font-Size="11px" NextMonthText="." PrevMonthText="." SelectMonthText="»" SelectWeekText="›" CssClass="myCalendar" CellPadding="0">
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

       <div class="col-12 mt-3">
        <div class="row">

            
        <div class="col-12"> 
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
                      <a href="#" class="btn link d-flex" style="font-size: 12px; text-decoration:none ;"> 
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
                      <a href="#" class="btn link d-flex" style="font-size: 12px; text-decoration:none ;"> 
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
              <div class="tab-pane fade d-flex" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">

                  <%for (int i = 0; i < 10; i++)
                          foreach (var cita in C)
                      {%>
                 
                  <div class="note-card">
                      <a href="#" class="btn link d-flex" style="font-size: 12px; text-decoration:none ;"> 
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
       </div>
            
        </div>

</asp:Content>

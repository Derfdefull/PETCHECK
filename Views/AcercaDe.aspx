<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Main.Master" AutoEventWireup="true" CodeBehind="AcercaDe.aspx.cs" Inherits="PETCHECK.Views.AcercaDe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container p-5 bg-light rounded shadow">
        <img src="../IMG/LOGO.png" />
        <h2> PETCHECK, SOFTWARE VETERINARIO </h2>
        <p style="  text-align: justify;"> 
        Nace como una solución a las distintas problemáticas que se presentan regularmente en las clínicas veterinarias, 
        como los son, registro manual de mascotas y clientes, es decir, tomarse los datos de la mascota, 
        se necesita conocer si existe un expediente de dicha mascota para así poder dar seguimiento al tratamiento adecuado 
        según la dolencia de la mascota, obtener el registro de vacunas, programar citas, redactar diagnósticos, la problemática
        radica en que todo lo anterior se realiza de forma manual, se poseen registros en libros, agendas, cuadernos, no se lleva 
        un control ordenado de la información, por lo tanto al momento que está es requerida se pierde tiempo importante que podría 
        ser dedicado a otras tareas dentro de la clínica, PETCHECK tiene como objetivo proporcionar una mejor gestión y control de 
        los procedimientos actuales dentro de las clínicas del país, para poder cubrir las necesidades de nuestra o nuestras mascotas, 
        en todas sus facetas de salud.</p>
        <hr />

        <div class="row " >
                <div class="col-4">
                    <div class="img-profile rounded-circle" style="border: solid 2px var(--main-color);">
                        <img src="../IMG/Logof.png" class="img-about" />
                    </div>
                    <p style="text-align: justify;" class="text-center">UNIVERSIDAD CATOLICA DE EL SALVADOR </p>
                </div>
                <div class="col-4">
                    <div class="img-profile rounded-circle" style="border: solid 2px var(--main-color);">
                        <img src="../IMG/LOGOCORP.png" class="img-about"/>
                    </div>
                    <p style="text-align: justify;" class="text-center"> SOFT-CORP - 2020 </p>
                </div>


                <div class="col-4">
                    <div class="img-profile rounded-circle" style="border: solid 2px var(--main-color);">
                        <img src="../IMG/PETC.png" class="img-about"  />
                    </div>
                </div>


             </div>

        <hr />
        <h2> NUESTRO EQUIPO </h2>
        <br />
        <div class="row">
            <div class="col-4">
                <div class="img-profile rounded-circle" style="border: solid 2px var(--main-color);">
                    <img src="../IMG/ERICK.png" class="img-about" />
                </div>
                <p style="text-align: justify;">Director y Estudiante de cuarto año de Ingeniería en Sistemas Informáticos de la Universidad Católica de El Salvador </p>
            </div>
            <div class="col-4">
                <div class="img-profile rounded-circle" style="border: solid 2px var(--main-color);">
                    <img src="../IMG/GIOVA.jpg" class="img-about"/>
                </div>
                <p style="text-align: justify;">Auditor y Estudiante de cuarto año de Ingeniería en Sistemas Informáticos de la Universidad Católica de El Salvador </p>
            </div>
            <div class="col-4">
                <div class="img-profile rounded-circle" style="border: solid 2px var(--main-color);">
                    <img src="../IMG/ISAB.jpg" class="img-about"/>
                </div>
                <p style="text-align: justify;">Control de Calidad y Estudiante de cuarto año de Ingeniería en Sistemas Informáticos de la Universidad Católica de El Salvador </p>
            </div>


        </div>

        <hr />
                
        <br />
        <p class="text-center font-weight-bolder"> Copyright © PETCHECK 2020 - Producto de SOFT-CORP </p>
    </div>

</asp:Content>

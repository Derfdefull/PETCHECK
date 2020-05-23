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
        <h2> MISIÓN </h2>
        <p style=" text-align: justify;"> 
        Ofrecer solución a las problemáticas de registro y manejo de información dentro de las clínicas veterinarias del país, para 
        brindar un mejor servicio, enfocándonos en conseguir el bienestar más óptimo posible de los animales, y no menos importante,
        el de los dueños.</p>
        <hr />
        <h2> VISIÓN </h2>
        <p style="text-align: justify;"> 
        Ofrecer y realizar servicios veterinarios de gran calidad y alto nivel técnico, dirigidos a nuestros clientes y a sus mascotas
        para satisfacer con excelencia sus necesidades mediante una mejor gestión de su información.</p>
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

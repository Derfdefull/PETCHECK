﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteClientes.aspx.cs" Inherits="PETCHECK.Reports.ReporteClientes" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .bg-white{
            background-color: snow;
            display: block;
            margin: 0 auto;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="">

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" CssClass="bg-white" BackColor="White" ClientIDMode="AutoID" Height="600px" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="1200px" ZoomMode="FullPage">
                <LocalReport ReportPath="Models\Clientes.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSetClientes" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
                
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_petcheckConnectionString %>" SelectCommand="SELECT [Nombre], [Direccion], [Telefono] FROM [Usuario] WHERE ([Alias] IS NULL)"></asp:SqlDataSource>
                
        </div>
        
    </form>
</body>
</html>

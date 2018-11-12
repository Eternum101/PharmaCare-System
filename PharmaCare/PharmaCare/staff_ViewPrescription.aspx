<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="staff_ViewPrescription.aspx.cs" Inherits="PharmaCare.staff_ViewPrescription" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
     <div>
        <!-- Page Heading -->
        <h1 class="">View Prescription</h1>

        <!-- Patient Name lbl and txt -->
        <h3>Patient Name: </h3>
        <div class="txtPatientName">
            <asp:TextBox ID="TextBox6" Text="" runat="server" />

            <div class="staff_SearchButtonAlign">
                <input type=button class="searchButtonVisuals" onClick="parent.location=''" value='Search'>
            </div>
        </div>

        <!-- Top Buttons -->
        <div class="staff_ButtonAlign">
            <input type=button class="buttonVisuals_Spacing" onClick="parent.location='staff_PrintPrescription.aspx'" value='Print'>
            <input type=button class="buttonVisuals_Spacing" onClick="parent.location=''" value='Submit'>
        </div>
        <!-- END Top Buttons -->

    </div>

    <!-- Bordered div -->
    <div class="globalBorder">
        <div class="leftTextboxDiv">
        <div class="left">
            <h4>Prescription Details: </h4>
        </div>

        <!-- Bottom Textbox -->
        <asp:TextBox ID="txtStaffPrescription" class="staffPrescription_TextBox" Text="" runat="server" />
    </div>
        
    </div>
    <!-- END Bordered div -->

    <!-- Bottom Div -->
    
    <!-- END Bottom Div -->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
</asp:Content>

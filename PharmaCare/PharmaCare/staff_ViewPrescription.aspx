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
            <asp:TextBox ID="TextBox6" class="search_textboxes" Text="" runat="server" />

            <div class="staff_SearchButtonAlign">
                <input type=button class="searchButtonVisuals" onClick="parent.location=''" value='Search'>
            </div>
        </div>

        <!-- Top Buttons -->
        
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

    <div class="float_center">
        <ul class="child">
          <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Print" runat="server" ID="btnPrint" /></li>
          <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Submit" runat="server" ID="btnSubmit3"/></li>
        </ul>
    </div>

    <!-- Bottom Div -->
    
    <!-- END Bottom Div -->
</asp:Content>

<asp:Content ID="footer" ContentPlaceHolderID="footerContainer" runat="server"> 
    <div class="float_center">
        <ul class="child">
          <li><p>14/11/18</p></li>
          <li><p>Billy Bob</p></li>
          <li><p>John Doe</p></li>
          <li><p>Silly Sam</p></li>
        </ul>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
</asp:Content>

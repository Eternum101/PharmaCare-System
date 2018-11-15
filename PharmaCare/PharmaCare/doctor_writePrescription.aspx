﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="doctor_writePrescription.aspx.cs" Inherits="PharmaCare.writePrescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server"> Write Prescriptions
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
    
    <div>
        <!-- Page Heading -->
        <h1 class="writePrescriptionHeading">Write Prescription</h1>

        <!-- Patient Name lbl and txt -->
        <h3>Patient Name: </h3>
        <div class="txtPatientName">
            <asp:TextBox ID="TextBox6" Text="" runat="server" />
            
            <div class="doctor_SearchButtonAlign">
                <input type=button class="searchButtonVisuals" onClick="parent.location=''" value='Search'>
            </div>
        </div>

        <!-- Top Buttons -->
        <div class="doctor_ButtonAlign">
            <input type=button class="buttonVisuals_Spacing" onClick="parent.location=''" value='Check Cocktail'>
            <input type=button class="buttonVisuals_Spacing" onClick="parent.location=''" value='Submit'>
        </div>
        
        <!-- END Top Buttons -->

    </div>

    <!-- Bordered div -->
    <div class="globalBorderRound">

        <!-- Left Div -->
        <div class="leftTextboxDiv">
            <h4>Prescription ID: </h4>
            <asp:TextBox ID="txtPrescription" Text="" runat="server" />

            <h4>Patient ID: </h4>
            <asp:TextBox ID="txtPatent" Text="" runat="server" />

            <h4>Doctor ID: </h4>
            <asp:TextBox ID="TextBox3" Text="" runat="server" />

            
        </div>

        <!-- Middle Div -->

        <div class="leftTextboxDiv">
            <h4>Date: </h4>
            <asp:TextBox ID="TextBox8" Text="" runat="server" />

            <h4>Patient Name: </h4>
            <asp:TextBox ID="TextBox13" Text="" runat="server" />

            <h4>Patient Type: </h4>
            <asp:TextBox ID="TextBox14" Text="" runat="server" />

            
        </div>

        <!-- Right Div -->
        <div class="leftTextboxDiv">
            <h4>Frequency: </h4>
            <asp:TextBox ID="TextBox2" Text="" runat="server" />

            <h4>Start Date: </h4>
            <asp:TextBox ID="TextBox5" Text="" runat="server" />

            <h4>End Date: </h4>
            <asp:TextBox ID="TextBox15" Text="" runat="server" />
        </div>

        <div class="leftTextboxDiv">
            <h4>Drug Name: </h4>
            <asp:DropDownList CssClass="dropDown" ID="TextBox4" runat="server">
                <asp:ListItem Enabled="true" Text="Drug 1" Value="-1"></asp:ListItem>
                <asp:ListItem Text="Drug 2" Value="1"></asp:ListItem>
                <asp:ListItem Text="Drug 3" Value="2"></asp:ListItem>
            </asp:DropDownList>

            <h4>Dose: </h4>
            <asp:TextBox ID="txtDose" Text="" runat="server" />
        </div>
    </div>
    <!-- END Bordered div -->

    <!-- Bottom Div -->
    <div class="extraSpace">
        <div class="leftTextboxDiv">
            <div class="left">
                <h4>Prescription Details: </h4>
            </div>
            <!-- Bottom Buttons -->
            <div class="prescriptionDetailButtons">
                <div>
                    <input type=button class="buttonVisuals" onClick="parent.location=''" value='Delete Line'>
                    <input type=button class="buttonVisualsDark" onClick="parent.location=''" value='Modify Line'>
                    <input type=button class="buttonVisuals" onClick="parent.location=''" value='Add Line'>
                </div>
            </div>
            <!-- END Bottom Buttons -->

            <!-- Bottom Textbox -->
            <asp:TextBox ID="TextBox9" class="bigTextBox" Text="" runat="server" />
        </div>
    </div>
    <!-- END Bottom Div -->

</asp:Content>

<asp:Content ID="footer" ContentPlaceHolderID="footerContainer" runat="server"> 
    <div class="float_center">
        <ul class="child">
          <li><p>14/11/18</p></li>
          
          <li><p>Jakob Farrow</p></li>
          <li><p>455089250</p></li>
          
        </ul>
        <div class="clear"></div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
</asp:Content>

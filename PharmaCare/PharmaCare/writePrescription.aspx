<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="writePrescription.aspx.cs" Inherits="PharmaCare.writePrescription" %>

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
        </div>

        <!-- Top Buttons -->
        <div class="cocktailButton">
            <input type=button class="buttonVisuals" onClick="parent.location=''" value='Check Cocktail'>
        </div>

        <div class="submitButton">
            <input type=button class="buttonVisuals" onClick="parent.location=''" value='Submit'>
        </div>
        <!-- END Top Buttons -->

    </div>

    <!-- Bordered div -->
    <div class="globalBorder">

        <!-- Left Div -->
        <div class="leftTextboxDiv">
            <h4>Prescription ID: </h4>
            <asp:TextBox ID="prescriptionID" Text="" runat="server" />

            <h4>Patient ID: </h4>
            <asp:TextBox ID="patientID" Text="" runat="server" />

            <h4>Doctor ID: </h4>
            <asp:TextBox ID="TextBox3" Text="" runat="server" />

            <h4>Drug Name: </h4>
            <asp:DropDownList CssClass="dropDown" ID="TextBox4" runat="server">
                <asp:ListItem Enabled="true" Text="Drug 1" Value="-1"></asp:ListItem>
                <asp:ListItem Text="Drug 2" Value="1"></asp:ListItem>
                <asp:ListItem Text="Drug 3" Value="2"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <!-- Middle Div -->

        <div class="leftTextboxDiv">
            <h4>Date: </h4>
            <asp:TextBox ID="TextBox8" Text="" runat="server" />

            <h4>Patient Name: </h4>
            <asp:TextBox ID="TextBox13" Text="" runat="server" />

            <h4>Patient Type: </h4>
            <asp:TextBox ID="TextBox14" Text="" runat="server" />

            <h4>Dose: </h4>
            <asp:TextBox ID="TextBox1" Text="" runat="server" />
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
    </div>
    <!-- END Bordered div -->

    <!-- Bottom Div -->
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
    <!-- END Bottom Div -->

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
</asp:Content>

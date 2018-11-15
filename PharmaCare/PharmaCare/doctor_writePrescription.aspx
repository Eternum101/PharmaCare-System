<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="doctor_writePrescription.aspx.cs" Inherits="PharmaCare.writePrescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server"> Write Prescriptions
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
    
    <div>
        <!-- Page Heading -->
        <h1 class="writePrescriptionHeading">Write Prescription<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT * FROM [Drugs]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
        </h1>

        <!-- Patient Name lbl and txt -->
        <h3>Patient Name: </h3>
        <div class="txtPatientName">
            <asp:TextBox ID="TextBox6" Text="" runat="server" />
            
            <div class="doctor_SearchButtonAlign">
                <input type=button class="searchButtonVisuals" onClick="parent.location=''" value='Search'>
            </div>
        </div>

    </div>

    <!-- Bordered div -->
    <div class="globalBorderRound">

        <!-- Left Div -->
        <div class="leftTextboxDiv">
            <h4>Prescription ID: </h4>
            <asp:TextBox ID="txtPrescriptionID" Text="" DataSourceID="SqlDataSource2"
                DataTextField="PrescriptionID" DataValueField="PrescriptionID"  runat="server" />

            <h4>Patient ID: </h4>
            <asp:TextBox ID="txtPatentID" Text="" DataSourceID="SqlDataSource2"
                DataTextField="PatientID" DataValueField="PatientID" runat="server" />

            <h4>Doctor ID: </h4>
            <asp:TextBox ID="txtDoctorID" Text="" DataSourceID="SqlDataSource2"
                DataTextField="DoctorID" DataValueField="DoctorID" runat="server" />

            
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
            <h4>Time Per Day: </h4>
            <asp:TextBox ID="TextBox2" Text="" runat="server" />

            <h4>Start Date: </h4>
            <asp:TextBox ID="TextBox5" Text="" runat="server" />

            <h4>End Date: </h4>
            <asp:TextBox ID="TextBox15" Text="" runat="server" />
        </div>

        <div class="leftTextboxDiv">
            <h4>Drug Name: </h4>
            <asp:DropDownList CssClass="dropDown" ID="ddlDrugName" DataSourceID="SqlDataSource1"
                DataTextField="DrugName" DataValueField="DrugID" runat="server">
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
                <h4>Additional Information: </h4>
            </div>
            <!-- Bottom Buttons -->

            <!--<div class="prescriptionDetailButtons">
                <div>
                    <input type=button class="buttonVisuals" onClick="parent.location=''" value='Delete Line'>
                    <input type=button class="buttonVisualsDark" onClick="parent.location=''" value='Modify Line'>
                    <input type=button class="buttonVisuals" onClick="parent.location=''" value='Add Line'>
                </div>
            </div>-->



            <!-- END Bottom Buttons -->

            <!-- Bottom Textbox -->
            <asp:TextBox ID="TextBox9" class="bigTextBox" Text="" runat="server" />
        </div>
    </div>
    <!-- END Bottom Div -->

    

    <div class="float_center">
        <ul class="child">
            <!--
          <li><p>14/11/18</p></li>  
          <li><p>Jakob Farrow</p></li>
          <li><p>455089250</p></li>
            -->
          
          <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Check Cocktail" runat="server" ID="btnCheckCocktail" /></li>
          <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Cancel" runat="server" ID="btnCancel" /></li>
          <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Modify" runat="server" ID="btnModify" /></li>
          <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Submit" runat="server" ID="btnSubmit2" OnClick="btnSubmit_Click" /></li>
        </ul>
        <div class="clear"></div>
    </div>
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

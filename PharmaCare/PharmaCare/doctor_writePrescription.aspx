<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="doctor_writePrescription.aspx.cs" Inherits="PharmaCare.writePrescription" EnableEventValidation = "false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server"> Write Prescriptions
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
    
    <div>
        <!-- Page Heading -->
        <h1 class="writePrescriptionHeading">Write Prescription
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" 
                SelectCommand="SELECT Patients.Name, Prescriptions.PrescriptionDate, Prescriptions.PrescriptionStatus, 
                Doctors.DoctorName, Drugs.DrugName, Prescriptions.FirstTime, Prescriptions.LastTime, Prescriptions.TimesPerDay,
                Prescriptions.DrugDose, Prescriptions.StatusOfDose, Prescriptions.AdditionalInformation FROM Patients INNER JOIN Prescriptions 
                ON Patients.PatientID = Prescriptions.PatientID INNER JOIN Doctors 
                ON Doctors.DoctorID = Prescriptions.DoctorID INNER JOIN Drugs ON Drugs.DrugID = Prescriptions.DrugID"></asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" 
                SelectCommand="SELECT [DrugID], [DrugName] FROM [Drugs]"></asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" 
                SelectCommand="INSERT Patients.Name, Prescriptions.PrescriptionDate, Prescriptions.PrescriptionStatus, 
                Doctors.DoctorName, Drugs.DrugName, Prescriptions.FirstTime, Prescriptions.LastTime, Prescriptions.TimesPerDay,
                Prescriptions.DrugDose, Prescriptions.StatusOfDose, Prescriptions.AdditionalInformation FROM Patients INNER JOIN Prescriptions 
                ON Patients.PatientID = Prescriptions.PatientID INNER JOIN Doctors 
                ON Doctors.DoctorID = Prescriptions.DoctorID INNER JOIN Drugs ON Drugs.DrugID = Prescriptions.DrugID"></asp:SqlDataSource>
        </h1>

        <!-- Patient Name lbl and txt -->
        <h3>Patient Name: </h3>
        <div class="txtPatientName">
            <asp:TextBox ID="txtPatientNameInput" class="search_textboxes" runat="server" OnTextChanged="txtPatientNameInput_TextChanged" />
            
            <div class="doctor_SearchButtonAlign">
                <asp:Button ID="btnPatientSearch" class="searchButtonVisuals" Text="Search" runat="server" OnClick="btnPatientSearch_Click" />
            </div>
        </div>

    </div>

    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
        <div class="left">
            <h4 class="lblPrescriptionTable">Prescription Details:</h4><br />

        </div>
            <asp:GridView ID="dgvDoctorPrescriptions" runat="server" DataSourceID="SqlDataSource1" 
                AllowSorting="True" CellPadding="3" Height="200px" Width="1000px" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" GridLines="Horizontal"
                OnRowDataBound="dgvDoctorPrescriptions_RowDataBound" OnSelectedIndexChanged="OnSelectedIndexChanged" >
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#000000" />
                <HeaderStyle BackColor="#FF5454" Font-Bold="True" Font-Size="13px" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#000000" HorizontalAlign="Right" />
                <RowStyle BackColor="#FFCBCB" ForeColor="#000000" />
                <SelectedRowStyle BackColor="#565656" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#FF5454" />
                <SortedDescendingCellStyle BackColor="#F7F7F7" />
                <SortedDescendingHeaderStyle BackColor="#FF5454" />

            </asp:GridView>
        </div>
    </div>

    <!-- Bordered div -->
    <div class="globalBorderRound">

        <!-- Left Div -->
        <div class="leftTextboxDiv">

            <h4>Patient Name: 
                </h4>
            <asp:TextBox ID="txtPatientName" CssClass="entry_textboxes" Width="150px" runat="server" />

                <asp:RequiredFieldValidator ID="rfvPatientName" runat="server" ControlToValidate="txtPatientName"
                    CssClass="validatorText" ErrorMessage="Patient Name Required"
                    ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>

            <h4>Doctor Name: 
                </h4>
            <asp:TextBox ID="txtDoctorName" CssClass="entry_textboxes" Width="150px" runat="server" />
            
                <asp:RequiredFieldValidator ID="rfvDoctorName" runat="server" ControlToValidate="txtDoctorName" 
                    CssClass="validatorText" ErrorMessage="Doctor Name Required" 
                    ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>
            
        </div>

        <!-- Middle Div -->

        <div class="leftTextboxDiv">
            <h4>Date: </h4>
            <asp:TextBox ID="txtDate" CssClass="entry_textboxes" Width="150px" runat="server" />

            <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" 
                CssClass="validatorText" ErrorMessage="Date Required" 
                ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>

            <h4>First Time: </h4>
            <asp:TextBox ID="txtStartDate" CssClass="entry_textboxes" Width="150px" runat="server" />

            
            
            <asp:RequiredFieldValidator ID="rfvFirstTime" runat="server" ControlToValidate="txtStartDate" 
                CssClass="validatorText" ErrorMessage="First Time Required" 
                ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>

            
            
        </div>

        <!-- Right Div -->
        <div class="leftTextboxDiv">
            
            <h4>Drug Name: </h4>
            <asp:DropDownList CssClass="entry_textboxes" ID="ddlDrugName" Width="150px" DataSourceID="SqlDataSource2" 
                DataValueField = "DrugID" DataTextField = "DrugName" runat="server">
                <asp:ListItem Enabled="true" Value="-1"></asp:ListItem>
            </asp:DropDownList>

            <h4>Last Time: </h4>
            <asp:TextBox ID="txtEndDate" CssClass="entry_textboxes" Width="150px" runat="server" />

            
            
            <asp:RequiredFieldValidator ID="rfvLastTime" runat="server" ControlToValidate="txtEndDate" 
                CssClass="validatorText" ErrorMessage="Last Time Required" 
                ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>

            
            
        </div>

        <div class="leftTextboxDiv">
            <h4>Time Per Day: </h4>
            <asp:TextBox ID="txtTimePerDay" CssClass="entry_textboxes" Width="150px" runat="server" />

            <asp:RequiredFieldValidator ID="rfvTimePerDay" runat="server" ControlToValidate="txtTimePerDay"
                CssClass="validatorText" ErrorMessage="Time Per Day Required" 
                ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>

            <h4>Dose: </h4>
            <asp:TextBox ID="txtDose" CssClass="entry_textboxes" Width="150px" runat="server" />
            <asp:RequiredFieldValidator ID="rfvDose" runat="server" ControlToValidate="txtDose" 
                CssClass="validatorText" ErrorMessage="Dose Required" 
                ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>
        </div>

        <div class="leftTextboxDiv">
            
            <h4>Status: </h4>
            <asp:TextBox ID="txtPrescriptionStatus" CssClass="entry_textboxes" Width="150px" runat="server" />

            <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ControlToValidate="txtPrescriptionStatus" 
                CssClass="validatorText" ErrorMessage="Status Required" 
                ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>

            <h4>Dose Status: </h4>
            <asp:TextBox ID="txtDoseStatus" CssClass="entry_textboxes" Width="150px" runat="server" />
            <asp:RequiredFieldValidator ID="rfvDoseStatus" runat="server" ControlToValidate="txtDoseStatus" 
                CssClass="validatorText" ErrorMessage="Dose Status Required"
                ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>
        </div>
    </div>
    <!-- END Bordered div -->

    <!-- Bottom Div -->
    <div class="extraSpace">
        <div class="leftTextboxDiv">
            <div class="left">
                <h4>Additional Information:</h4>
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
            <asp:TextBox ID="txtAdditionalInformation" class="bigTextBox" runat="server" />
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
          <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Clear" runat="server" ID="btnClear" OnClick="btnClear_Click" /></li>
          <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Modify" runat="server" ID="btnModify" ValidationGroup="PrescriptionValidation" /></li>
          <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Submit" runat="server" ID="btnSubmit2" OnClick="btnSubmit_Click" /></li>
        </ul>
    </div>
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

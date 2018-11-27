<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="doctor_writePrescription.aspx.cs" Inherits="PharmaCare.writePrescription" EnableEventValidation = "false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server"> Write Prescriptions
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <div>
        <!-- Page Heading -->
        <h1 class="writePrescriptionHeading">Write Prescription</h1>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" 
                SelectCommand="SELECT Prescriptions.PrescriptionID, Patients.Name, Prescriptions.PrescriptionDate, Doctors.DoctorName, 
                Prescriptions.StatusOfPrescription FROM Patients INNER JOIN Prescriptions 
                ON Patients.PatientID = Prescriptions.PatientID INNER JOIN Doctors 
                ON Doctors.DoctorID = Prescriptions.DoctorID"></asp:SqlDataSource>

   
        <div class="searchContainer">
            <ul class="childSearch">
              <li class="searchPosition"><h3>Patient Name: </h3></li>
              <li class="searchPosition"><asp:TextBox ID="txtPatientNameInput" class="search_textboxes2" runat="server"/></li>
              <li class="searchPositionSmaller"><asp:Button ID="btnPatientSearch" class="btnSearchPosition" Text="Search" runat="server" OnClick="btnPatientSearch_Click" ValidationGroup="SearchValidation" />
                <asp:RequiredFieldValidator ID="rfvSearch" runat="server" ControlToValidate="txtPatientNameInput" CssClass="text-danger" ErrorMessage="Patient Name Required" ValidationGroup="SearchValidation"></asp:RequiredFieldValidator></li>
            </ul>
        </div>
    </div>
    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
        <div class="left">
            <asp:Label Text="Prescription Details" CssClass="lblPrescriptionTable" runat="server" /><br />

        </div>
            <asp:GridView ID="dgvDoctorPrescriptions" runat="server" DataSourceID="SqlDataSource1" 
                AllowSorting="True" CellPadding="3" Width="1000px" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellSpacing="2" GridLines="Horizontal"
                OnRowDataBound="dgvDoctorPrescriptions_RowDataBound" OnSelectedIndexChanged="OnSelectedIndexChanged" >
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#000000" />
                <HeaderStyle BackColor="#FF5454" Font-Bold="True" Font-Size="15px" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#000000" HorizontalAlign="Right" />
                <RowStyle BackColor="#FFCBCB" ForeColor="#000000" />
                <SelectedRowStyle BackColor="#666666" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#FF5454" />
                <SortedDescendingCellStyle BackColor="#F7F7F7" />
                <SortedDescendingHeaderStyle BackColor="#FF5454" />

            </asp:GridView>
        </div>
    </div>

    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
        <div class="left">
            <asp:Label Text="Drug Details" CssClass="lblPrescriptionTable" runat="server" /><br />

        </div>
            <asp:GridView ID="dgvDrugDetails" runat="server"
                AllowSorting="True" CellPadding="3" Width="1000px" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellSpacing="2" GridLines="Horizontal"
                OnRowDataBound="dgvDoctorPrescriptions_RowDataBound" OnSelectedIndexChanged="OnSelectedIndexChanged" >
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#000000" />
                <HeaderStyle BackColor="#FF5454" Font-Bold="True" Font-Size="11px" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#000000" HorizontalAlign="Right" />
                <RowStyle BackColor="#FFCBCB" ForeColor="#000000" />
                <SelectedRowStyle BackColor="#666666" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#FF5454" />
                <SortedDescendingCellStyle BackColor="#F7F7F7" />
                <SortedDescendingHeaderStyle BackColor="#FF5454" />

            </asp:GridView>
        </div>
    </div>

    <!-- Bordered div -->
    <div class="globalBorderRound">

                <h4 class="lblPrescriptionNumber">Prescription Number: &nbsp;<asp:Label Text="" ID="lblPrescriptionNumber" runat="server" /> </h4><br />
                
        <!-- Left Div -->
        <div class="leftTextboxDiv">
            
            <h4>Patient Name: 
                </h4>
            <asp:TextBox ID="txtPatientName" CssClass="entry_textboxes" Width="150px" runat="server" />
                <asp:RequiredFieldValidator ID="rfvPatientName" runat="server" ControlToValidate="txtPatientName"
                    CssClass="validatorText" ErrorMessage="Patient Name Required"
                    ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>

            
        </div>
        <div class="leftTextboxDiv">
            <h4>Doctor Name: </h4>
            <asp:TextBox ID="txtDoctorName" CssClass="entry_textboxes" Width="150px" runat="server" />
            
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDoctorName" 
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
            
        </div>
        <div class="leftTextboxDiv">
            <h4>Status: </h4>
            <asp:TextBox ID="txtPrescriptionStatus" CssClass="entry_textboxes" Width="150px" runat="server" />

            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrescriptionStatus" 
                CssClass="validatorText" ErrorMessage="Status Required" 
                ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>
            
        </div>

    </div>

    <div class="globalBorderRound">
        <!-- Left Div -->
       

        <!-- Right Div -->
        <div class="leftTextboxDiv">

            <h4>First Time: </h4>
            <asp:TextBox ID="txtStartDate" CssClass="entry_textboxes" Width="150px" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtStartDate" 
                CssClass="validatorText" ErrorMessage="Last Time Required" 
                ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>

            <h4>Last Time: </h4>
            <asp:TextBox ID="txtEndDate" CssClass="entry_textboxes" Width="150px" runat="server" />

            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEndDate" 
                CssClass="validatorText" ErrorMessage="Last Time Required" 
                ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>

            
            
        </div>

        <div class="leftTextboxDiv">
            <h4>Time Per Day: </h4>
            <asp:TextBox ID="txtTimePerDay" CssClass="entry_textboxes" Width="150px" runat="server" />

            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtTimePerDay"
                CssClass="validatorText" ErrorMessage="Time Per Day Required" 
                ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>

             <h4>Drug Form: </h4>
            <asp:TextBox ID="txtDrugForm" CssClass="entry_textboxes" Width="150px" runat="server" />

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDrugForm"
                CssClass="validatorText" ErrorMessage="Time Per Day Required" 
                ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>
        </div>

        <div class="leftTextboxDiv">

            <h4>Dose: </h4>
            <asp:TextBox ID="txtDose" CssClass="entry_textboxes" Width="150px" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtDose" 
                CssClass="validatorText" ErrorMessage="Dose Required" 
                ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>

            <h4>Dose Status: </h4>
            <asp:TextBox ID="txtDoseStatus" CssClass="entry_textboxes" Width="150px" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDoseStatus" 
                CssClass="validatorText" ErrorMessage="Dose Status Required"
                ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>
        </div>

        <div class="leftTextboxDiv">

            <h4>Drug Name: </h4>
            <asp:TextBox ID="txtDrugName" CssClass="entry_textboxes" Width="150px" runat="server" />

            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtDrugName" 
                CssClass="validatorText" ErrorMessage="First Time Required" 
                ValidationGroup="PrescriptionValidation"></asp:RequiredFieldValidator>
        </div>

    </div>

    <!-- END Bordered div -->
    <div class="cocktailWarning">
        <asp:Label Text="" ID="lblCocktailWarning" CssClass="lblcocktailWarning" runat="server" />
    </div>
    <!-- Bottom Div 
    <div class="extraSpace">
        <div class="bigTextBoxDiv">
            <div class="left">
                <h4>Additional Information:</h4>
            </div>
            <asp:TextBox ID="txtAdditionalInformation" class="bigTextBox" runat="server" />
        </div>
    </div>-->
    <!-- END Bottom Div -->
    

    <div class="float_center">
        <ul class="child">
            <!--
          <li><p>14/11/18</p></li>  
          <li><p>Jakob Farrow</p></li>
          <li><p>455089250</p></li>
            -->
          
          <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Check Cocktail" runat="server" ID="btnCheckCocktail" OnClick="btnCheckCocktail_Click" /></li>
          <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Clear" runat="server" ID="btnClear" OnClick="btnClear_Click" /></li>
          <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Cancel" runat="server" ID="btnCancel" OnClick="btnCancel_Click" /></li>
          <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Modify" runat="server" ID="btnModify" ValidationGroup="PrescriptionValidation" OnClick="btnModify_Click" /></li>
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

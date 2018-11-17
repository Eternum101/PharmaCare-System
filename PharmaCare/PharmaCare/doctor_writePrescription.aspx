<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="doctor_writePrescription.aspx.cs" Inherits="PharmaCare.writePrescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server"> Write Prescriptions
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
    
    <div>
        <!-- Page Heading -->
        <h1 class="writePrescriptionHeading">Write Prescription
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" 
                SelectCommand="SELECT Patients.Name, Prescriptions.PrescriptionID, Prescriptions.PrescriptionDate, 
                Prescriptions.DrugID, Prescriptions.PatientID, Prescriptions.DoctorID, Prescriptions.PrescriptionStatus, 
                Prescriptions.DrugDose, Prescriptions.StatusOfDose FROM Patients INNER JOIN Prescriptions 
                ON Patients.PatientID = Prescriptions.PatientID"></asp:SqlDataSource>
        </h1>

        <!-- Patient Name lbl and txt -->
        <h3>Patient Name: </h3>
        <div class="txtPatientName">
            <asp:TextBox ID="txtPatientNameInput" class="search_textboxes" runat="server" />
            
            <div class="doctor_SearchButtonAlign">
                <asp:Button ID="btnPatientSearch" class="searchButtonVisuals" Text="Search" runat="server" OnClick="btnPatientSearch_Click" />
            </div>
        </div>

    </div>

    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
        <div class="left">
            <h4>Prescription Details:</h4><br />

        </div>
            <asp:GridView ID="dgvPrescriptions" runat="server" DataSourceID="SqlDataSource1" 
                AllowSorting="True" CellPadding="5" Height="200px" Width="1000px" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#000000" />
                <HeaderStyle BackColor="#FF5454" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#000000" HorizontalAlign="Right" />
                <RowStyle BackColor="#FFCBCB" ForeColor="#000000" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
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
            <h4>Prescription ID: </h4>
            <asp:TextBox ID="txtPrescriptionID" CssClass="entry_textboxes" runat="server" />

            <h4>Patient ID: </h4>
            <asp:TextBox ID="txtPatientID" CssClass="entry_textboxes" runat="server" />

            <h4>Doctor ID: </h4>
            <asp:TextBox ID="txtDoctorID" CssClass="entry_textboxes" runat="server" />

            
        </div>

        <!-- Middle Div -->

        <div class="leftTextboxDiv">
            <h4>Date: </h4>
            <asp:TextBox ID="txtDate" CssClass="entry_textboxes" runat="server" />

            <h4>Patient Name: </h4>
            <asp:TextBox ID="txtPatientName" CssClass="entry_textboxes" runat="server" />

            <h4>Patient Type: </h4>
            <asp:TextBox ID="txtPatientType" CssClass="entry_textboxes" runat="server" />

            
        </div>

        <!-- Right Div -->
        <div class="leftTextboxDiv">
            <h4>Time Per Day: </h4>
            <asp:TextBox ID="txtTimePerDay" CssClass="entry_textboxes" runat="server" />

            <h4>Start Date: </h4>
            <asp:TextBox ID="txtStartDate" CssClass="entry_textboxes" runat="server" />

            <h4>End Date: </h4>
            <asp:TextBox ID="txtEndDate" CssClass="entry_textboxes" runat="server" />
        </div>

        <div class="leftTextboxDiv">
            <h4>Drug Name: </h4>
            <asp:DropDownList CssClass="entry_textboxes" ID="ddlDrugName" DataSourceID="SqlDataSource1"
                DataTextField="DrugID" DataValueField="DrugID" runat="server">
                <asp:ListItem Enabled="true" Text="Drug 1" Value="-1"></asp:ListItem>
                <asp:ListItem Text="Drug 2" Value="1"></asp:ListItem>
                <asp:ListItem Text="Drug 3" Value="2"></asp:ListItem>
            </asp:DropDownList>

            <h4>Dose: </h4>
            <asp:TextBox ID="txtDose" CssClass="entry_textboxes" runat="server" />
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
            <asp:TextBox ID="TextBox9" class="bigTextBox" runat="server" />
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

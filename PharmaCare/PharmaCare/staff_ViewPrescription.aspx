<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="staff_ViewPrescription.aspx.cs" Inherits="PharmaCare.staff_ViewPrescription" %>

<!--
    Author: Jakob Farrow
    Date: 27/11/18
    Version: 1.0
    Purpose: The purpose for the Staff View Prescription page is to view Outdoor prescriptions within the database and print out the contents
-->

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
     <div>

         <!-- Get SQL connection for the Outdoor Prescription gridview -->
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" 
                SelectCommand="SELECT OPDPrescriptions.PrescriptionID, Patients.Name, Prescriptions.PrescriptionDate, Doctors.DoctorName, 
                Prescriptions.StatusOfPrescription, OPDPrescriptions.FilledandDispatched, OPDPrescriptions.TimeDispatched, 
                OPDPrescriptions.DateDispatched, OPDPrescriptions.IndoorEmergency, OPDPrescriptions.ToFill
                FROM Patients INNER JOIN Prescriptions ON Patients.PatientID = Prescriptions.PatientID INNER JOIN Doctors 
                ON Doctors.DoctorID = Prescriptions.DoctorID INNER JOIN OPDPrescriptions ON 
                Prescriptions.PrescriptionID = OPDPrescriptions.PrescriptionID"></asp:SqlDataSource>

        <!-- Page Heading -->
        <h1 class="">OPD Prescription</h1>

        <!-- Search Features -->
          <div class="searchContainer">
            <ul class="child2">
              <li class="searchPosition"><h3>Patient Name: </h3></li>
              <li class="searchPosition"><asp:TextBox ID="txtPatientNameInput" class="search_textboxes2" runat="server" /></li>
              <li class="searchPositionSmaller"><asp:Button ID="Button1" class="btnSearchPosition" Text="Search" runat="server" OnClick="btnPatientSearch_Click" ValidationGroup="SearchValidation" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPatientNameInput" CssClass="text-danger" ErrorMessage="Patient Name Required" ValidationGroup="SearchValidation"></asp:RequiredFieldValidator></li>
            </ul>

              <div class="lblPatientNameErrorAlignment">
                <asp:Label Text="" ID="lblPatientNameError" CssClass="lblcocktailWarning" runat="server" />
            </div>
          </div>
    </div>

    <!-- Outdoor Prescriptions Gridview -->
    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
        <div class="left">
            <h4 class="lblPrescriptionTable">Prescription Details:</h4><br />

        </div>
            <asp:GridView ID="dgvStaffPrescriptions" runat="server" DataSourceID="SqlDataSource1" 
                AllowSorting="True" CellPadding="3" Width="1000px" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellSpacing="2" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#000000" />
                <HeaderStyle BackColor="#FF5454" Font-Bold="True" Font-Size="12px" ForeColor="#F7F7F7" />
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

    <!-- Bottom Buttons -->
    <div class="float_center">
        <ul class="child">
          <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Clear" runat="server" ID="btnClear" OnClick="btnClear_Click" /></li>
          <li class="btn_li">
              <asp:Button class="buttonVisuals_Spacing" Text="Print" runat="server" 
                  ID="btnPrint" OnClientClick="javascript:window.print();" />
          </li>
        </ul>
    </div>

</asp:Content>

<!-- Footer Content -->
<asp:Content ID="footer" ContentPlaceHolderID="footerContainer" runat="server"> 
    <div class="float_center">
        <ul class="child">
          <li><p>27/11/18</p></li>
          <li><p>Jakob</p></li>
          <li><p>455089250</p></li>
        </ul>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
</asp:Content>

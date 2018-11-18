<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="nurse_ViewPrescription.aspx.cs" Inherits="PharmaCare.nurse_ViewPrescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server"> View Prescriptions
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
    
    <div>
        <!-- Page Heading -->
        <h1 class="writePrescriptionHeading">View Prescription<asp:SqlDataSource ID="SqlDataSourceNurse" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT Patients.Name, Prescriptions.PrescriptionDate, Prescriptions.PrescriptionStatus, 
                Doctors.DoctorName, Drugs.DrugName, Prescriptions.FirstTime, Prescriptions.LastTime, Prescriptions.TimesPerDay,
                Prescriptions.DrugDose, Prescriptions.StatusOfDose, Prescriptions.AdditionalInformation FROM Patients INNER JOIN Prescriptions 
                ON Patients.PatientID = Prescriptions.PatientID INNER JOIN Doctors 
                ON Doctors.DoctorID = Prescriptions.DoctorID INNER JOIN Drugs ON Drugs.DrugID = Prescriptions.DrugID"></asp:SqlDataSource>
        </h1>

        <!-- Patient Name lbl and txt -->
        <h3>Patient Name: </h3>
        <div class="txtPatientName">
            <asp:TextBox ID="txtNursePatientSearch" class="search_textboxes" Text="" runat="server" />
            
            <div class="doctor_SearchButtonAlign">
                <asp:Button ID="btnNursePatientSearch" class="searchButtonVisuals" Text="Search" runat="server" OnClick="btnNursePatientSearch_Click" />
            </div>
        </div>

    </div>

    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
            <h4>Patient Prescriptions: </h4><br />
            <asp:GridView ID="dgvNursePrescriptions" runat="server" DataSourceID="SqlDataSourceNurse" 
                AllowSorting="True" CellPadding="4" Height="294px" Width="1000px" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#000000" />
                <HeaderStyle BackColor="#FF5454" Font-Bold="True" Font-Size="13px" ForeColor="#F7F7F7" />
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

    <div class="float_center">
        <ul class="child">        
          <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Clear" runat="server" ID="btnClear" OnClick="btnClear_Click" /></li>
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

<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="staff_ViewPrescription.aspx.cs" Inherits="PharmaCare.staff_ViewPrescription" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
     <div>

         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" 
                SelectCommand="SELECT Patients.Name, Prescriptions.PrescriptionDate, Prescriptions.PrescriptionStatus, 
                Doctors.DoctorName, Drugs.DrugName, Prescriptions.FirstTime, Prescriptions.LastTime, Prescriptions.TimesPerDay,
                Prescriptions.DrugDose, Prescriptions.StatusOfDose, Prescriptions.AdditionalInformation FROM Patients INNER JOIN Prescriptions 
                ON Patients.PatientID = Prescriptions.PatientID INNER JOIN Doctors 
                ON Doctors.DoctorID = Prescriptions.DoctorID INNER JOIN Drugs ON Drugs.DrugID = Prescriptions.DrugID"></asp:SqlDataSource>

        <!-- Page Heading -->
        <h1 class="">OPD Prescription</h1>

        <!-- Patient Name lbl and txt -->
        <h3>Patient Name: </h3>

        <div class="txtPatientName">
            <asp:TextBox ID="txtPatientNameInput" class="search_textboxes" Text="" runat="server" />

            <div class="staff_SearchButtonAlign">
                <asp:Button ID="btnPatientSearch" class="searchButtonVisuals" Text="Search" runat="server" OnClick="btnPatientSearch_Click" ValidationGroup="SearchValidation" />
                <asp:RequiredFieldValidator ID="rfvSearch" runat="server" ControlToValidate="txtPatientNameInput" CssClass="text-danger" ErrorMessage="Patient Name Required" ValidationGroup="SearchValidation"></asp:RequiredFieldValidator>
            </div>
        </div>

        <!-- Top Buttons -->
        
        <!-- END Top Buttons -->

    </div>

    <!-- Bordered div -->
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
    <!-- END Bordered div -->

    <div class="float_center">
        <ul class="child">
          <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Clear" runat="server" ID="btnClear" OnClick="btnClear_Click" /></li>
          <li class="btn_li">
              <asp:Button class="buttonVisuals_Spacing" Text="Print" runat="server" 
                  ID="btnPrint" OnClientClick="javascript:window.print();" />
          </li>
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

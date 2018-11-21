<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="pharmacist_viewPrescription.aspx.cs" Inherits="PharmaCare.pharmacist_viewPrescription"  enableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">

    <div>
        <!-- Page Heading -->
        <h1 class="writePrescriptionHeading">View/Dispatch Prescription<asp:SqlDataSource ID="SqlDataSourcePharmacist" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" 
            SelectCommand="SELECT   Prescriptions.PrescriptionID, Patients.Name, Prescriptions.PrescriptionDate, Prescriptions.PrescriptionStatus, 
                Doctors.DoctorName, Drugs.DrugName, Prescriptions.FirstTime, Prescriptions.LastTime, Prescriptions.TimesPerDay,
                Prescriptions.DrugDose, Prescriptions.StatusOfDose FROM Patients INNER JOIN Prescriptions 
                ON Patients.PatientID = Prescriptions.PatientID INNER JOIN Doctors 
                ON Doctors.DoctorID = Prescriptions.DoctorID INNER JOIN Drugs ON Drugs.DrugID = Prescriptions.DrugID"></asp:SqlDataSource>
        </h1>

        <!--Prescription Search-->
        <h3>Patient Name: </h3>
        <div class="txtPatientName">
            <asp:TextBox ID="txtPharmacistPatientSearch" class="search_textboxes" Text="" runat="server" />
            
            <div class="doctor_SearchButtonAlign">
                <asp:Button ID="btnPharmacistPatientSearch" class="searchButtonVisuals" Text="Search" runat="server" OnClick="btnPharmacistPatientSearch_Click" />
            </div>
        </div>

    </div>

     <div class="globalBorderRound">
        <div class="leftTextboxDiv">
            <asp:GridView ID="dgvPharmacistPrescriptions" runat="server" DataSourceID="SqlDataSourcePharmacist" 
                AllowSorting="True" CellPadding="3" Width="1000px" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" GridLines="Horizontal" OnRowDataBound="dgvPharmacistPrescriptions_RowDataBound" OnSelectedIndexChanged="dgvPharmacistPrescriptions_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="PrescriptionID" ValidateRequestMode="Disabled">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="PrescriptionID" HeaderText="PrescriptionID" ReadOnly="True" SortExpression="PrescriptionID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="PrescriptionDate" HeaderText="PrescriptionDate" SortExpression="PrescriptionDate" />
                    <asp:BoundField DataField="PrescriptionStatus" HeaderText="PrescriptionStatus" SortExpression="PrescriptionStatus" />
                    <asp:BoundField DataField="DoctorName" HeaderText="DoctorName" SortExpression="DoctorName" />
                    <asp:BoundField DataField="DrugName" HeaderText="DrugName" SortExpression="DrugName" />
                    <asp:BoundField DataField="FirstTime" HeaderText="FirstTime" SortExpression="FirstTime" />
                    <asp:BoundField DataField="LastTime" HeaderText="LastTime" SortExpression="LastTime" />
                    <asp:BoundField DataField="TimesPerDay" HeaderText="TimesPerDay" SortExpression="TimesPerDay" />
                    <asp:BoundField DataField="DrugDose" HeaderText="DrugDose" SortExpression="DrugDose" />
                    <asp:BoundField DataField="StatusOfDose" HeaderText="StatusOfDose" SortExpression="StatusOfDose" />
                </Columns>
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
    <br/>
    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
           <h4>Prescription ID:</h4> 
            <asp:TextBox ID="txtPrescriptionID" CssClass="entry_textboxes" Width="150px" runat="server" ReadOnly="True"/>
            
            <h4>Drug:</h4>
            <asp:TextBox ID="txtDrugName"  CssClass="entry_textboxes" Width="150px" runat="server" ReadOnly="True" />
            <br /><br />
            <asp:Button ID="btnDispatch" class="searchButtonVisuals" Text="Dispatch" runat="server" OnClick="btnDispatch_Click" ValidationGroup="group"/>
        </div>

        <div>
           <h4>Patient Name:</h4> 
            <asp:TextBox ID="txtPatientName" CssClass="entry_textboxes" Width="150px" runat="server" ReadOnly="True"/>
            
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPatientName" Text="Prescription Not Selected" ValidationGroup="group"></asp:RequiredFieldValidator>
            
            <h4>Status:</h4>
            <asp:TextBox ID="txtStatus"  CssClass="entry_textboxes" Width="150px" runat="server" ReadOnly="True" />
            <br /><br />
            <asp:Button ID="btnRecall" class="searchButtonVisuals" Text="Recall" runat="server" OnClick="btnRecall_Click" ValidationGroup="group"/>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerContainer" runat="server">
    <div class="float_center">
        <ul class="child">
          <li><p>14/11/18</p></li>
          <li><p>Jake Smith</p></li>
          <li><p>461123739</p></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="body" runat="server">
</asp:Content>

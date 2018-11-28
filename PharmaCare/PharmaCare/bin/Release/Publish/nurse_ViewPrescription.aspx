<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="nurse_ViewPrescription.aspx.cs" Inherits="PharmaCare.nurse_ViewPrescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server"> View Prescriptions
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">

<!--
 *Author: Brayden Cantrill 
 *Date: 28/11/18
 *Version: 1.0
 *Purpose: The purpose for the View Prescription page is to display all the current patient prescriptions 
 * and there prescription details. 
-->
    
    <div>
        <!-- Page Heading -->
        <h1 class="writePrescriptionHeading">View Prescription<asp:SqlDataSource ID="SqlDataSourceNurse" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT Prescriptions.PrescriptionID, Patients.Name, Doctors.DoctorName, Prescriptions.PrescriptionDetails, Prescriptions.StatusOfPrescription FROM Doctors INNER JOIN Patients ON Doctors.DoctorID = Patients.DoctorID INNER JOIN Prescriptions ON Doctors.DoctorID = Prescriptions.DoctorID AND Patients.PatientID = Prescriptions.PatientID"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT [LinkID], [DrugName], [DrugForm], [Dose], [FirstTime], [LastTime], [TimesPerDay], [StatusOfDose] FROM [PrescriptionsDetails] WHERE ([LinkID] = @LinkID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblPrescriptionID" Name="LinkID" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </h1>

        <!-- Patient Name lbl and txt -->
        <div class="searchContainer">
            <ul class="childSearch">
                <li class="searchPosition"><h3>Patient Name: </h3></li>
                <li class="searchPosition"><asp:TextBox ID="txtNursePatientSearch" class="search_textboxes2" runat="server" /></li>
                <li class="searchPositionSmaller"><asp:Button ID="btnPharmacistPatientSearch" class="btnSearchPosition" Text="Search" runat="server" OnClick="btnNursePatientSearch_Click" ValidationGroup="SearchValidation" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNursePatientSearch" CssClass="text-danger" ErrorMessage="Patient Name Required" ValidationGroup="SearchValidation"></asp:RequiredFieldValidator></li>
            </ul>

            <div class="lblPatientNameErrorAlignment">
                <asp:Label Text="" ID="lblPatientNameError" CssClass="lblcocktailWarning" runat="server" />
            </div>
        </div>

    </div>

    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
            <h4>Patient Prescriptions: </h4><br />
            <asp:GridView ID="dgvNursePrescriptions" runat="server" DataSourceID="SqlDataSourceNurse" 
                AllowSorting="True" CellPadding="4" Width="1000px" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" GridLines="Horizontal" AutoGenerateColumns="False" DataKeyNames="PrescriptionID" OnSelectedIndexChanged="dgvNursePrescriptions_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="PrescriptionID" HeaderText="Prescription ID" SortExpression="PrescriptionID" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="DoctorName" HeaderText="Doctor Name" SortExpression="DoctorName" />
                    <asp:BoundField DataField="PrescriptionDetails" HeaderText="Prescription Details" SortExpression="PrescriptionDetails" />
                    <asp:BoundField DataField="StatusOfPrescription" HeaderText="Status Of Prescription" SortExpression="StatusOfPrescription" />
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#000000" />
                <HeaderStyle BackColor="#FF5454" Font-Bold="True" Font-Size="13px" ForeColor="#F7F7F7" />
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
            <h4 class="lblPrescriptionTable">Prescription Details: &nbsp;<asp:Label ID="lblPrescriptionID" runat="server" Visible="False" /> </h4><br />
            <asp:GridView ID="dgvPrescriptionDetails" runat="server" DataSourceID="SqlDataSource1" 
                AllowSorting="True" CellPadding="4" Width="1000px" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" GridLines="Horizontal" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="LinkID" HeaderText="LinkID" SortExpression="LinkID" />
                    <asp:BoundField DataField="DrugName" HeaderText="DrugName" SortExpression="DrugName" />
                    <asp:BoundField DataField="DrugForm" HeaderText="DrugForm" SortExpression="DrugForm" />
                    <asp:BoundField DataField="Dose" HeaderText="Dose" SortExpression="Dose" />
                    <asp:BoundField DataField="FirstTime" HeaderText="FirstTime" SortExpression="FirstTime" />
                    <asp:BoundField DataField="LastTime" HeaderText="LastTime" SortExpression="LastTime" />
                    <asp:BoundField DataField="TimesPerDay" HeaderText="TimesPerDay" SortExpression="TimesPerDay" />
                    <asp:BoundField DataField="StatusOfDose" HeaderText="StatusOfDose" SortExpression="StatusOfDose" />
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#000000" />
                <HeaderStyle BackColor="#FF5454" Font-Bold="True" Font-Size="13px" ForeColor="#F7F7F7" />
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
          <li><p>19/11/18</p></li>
          <li><p>Brayden Cantrill</p></li>
          <li><p>454657305</p></li>
        </ul>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="pharmacist_preparationList.aspx.cs" Inherits="PharmaCare.pharmacist_preparationList"  enableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server">
    Preparation List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <!--Name: Jake Smith
    StudentID: 461123739
    Purpose: Preparation List
    Date: 22/11/18
    Known Bugs: -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
     <div>
        <!-- Page Heading -->
        <h1 class="writePrescriptionHeading">Produce Preparation List<asp:SqlDataSource ID="SqlDataSourcePharmaList" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" 
            SelectCommand="SELECT Prescriptions.PrescriptionID, Patients.Name, Doctors.DoctorName, Prescriptions.PrescriptionDate, Prescriptions.StatusOfPrescription FROM Prescriptions INNER JOIN Patients ON Prescriptions.PatientID = Patients.PatientID INNER JOIN Doctors ON Prescriptions.DoctorID = Doctors.DoctorID AND Patients.DoctorID = Doctors.DoctorID WHERE (Prescriptions.StatusOfPrescription = 'Inactive')"></asp:SqlDataSource>
        </h1>
          <asp:SqlDataSource ID="SqlDataSourceDetails" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" 
                SelectCommand="SELECT PrescriptionDetailsID, LinkID, DrugName, DrugForm, Dose, FirstTime, LastTime, TimesPerDay, StatusOfDose FROM PrescriptionsDetails WHERE (LinkID = @LinkID) ORDER BY LinkID, DrugName">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblPrescriptionNumber" DefaultValue="1" Name="LinkID" PropertyName="Text" Type="Int32" />                
                </SelectParameters>
            </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSourceDetails1" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT PrescriptionDetailsID, LinkID, DrugName, DrugForm, Dose, FirstTime, LastTime, TimesPerDay, StatusOfDose FROM PrescriptionsDetails WHERE (StatusOfDose = 'Inactive') ORDER BY LinkID, DrugName" 
                >
             </asp:SqlDataSource>
        <!--Prescription Search-->
         <div class="searchContainer">
            <ul class="childSearch">
              <li class="searchPosition"><h3>Prescription ID: </h3></li>
              <li class="searchPosition"><asp:TextBox ID="txtPharmacistPrescriptionSearch" class="search_textboxes2" runat="server"/></li>
              <li class="searchPositionSmaller"><asp:Button ID="btnPharmacistPrescriptionSearch" class="btnSearchPosition" Text="Search" runat="server" OnClick="btnPharmacistPrescriptionSearch_Click" ValidationGroup="SearchValidation" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPharmacistPrescriptionSearch" CssClass="text-danger" ErrorMessage="Patient ID Required" ValidationGroup="SearchValidation"></asp:RequiredFieldValidator></li>
            </ul>

             <div class="lblPatientNameErrorAlignment">
                <asp:Label Text="" ID="lblPatientNameError" CssClass="lblcocktailWarning" runat="server" />
            </div>
        </div>
    </div>
       <!--Prescription List -->
     <div class="globalBorderRound">
        <div class="leftTextboxDiv">
            <div class="left">
            <h4 class="lblPrescriptionTable">Prescription List</h4><br />
            </div>

            <asp:GridView ID="dgvPharmacistPreparation" runat="server" DataSourceID="SqlDataSourcePharmaList" 
                AllowSorting="True" CellPadding="3" Width="1000px" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" GridLines="Horizontal" 
                OnRowDataBound="dgvPharmacistPreparation_RowDataBound" OnSelectedIndexChanged="dgvPharmacistPreparation_SelectedIndexChanged" 
                AutoGenerateColumns="False" DataKeyNames="PrescriptionID" ValidateRequestMode="Disabled">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="PrescriptionID" HeaderText="PrescriptionID" ReadOnly="True" SortExpression="PrescriptionID" InsertVisible="False" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="DoctorName" HeaderText="DoctorName" SortExpression="DoctorName" />
                    <asp:BoundField DataField="PrescriptionDate" HeaderText="PrescriptionDate" SortExpression="PrescriptionDate" />
                    <asp:BoundField DataField="StatusOfPrescription" HeaderText="StatusOfPrescription" SortExpression="StatusOfPrescription" />
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
       <!--Prescription Details -->
    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
            <div class="left">
            <h4 class="lblPrescriptionTable">Preparation List</h4>
                <h4>Prescription Number: &nbsp;<asp:Label Text="" ID="lblPrescriptionNumber" runat="server" /> </h4><br />

            </div>
            <asp:GridView ID="dgvPrescriptionsDetails" runat="server" DataSourceId="SqlDataSourceDetails"
                AllowSorting="True" CellPadding="3" Width="1000px" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" GridLines="Horizontal" 
                AutoGenerateColumns="False" ValidateRequestMode="Disabled" DataKeyNames="PrescriptionDetailsID" OnRowDataBound="dgvPrescriptionsDetails_RowDataBound" OnSelectedIndexChanged="dgvPrescriptionsDetails_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="PrescriptionDetailsID" HeaderText="DetailsID" SortExpression="PrescriptionDetailsID" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="LinkID" HeaderText="PrescriptionID" SortExpression="LinkID" />
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
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#FF5454" />
                <SortedDescendingCellStyle BackColor="#F7F7F7" />
                <SortedDescendingHeaderStyle BackColor="#FF5454" />
            </asp:GridView>

            <asp:GridView ID="dgvPrescriptionsDetails1" runat="server" DataSourceId="SqlDataSourceDetails1"
                AllowSorting="True" CellPadding="3" Width="1000px" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" GridLines="Horizontal" 
                AutoGenerateColumns="False" ValidateRequestMode="Disabled" DataKeyNames="PrescriptionDetailsID" OnRowDataBound="dgvPrescriptionsDetails1_RowDataBound" OnSelectedIndexChanged="dgvPrescriptionsDetails1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="PrescriptionDetailsID" HeaderText="DetailsID" SortExpression="PrescriptionDetailsID" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="LinkID" HeaderText="PrescriptionID" SortExpression="LinkID" />
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
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#FF5454" />
                <SortedDescendingCellStyle BackColor="#F7F7F7" />
                <SortedDescendingHeaderStyle BackColor="#FF5454" />
            </asp:GridView>
        </div>
    </div>
       <!--Prescription Drug Info -->

    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
           <h4>Prescription ID:</h4> 
            <asp:TextBox ID="txtPrescriptionID" CssClass="entry_textboxes" Width="150px" runat="server" ReadOnly="True"/>
        </div>
        <div class="leftTextboxDiv">
            <h4>Drug Dose:</h4> 
            <asp:TextBox ID="txtDrugDose" CssClass="entry_textboxes" Width="150px" runat="server" ReadOnly="True"/>
        </div>
        <div class="leftTextboxDiv">
           <h4>Drug Name:</h4> 
            <asp:TextBox ID="txtDrugName" CssClass="entry_textboxes" Width="150px" runat="server" ReadOnly="True"/>
        </div>
        <div>
            <h4>Drug Form:</h4> 
            <asp:TextBox ID="TxtDrugForm" CssClass="entry_textboxes" Width="150px" runat="server" ReadOnly="True"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrescription" runat="server" ErrorMessage="Prescription Not Selected" ValidationGroup="group" ControlToValidate="txtPrescriptionID" SetFocusOnError="True" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
    </div>
       <!--Buttons-->
    <div class="float_center">
        <ul class="child">
            <li class="btn_li"><asp:Button ID="btnViewAll" class="buttonVisuals_Spacing" Text="View All" runat="server" OnClick="btnFill_Click"/></li>
            <li class="btn_li"><asp:Button ID="btnPrint" class="buttonVisuals_Spacing" Text="Print" runat="server" OnClick="btnPrint_Click" /></li>
            <li class="btn_li"><asp:Button ID="btnPrepare" class="buttonVisuals_Spacing" Text="Prepare" runat="server" ValidationGroup="group" OnClick="btnPrepare_Click"/></li>


        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerContainer" runat="server">
       <!--Details -->

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

<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="pharmacist_preparationList.aspx.cs" Inherits="PharmaCare.pharmacist_preparationList"  enableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server">
    Preparation List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
     <div>
        <!-- Page Heading -->
        <h1 class="writePrescriptionHeading">Produce Preparation List<asp:SqlDataSource ID="SqlDataSourcePharmaList" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT Prescriptions.PrescriptionID, Drugs.DrugName, Prescriptions.PrescriptionStatus, Prescriptions.DrugDose, Prescriptions.FirstTime, Prescriptions.LastTime, Prescriptions.TimesPerDay, Prescriptions.StatusOfDose, Prescriptions.PrescriptionDate FROM Prescriptions INNER JOIN Drugs ON Prescriptions.DrugID = Drugs.DrugID ORDER BY Drugs.DrugName" 
            ></asp:SqlDataSource>
        </h1>

        <!--Prescription Search-->
         <div class="searchContainer">
            <ul class="childSearch">
              <li class="searchPosition"><h3>Prescription ID: </h3></li>
              <li class="searchPosition"><asp:TextBox ID="txtPharmacistPrescriptionSearch" class="search_textboxes2" runat="server"/></li>
              <li class="searchPositionSmaller"><asp:Button ID="btnPharmacistPrescriptionSearch" class="btnSearchPosition" Text="Search" runat="server" OnClick="btnPharmacistPrescriptionSearch_Click" ValidationGroup="SearchValidation" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPharmacistPrescriptionSearch" CssClass="text-danger" ErrorMessage="Patient Name Required" ValidationGroup="SearchValidation"></asp:RequiredFieldValidator></li>
            </ul>
        </div>

    </div>

    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
            <div class="left">
            <h4 class="lblPreperationListTable">Preperation List</h4><br />

            </div>
            <asp:GridView ID="dgvPharmacistPreparation" runat="server" DataSourceID="SqlDataSourcePharmaList" 
                AllowSorting="True" CellPadding="3" Width="1000px" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" GridLines="Horizontal" AutoGenerateColumns="False" 
                DataKeyNames="PrescriptionID" ValidateRequestMode="Disabled" OnRowDataBound="dgvPharmacistPreparation_RowDataBound" 
                OnSelectedIndexChanged="dgvPharmacistPreparation_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="PrescriptionID" HeaderText="PrescriptionID" ReadOnly="True" SortExpression="PrescriptionID" InsertVisible="False" />
                    <asp:BoundField DataField="DrugName" HeaderText="DrugName" SortExpression="DrugName" />
                    <asp:BoundField DataField="PrescriptionStatus" HeaderText="PrescriptionStatus" SortExpression="PrescriptionStatus" />
                    <asp:BoundField DataField="DrugDose" HeaderText="DrugDose" SortExpression="DrugDose" />
                    <asp:BoundField DataField="FirstTime" HeaderText="FirstTime" SortExpression="FirstTime" />
                    <asp:BoundField DataField="LastTime" HeaderText="LastTime" SortExpression="LastTime" />
                    <asp:BoundField DataField="TimesPerDay" HeaderText="TimesPerDay" SortExpression="TimesPerDay" />
                    <asp:BoundField DataField="StatusOfDose" HeaderText="StatusOfDose" SortExpression="StatusOfDose" />
                    <asp:BoundField DataField="PrescriptionDate" HeaderText="PrescriptionDate" SortExpression="PrescriptionDate" />
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
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrescription" runat="server" ErrorMessage="Prescription is not selected" ValidationGroup="group" ControlToValidate="txtPrescriptionID" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="float_center">
        <ul class="child">
            <li class="btn_li"><asp:Button ID="btnFill" class="buttonVisuals_Spacing" Text="Fill" runat="server" OnClick="btnFill_Click"  ValidationGroup="group"/></li>
        </ul>
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

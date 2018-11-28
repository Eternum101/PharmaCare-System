<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="pharmacist_ViewPrescription.aspx.cs" Inherits="PharmaCare.pharmacist_viewPrescription"  enableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server">
    Dispatch Prescription</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
    
    <div>
       
        <h1 class="writePrescriptionHeading">View Prescription<asp:SqlDataSource ID="SqlDataSourcePharmacist" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" 
            SelectCommand="SELECT Prescriptions.PrescriptionID, Patients.Name, Doctors.DoctorName, Prescriptions.PrescriptionDate, Prescriptions.StatusOfPrescription FROM Prescriptions INNER JOIN Patients ON Prescriptions.PatientID = Patients.PatientID INNER JOIN Doctors ON Prescriptions.DoctorID = Doctors.DoctorID AND Patients.DoctorID = Doctors.DoctorID"></asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSourceDetails" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" 
                SelectCommand="SELECT [LinkID], [DrugName], [DrugForm], [Dose], [FirstTime], [LastTime], [TimesPerDay], [StatusOfDose] FROM [PrescriptionsDetails] WHERE ([LinkID] = @LinkID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblPrescriptionNumber" DefaultValue="1" Name="LinkID" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceOPD" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" 
                SelectCommand="SELECT Prescriptions.PrescriptionID, Patients.Name, Doctors.DoctorName, OPDPrescriptions.[FilledandDispatched], 
                OPDPrescriptions.TimeDispatched, OPDPrescriptions.DateDispatched, OPDPrescriptions.IndoorEmergency, OPDPrescriptions.ToFill, 
                Patients.Type FROM Doctors INNER JOIN Patients ON Doctors.DoctorID = Patients.DoctorID INNER JOIN Prescriptions ON 
                Doctors.DoctorID = Prescriptions.DoctorID AND Patients.PatientID = Prescriptions.PatientID INNER JOIN OPDPrescriptions ON 
                Prescriptions.PrescriptionID = OPDPrescriptions.PrescriptionID"></asp:SqlDataSource>
        </h1>

        <!--Prescription Search-->
        <div class="searchContainer">
            <ul class="childSearch">
              <li class="searchPosition"><h3>Patient Name: </h3></li>
              <li class="searchPosition"><asp:TextBox ID="txtPharmacistPatientSearch" class="search_textboxes2" runat="server" /></li>
              <li class="searchPositionSmaller"><asp:Button ID="btnPharmacistPatientSearch" class="btnSearchPosition" Text="Search" runat="server" OnClick="btnPharmacistPatientSearch_Click" ValidationGroup="SearchValidation" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPharmacistPatientSearch" CssClass="text-danger" ErrorMessage="Patient Name Required" ValidationGroup="SearchValidation"></asp:RequiredFieldValidator></li>
            </ul>
          </div>
    </div>

     <div class="globalBorderRound">
        <div class="leftTextboxDiv">
            <div class="left">
            <h4 class="lblPrescriptionTable">Prescription List</h4><br />

            </div>
            <asp:GridView ID="dgvPharmacistPrescriptions" runat="server" DataSourceID="SqlDataSourcePharmacist" 
                AllowSorting="True" CellPadding="3" Width="1000px" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" GridLines="Horizontal" 
                OnRowDataBound="dgvPharmacistPrescriptions_RowDataBound" OnSelectedIndexChanged="dgvPharmacistPrescriptions_SelectedIndexChanged" 
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
    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
            <div class="left">
            <h4 class="lblPrescriptionTable">Prescription Details</h4>
                <h4>Prescription Number: &nbsp;<asp:Label Text="" ID="lblPrescriptionNumber" runat="server" /> </h4><br />

            </div>
            <asp:GridView ID="dgvPrescriptionsDetails" runat="server" DataSourceId="SqlDataSourceDetails"
                AllowSorting="True" CellPadding="3" Width="1000px" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" GridLines="Horizontal" 
                AutoGenerateColumns="False" ValidateRequestMode="Disabled">
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
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#FF5454" />
                <SortedDescendingCellStyle BackColor="#F7F7F7" />
                <SortedDescendingHeaderStyle BackColor="#FF5454" />
            </asp:GridView>
        </div>
    </div>
    <div><h1 class="writePrescriptionHeading">Print/Dispatch OPD Prescriptions</h1></div><br /><br />
    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
            <div class="left">
            <h4 class="lblPrescriptionTable">Patient Outdoor Prescriptions:</h4><br />
             </div>
        <asp:GridView ID="dgvOPDPrescription" runat="server" DataSourceId="SqlDataSourceOPD"
                AllowSorting="True" CellPadding="3" Width="1000px" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" GridLines="Horizontal" 
                AutoGenerateColumns="False" ValidateRequestMode="Disabled" DataKeyNames="PrescriptionID" OnRowDataBound="dgvOPDPrescription_RowDataBound" OnSelectedIndexChanged="dgvOPDPrescription_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="PrescriptionID" HeaderText="Prescription ID" InsertVisible="False" ReadOnly="True" SortExpression="PrescriptionID" />
                    <asp:BoundField DataField="Name" HeaderText="Patient Name" SortExpression="Name" />
                    <asp:BoundField DataField="DoctorName" HeaderText="Doctor Name" SortExpression="DoctorName" />
                    <asp:BoundField DataField="FilledandDispatched" HeaderText="Filled and Dispatched" SortExpression="FilledandDispatched" />
                    <asp:BoundField DataField="TimeDispatched" HeaderText="Time Dispatched" SortExpression="TimeDispatched" />
                    <asp:BoundField DataField="DateDispatched" HeaderText="Date Dispatched" SortExpression="DateDispatched" />
                    <asp:BoundField DataField="IndoorEmergency" HeaderText="Indoor Emergency" SortExpression="IndoorEmergency" />
                    <asp:BoundField DataField="ToFill" HeaderText="To Fill" SortExpression="ToFill" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
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
    <br /><br />
    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
           <h4>Prescription ID:</h4> 
            <asp:TextBox ID="txtPrescriptionID" CssClass="entry_textboxes" Width="150px" runat="server" ReadOnly="True"/>
            </div>

    <div class="leftTextboxDiv">
        <h4>Patient Name:</h4> 
            <asp:TextBox ID="txtPatientName" CssClass="entry_textboxes" Width="150px" runat="server" ReadOnly="True"/>
            </div>
            
         <div class="leftTextboxDiv">
            <h4>Doctor Name:</h4>
            <asp:TextBox ID="txtDoctorName"  CssClass="entry_textboxes" Width="150px" runat="server" ReadOnly="True" />
         </div>

        <div class="leftTextboxDiv">
           <h4>Filled And Dispatched:</h4> 
            <asp:TextBox ID="txtFilledAndDispatched" CssClass="entry_textboxes" Width="150px" runat="server" ReadOnly="True"/>    
        </div>

        <div class="leftTextboxDiv">
           <h4>Time Dispatched:</h4> 
            <asp:TextBox ID="txtTimeDispatched" CssClass="entry_textboxes" Width="150px" runat="server" ReadOnly="True"/>    
        </div>

        <div class="leftTextboxDiv">
           <h4>Date Dispatched:</h4> 
            <asp:TextBox ID="txtDateDispatched" CssClass="entry_textboxes" Width="150px" runat="server" ReadOnly="True"/>    
        </div>

        <div class="leftTextboxDiv">
           <h4>Indoor Emergency:</h4> 
            <asp:TextBox ID="txtIndoorEmergency" CssClass="entry_textboxes" Width="150px" runat="server" ReadOnly="True"/>    
        </div>
            
        <div class="leftTextboxDiv">
            <h4>To Fill:</h4>
            <asp:TextBox ID="txtToFill"  CssClass="entry_textboxes" Width="150px" runat="server" ReadOnly="True" />
            </div>

        <div class="leftTextboxDiv">
            <h4>Type:</h4>
            <asp:TextBox ID="txtType"  CssClass="entry_textboxes" Width="150px" runat="server" ReadOnly="True" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPatientName" Text="Prescription Not Selected" ValidationGroup="group" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
    </div>

    <div class="float_center">
        <ul class="child">

            <li class="btn_li"><asp:Button ID="btnDispatch" class="buttonVisuals_Spacing" Text="Dispatch" runat="server" OnClick="btnDispatch_Click" ValidationGroup="group"/></li>
            <li class="btn_li"><asp:Button ID="btnRecall" class="buttonVisuals_Spacing" Text="Recall" runat="server" OnClick="btnRecall_Click" ValidationGroup="group"/></li>
            <li class="btn_li"><asp:Button ID="btnPrint" class="buttonVisuals_Spacing" Text="Print" runat="server" ValidationGroup="group" OnClick="btnPrint_Click"/></li>

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
&nbsp;
</asp:Content>

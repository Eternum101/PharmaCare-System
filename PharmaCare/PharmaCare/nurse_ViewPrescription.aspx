<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="nurse_ViewPrescription.aspx.cs" Inherits="PharmaCare.writePrescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server"> View Prescriptions
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
    
    <div>
        <!-- Page Heading -->
        <h1 class="writePrescriptionHeading">View Prescription<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" SelectCommand="SELECT * FROM [Prescriptions]"></asp:SqlDataSource>
        </h1>

        <!-- Patient Name lbl and txt -->
        <h3>Patient Name: </h3>
        <div class="txtPatientName">
            <asp:TextBox ID="txtPatientNameInput" class="search_textboxes" Text="" runat="server" />
            
            <div class="doctor_SearchButtonAlign">
                <asp:Button ID="btnPatientSearch" class="searchButtonVisuals" Text="Search" runat="server" OnClick="btnPatientSearch_Click" />
            </div>
        </div>

    </div>

    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
            <h4>Patient Prescriptions: </h4>
            <asp:GridView ID="dgvPrescriptions" runat="server" AutoGenerateColumns="False" EmptyDataText="No Prescriptions Avaliable For This Patient">
        </asp:GridView>
        </div>
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

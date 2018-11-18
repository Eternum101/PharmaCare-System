<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="doctor.aspx.cs" Inherits="PharmaCare.doctor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server">Doctor
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
    <div>
        <!-- Page Heading -->
        <h1 class="doctorHeading">Doctors</h1>
        <!-- Patient Name lbl and txt -->
        <h3>Doctor Name: </h3>
        <div class="txtPatientName">
            <asp:TextBox ID="TextBox1" class="search_textboxes" Text="" runat="server" />
            
            <div class="doctor_SearchButtonAlign">
                <input type=button class="searchButtonVisuals" onClick="parent.location=''" value='Search'>
            </div>
        </div>

    </div>

    <div class="globalBorderRound">

        <!-- Left Div -->
        <div class="leftTextboxDiv">
            <h4>Doctor ID: </h4>
            <asp:TextBox ID="txtDoctorID" Text="" CssClass="entry_textboxes" runat="server" />

            <h4>Doctor ZipCode: </h4>
                <asp:TextBox ID="txtDoctorZipCode" Text="" CssClass="entry_textboxes" runat="server" />
        </div>

        <!-- Right Div -->
        <div class="leftTextboxDiv">
            <h4>Doctor Name: </h4>
            <asp:TextBox ID="txtDoctorName" Text="" CssClass="entry_textboxes" runat="server" />
            <h4>
                Speciality: </h4>
            <asp:TextBox ID="txtSpeciality" Text=""  CssClass="entry_textboxes" runat="server" />
        </div>

        <div class="leftTextboxDiv">
            <h4>Doctor Address: </h4>
            <asp:TextBox ID="txtDoctorAddress" Text="" CssClass="entry_textboxes" runat="server" />
        </div>

        <div class="leftTextboxDiv">
            <h4>Doctor City: </h4>
            <asp:DropDownList CssClass="entry_textboxes" ID="ddlDoctorCity" runat="server">
                <asp:ListItem Enabled="true" Text="city1" Value="-1"></asp:ListItem>
                <asp:ListItem Text="city2" Value="1"></asp:ListItem>
                <asp:ListItem Text="city3" Value="2"></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>

    <div class="float_center">
        <ul class="child">
            <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Clear" runat="server" ID="btnClear" /></li>
            <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Add" runat="server" ID="btnAdd" /></li>
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
        <div class="clear"></div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
</asp:Content>

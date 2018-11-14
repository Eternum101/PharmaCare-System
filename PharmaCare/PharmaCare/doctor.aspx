<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="doctor.aspx.cs" Inherits="PharmaCare.doctor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server">Doctor
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
    <div>
        <h1 class="doctorHeading">Doctor</h1>
    </div>

    <div class="globalBorder">

        <!-- Left Div -->
        <div class="leftTextboxDiv">
            <h4>Doctor ID: </h4>
            <asp:TextBox ID="prescriptionID" Text="" runat="server" />

            <h4>Doctor Name: </h4>
            <asp:TextBox ID="patientID" Text="" runat="server" />

            <h4>Doctor Address: </h4>
            <asp:TextBox ID="TextBox3" Text="" runat="server" />
        </div>

        <!-- Right Div -->
        <div class="leftTextboxDiv">
            <h4>Doctor City: </h4>
            <asp:DropDownList CssClass="dropDown" ID="TextBox4" runat="server">
                <asp:ListItem Enabled="true" Text="Drug 1" Value="-1"></asp:ListItem>
                <asp:ListItem Text="Drug 2" Value="1"></asp:ListItem>
                <asp:ListItem Text="Drug 3" Value="2"></asp:ListItem>
            </asp:DropDownList>

            <h4>Doctor ZipCode: </h4>
                <asp:TextBox ID="TextBox6" Text="" runat="server" />

            <h4>Speciality: </h4>
            <asp:TextBox ID="TextBox2" Text="" runat="server" />
        </div>
    </div>

    <div class="">
    <asp:Button ID="submit" CssClass="buttonVisuals" Text="Add" runat="server" />
    </div>

</asp:Content>

<asp:Content ID="footer" ContentPlaceHolderID="footerContainer" runat="server"> 
    <div class="float_center">
        <ul class="child">
          <li><p>14/11/18</p></li>
          
          <li><p>Jakob Farrow</p></li>
          <li><p>455089250</p></li>
          
        </ul>
        <div class="clear"></div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="doctor_modifyPrescription.aspx.cs" Inherits="PharmaCare.modifyPrescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
    <h1 class="modifyPrescriptionHeader">Modify Prescription</h1>
        <div class="globalBorder">

        <!-- Left Div -->
        <div class="leftTextboxDiv">
            <h4>Doctor Name: </h4>
        <asp:TextBox ID="TextBox2" Text="" runat="server" />
            <h4>Doctor ID: </h4>
        <asp:TextBox ID="TextBox5" Text="" runat="server" />
            <h4>Drug Name: </h4>
            <asp:DropDownList CssClass="dropDown" ID="TextBox4" runat="server">
                <asp:ListItem Enabled="true" Text="Drug 1" Value="-1"></asp:ListItem>
                <asp:ListItem Text="Drug 2" Value="1"></asp:ListItem>
                <asp:ListItem Text="Drug 3" Value="2"></asp:ListItem>
            </asp:DropDownList>
            <h4>Dose: </h4>
        <asp:TextBox ID="TextBox8" Text="500g" runat="server" />
        </div>

        <!-- First Middle Div -->
        <div class="leftTextboxDiv">
            <h4>Prescription ID: </h4>
            <asp:TextBox ID="TextBox6" Text="" runat="server" />
            <h4>Patient Name: </h4>
            <asp:TextBox ID="TextBox1" Text="" runat="server" />
            <h4>Patient ID: </h4>
            <asp:TextBox ID="TextBox3" Text="" runat="server" />
            <h4>Patient Type: </h4>
            <asp:TextBox ID="TextBox9" Text="" runat="server" />
        </div>

         <!-- Second Middle Div -->
        <div class="leftTextboxDiv">
               <h4>Start Date: </h4>
        <asp:calendar ID="Start_Date" runat="server"/>
            <h4>End Date: </h4>
        <asp:calendar ID="Calendar1" runat="server"/>
           </div>

        <!-- Right Div -->
        <div class="">
            <h4>Perscription Details: </h4>
            <asp:listbox ID="listbox1" runat="server" />
            <asp:Button ID="Button1" Text="Delete line" runat="server" />
            <asp:Button ID="Button2" Text="Modify Line" runat="server" />
            <asp:Button ID="Button3" Text="Add Line" runat="server" />
        </div>
                
    </div>
    <!--
    <div class="submitButton">
    <asp:Button ID="submit" CssClass="submitButtonDirect" Text="Submit" runat="server" />
    </div>
    -->

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
</asp:Content>

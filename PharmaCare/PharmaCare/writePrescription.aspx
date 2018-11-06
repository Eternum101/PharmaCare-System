<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="writePrescription.aspx.cs" Inherits="PharmaCare.writePrescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server"> Write Prescriptions
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
    
    <div>
        <h1>Write Prescription</h1>
    </div>

    <div class="borderTest">

        <!-- Left Div -->
        <div class="leftTextboxDiv">
            <h4>Prescription ID: </h4>
            <asp:TextBox ID="prescriptionID" Text="" runat="server" />

            <h4>Patient ID: </h4>
            <asp:TextBox ID="patientID" Text="" runat="server" />

            <h4>Drug Name: </h4>
            <asp:DropDownList CssClass="dropDown" ID="TextBox4" runat="server">
                <asp:ListItem Enabled="true" Text="Drug 1" Value="-1"></asp:ListItem>
                <asp:ListItem Text="Drug 2" Value="1"></asp:ListItem>
                <asp:ListItem Text="Drug 3" Value="2"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <!-- Right Div -->
        <div class="leftTextboxDiv">
        <h4>Patient Name: </h4>
        <asp:TextBox ID="TextBox1" Text="" runat="server" />

        <h4>Doctor Name: </h4>
        <asp:TextBox ID="TextBox2" Text="" runat="server" />
        </div>

    </div>

    <div class="submitButton">
    <asp:Button ID="submit" CssClass="submitButtonDirect" Text="Submit" runat="server" />
    </div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
</asp:Content>

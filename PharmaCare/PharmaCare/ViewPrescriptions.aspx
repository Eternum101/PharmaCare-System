<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPrescriptions.aspx.cs" Inherits="PharmaCare.ViewPrescriptions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
    <meta name="viewport" content="width=device-width" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <style type="text/css">
        .auto-style2 {
            
            
            /*display: block;
            width: 100%;
            font-size: 1rem;
            color: #495057;
            
            transition: none; 
            border: 1px solid #ced4da;
            margin-left: 0px;
            background-color: #fff;
            margin-top: 0px; */
        }
        </style>
</head>
<body class="body1" >
    <%-- <asp:Label ID="Label2" runat="server">test</asp:Label> --%>
    <div class="container">
        <form id="form1" runat="server" class="form-vertical">
            <div>
            </div>
            <asp:Panel ID="Panel1" runat="server" CssClass="container">
                
                <div class="header" onclick="window.location = 'index.aspx'">
                <asp:Label ID="lblPharmaCare" runat="server" CssClass="mainLabel">PharmaCare</asp:Label>
                </div>

                <div class="doctor">
                    <label class="docLabel">Doctor</label>

                        <asp:Button ID="btnViewPrescription" runat="server" Text="View Prescription" CssClass="button" 
                        content="width=device-width" OnClientClick="btnCheckOut_Click" BorderStyle="None" />
                        <asp:Button ID="Button2" runat="server" Text="NO Click Me" CssClass="button" 
                        OnClientClick="btnCheckOut_Click" BorderStyle="None" />
                        <asp:Button ID="Button3" runat="server" Text="Click ME not him ^" CssClass="button" 
                        OnClientClick="btnCheckOut_Click" BorderStyle="None" />

                </div>

                <div class="staff">
                    <label class="staffLabel">Staff</label>

                        <asp:Button ID="Button1" runat="server" Text="View Prescription" CssClass="button" 
                        content="width=device-width" OnClientClick="btnCheckOut_Click" BorderStyle="None" />
                        <asp:Button ID="Button4" runat="server" Text="NO Click Me" CssClass="button" 
                        OnClientClick="btnCheckOut_Click" BorderStyle="None" />
                        <asp:Button ID="Button5" runat="server" Text="Click ME not him ^" CssClass="button" 
                        OnClientClick="btnCheckOut_Click" BorderStyle="None" />

                </div>

                 <div class="pharmacist">
                    <label class="pharmacistLabel">Pharmacist2</label>

                        <asp:Button ID="Button6" runat="server" Text="View Prescription" CssClass="button" 
                        content="width=device-width" OnClientClick="btnCheckOut_Click" BorderStyle="None" />
                        <asp:Button ID="Button7" runat="server" Text="NO Click Me" CssClass="button" 
                        OnClientClick="btnCheckOut_Click" BorderStyle="None" />
                        <asp:Button ID="Button8" runat="server" Text="Click ME not him ^" CssClass="button" 
                        OnClientClick="btnCheckOut_Click" BorderStyle="None" />

                </div>
 
            </asp:Panel>
        </form>
    </div>
</body>
</html>

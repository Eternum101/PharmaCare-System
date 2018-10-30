<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="PharmaCare.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>PharmaCare</title>
    <meta name="viewport" content="width=device-width" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>

<body>
    <!-- Site Container -->
    <div class="container">
        <form id="form1" runat="server" class="form-horizontal">

            <!-- Navigation Panel -->
            <asp:Panel ID="navPanel" runat="server" CssClass="mainNavbar">

                <!-- PharmaCare Label -->
                <div class="navLabelContainer" onclick="index.aspx">
                    <asp:Label ID="lblPharmaCare" runat="server" CssClass="navLabel">PharmaCare</asp:Label>
                </div>

                <div class="navButtons">
                    <nav role="navigation">
                    <ul>
                        <!-- Doctor List -->
                        <li>
                            <a href="#">Doctor</a>
                            <ul class="dropdown"> 
                                <li class="smallList"><a href="#">View Prescription</a></li>
                                <li class="smallList"><a href="#">Edit Prescription</a></li>
                                <li><a href="#">Link 3</a></li>
                            </ul>
                        </li>

                        <!-- Staff List -->
                        <li>
                            <a href="#">Staff</a>
                            <ul class="dropdown"> 
                                <li><a href="#">Link 1</a></li>
                                <li><a href="#">Link 2</a></li>
                                <li><a href="#">Link 3</a></li>
                            </ul>
                        </li>

                        <!-- Pharmacist List -->
                        <li>
                            <a href="#">Pharmacist</a>
                            <ul class="dropdown"> 
                                <li><a href="#">Link 1</a></li>
                                <li><a href="#">Link 2</a></li>
                                <li><a href="#">Link 3</a></li>
                            </ul>
                        </li>
                    </ul>
                    </nav>
                </div> 
            </asp:Panel>
            <!-- END Navigation Panel -->

            <!-- Red bar -->
            <asp:Panel ID="redBar" runat="server" CssClass="redBar">
            </asp:Panel>

            <!-- Content Panel --> 
            <asp:Panel ID="Panel2" runat="server" CssClass="contentContainer">
            </asp:Panel>
            <!-- END Content Panel -->

        </form>
    </div>

   
</body>
</html>

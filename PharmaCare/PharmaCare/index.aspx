<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="PharmaCare.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>PharmaCare</title>
    <meta name="viewport" content="width=device-width" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <link href="Content/navigation.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>

<body>
    <!-- Site Container -->
    <div class="container">
        <form id="form1" runat="server" class="form-horizontal">

            <!-- Navigation Panel -->
            <nav>
                
                <div class="topnav" id="myTopnav">
                    <!-- PharmaCare Label -->
                    <a href="#home" class="logo">PharmaCare</a>

                    <!-- Doctor Button -->
                    <div class="dropdown2">
                    <button class="dropbtn">Doctor</button>
                        <div class="dropdown-content">
                          <a href="#">Link 1</a>
                          <a href="#">Link 2</a>
                          <a href="#">Link 3</a>
                        </div>
                    </div>

                    <!-- Staff Button -->
                    <div class="dropdown2">
                    <button class="dropbtn">Staff</button>
                        <div class="dropdown-content">
                          <a href="#">Link 1</a>
                          <a href="#">Link 2</a>
                          <a href="#">Link 3</a>
                        </div>
                        </div>

                    <!-- Pharmacist Button -->
                    <div class="dropdown2">
                    <button class="dropbtn">Pharmacist</button>
                        <div class="dropdown-content">
                          <a href="#">Link 1</a>
                          <a href="#">Link 2</a>
                          <a href="#">Link 3</a>
                        </div>
                        </div>

                    <a href="javascript:void(0);" class="icon" onclick="myFunction()">
                    <i class="fa fa-bars"></i>
                    </a>

                </div>
            </nav>
        <script>
            function myFunction() {
            var x = document.getElementById("myTopnav");
            if (x.className === "topnav") {
                x.className += " responsive";
                } else {
                    x.className = "topnav";
                }
            }
        </script>
            
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

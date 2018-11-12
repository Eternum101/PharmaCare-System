<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PharmaCare.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Title -->
    <title>
    </title>

    <!-- Head Content -->
    <meta name="viewport" content="width=device-width" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <link href="Content/navigation.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <!-- Site Content -->
    
        <div class="login_container">
            <form id="form1" runat="server" class="form-horizontal">
                <nav>  
                    <div class="login_topBar" id="loginTopbar">  
                        <h1 class="lblLogin">Login</h1>
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
            

                <!-- Content Container --> 
                <asp:Panel ID="loginRedbar" runat="server" CssClass="login_redBar">
                </asp:Panel>

                <div class="login_contentContainer">
                    <div class="login_credentialsContainer">
                        <h4>Username: </h4>
                        <asp:TextBox ID="prescriptionID" Text="" runat="server" />

                        <h4>Password: </h4>
                        <asp:TextBox ID="patientID" Text="" runat="server" />
                    </div>
                    
                    <div class="btnLogin">
                        <input type="button" class="btnLoginVisuals" onclick="parent.location='index.aspx'" runat="server" value='Sign In'/>
                    </div>

                </div>

            
                <!-- END Content Panel -->
        
            </form>
        </div>
    
</body>
</html>

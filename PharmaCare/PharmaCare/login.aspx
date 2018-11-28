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
                        <asp:TextBox ID="txtUsername" class="login_textboxes" Text="" runat="server" ValidationGroup="SignIn" />
                        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" 
                            ErrorMessage="Please Enter Username" ForeColor="#CC0000" ValidationGroup="SignIn"></asp:RequiredFieldValidator>
                        <asp:Label Text="" ID="lblUserNameIncorrect" CssClass="lblcocktailWarning" runat="server" />

                        <h4>Password: </h4>
                        <asp:TextBox ID="txtPassword" class="login_textboxes" Text="" runat="server" ValidationGroup="SignIn" />
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" 
                            ErrorMessage="Please Enter Password" ForeColor="#CC0000" ValidationGroup="SignIn"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblPasswordIncorrect" CssClass="lblcocktailWarning" runat="server" />
                    </div>
                    
                    <div class="btnLogin">
                        <asp:Button class="btnLoginVisuals" Text="Sign In" runat="server" ID="btnSignIn" OnClick="btnSignIn_Click" ValidationGroup="SignIn" />
                    </div>

                </div>

            
                <!-- END Content Panel -->
                
                <div class="float_center">
                    <ul class="child">
                      <li><p>14/11/18</p></li>
                      <li><p>Jakob</p></li>
                      <li><p>455089250</p></li>
                    </ul>
                    <div class="clear"></div>
                </div>

            </form>
        </div>
    
</body>
</html>

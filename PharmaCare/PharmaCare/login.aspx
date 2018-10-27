<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PharmaCare.login" %>

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
<body style="margin-left: -20px; margin-top: 0px; margin-right: 0px;">
    <div class="container">
        <form id="form1" runat="server" class="form-vertical">
            <div>
            </div>
            <asp:Panel ID="Panel1" runat="server" BackColor="#3E3E3E" CssClass="container">
                
                <label  style="margin-top: 35px;
                        margin-left: 55px;" class="mainLabel">PharmaCare</label>
                
                <asp:Button ID="btnTest" runat="server" style="margin-top: 80px;
                        margin-left: 30px;" Text="Click Me" CssClass="button" 
                        content="width=device-width" OnClientClick="btnCheckOut_Click" />
                <asp:Button ID="Button2" runat="server" style="margin-top: 30px;
                        margin-left: 30px;" Text="NO Click Me" CssClass="button" 
                        OnClientClick="btnCheckOut_Click" />
                <asp:Button ID="Button3" runat="server" style="margin-top: 30px;
                        margin-left: 30px;" Text="Click ME not him ^" CssClass="button" 
                        OnClientClick="btnCheckOut_Click" />

            </asp:Panel>
        </form>
    </div>
</body>
</html>

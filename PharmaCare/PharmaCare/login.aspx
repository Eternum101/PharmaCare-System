<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PharmaCare.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
        .auto-style2 {
            margin-left: 112px;
            margin-top: 195px;
        }
        .auto-style3 {
            margin-left: 112px;
            margin-top: 24px;
        }
        .auto-style4 {
            margin-top: 34px;
        }
        .auto-style5 {
            margin-left: 112px;
            margin-top: 28px;
        }
    </style>
</head>
<body style="width: 427px; height: 529px; margin-left: 390px; margin-top: 48px">
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Panel ID="Panel1" runat="server" BackColor="#666666" CssClass="auto-style1" Height="506px">
            <asp:TextBox ID="TextBox5" runat="server" CssClass="auto-style2" Height="31px" Width="208px"></asp:TextBox>
            <asp:TextBox ID="TextBox6" runat="server" CssClass="auto-style3" Height="31px" Width="208px"></asp:TextBox>
            <asp:Panel ID="Panel2" runat="server" CssClass="auto-style4" Height="179px">
                <asp:Button ID="Button1" runat="server" CssClass="auto-style5" Height="41px" Text="Button" Width="215px" />
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>

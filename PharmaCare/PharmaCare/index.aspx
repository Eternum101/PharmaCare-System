<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="PharmaCare.index" %>

<asp:Content ID="Title" ContentPlaceHolderID="titile" runat="server"> Home
</asp:Content>

<asp:Content ID="Head" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Container" ContentPlaceHolderID="contentContainer" runat="server">
    <div class="div-dark">
    <h1>Welcome to PharmaCare</h1>
    </div>
    <div class="container">
        <h4>Information Here...</h4>
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

<asp:Content ID="Body" ContentPlaceHolderID="body" runat="server"> 
</asp:Content>




<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="nurse_ViewNursingStation.aspx.cs" Inherits="PharmaCare.nurse_ViewNursingStation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
    <div>
        <!-- Page Heading -->
        <h1 class="">Nursing Station List</h1><br />

        <!-- Patient Name lbl and txt -->
        <h3>Select Nursing Station: 
            <asp:DropDownList CssClass="dropdownRoundStation" ID="ddlNursingStation" runat="server" DataTextField="NursingStationID" DataValueField="NursingStationID" Height="30px">
            </asp:DropDownList>
        </h3>
        <div>

        </div>

        <!-- Top Buttons -->
        
        <!-- END Top Buttons -->

    </div>

    <!-- Bordered div -->
    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
        <div class="left">
            <h4>Nursing Station Details:</h4><br />

        </div>
            <asp:GridView ID="dgvNurseStation" runat="server" DataSourceID="SqlDataSource1" 
                AllowSorting="True" CellPadding="4" Width="1000px" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" GridLines="Horizontal" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="PrescriptionID" HeaderText="PrescriptionID" SortExpression="PrescriptionID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="RoomNumber" HeaderText="RoomNumber" SortExpression="RoomNumber" />
                    <asp:BoundField DataField="WardID" HeaderText="WardID" SortExpression="WardID" />
                    <asp:BoundField DataField="RoomID" HeaderText="RoomID" SortExpression="RoomID" />
                    <asp:BoundField DataField="WingNumber" HeaderText="WingNumber" SortExpression="WingNumber" />
                    <asp:BoundField DataField="FloorNumber" HeaderText="FloorNumber" SortExpression="FloorNumber" />
                    <asp:BoundField DataField="PrescriptionDate" HeaderText="PrescriptionDate" SortExpression="PrescriptionDate" />
                    <asp:BoundField DataField="PrescriptionStatus" HeaderText="PrescriptionStatus" SortExpression="PrescriptionStatus" />
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#000000" />
                <HeaderStyle BackColor="#FF5454" Font-Bold="True" Font-Size="15px" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#000000" HorizontalAlign="Right" />
                <RowStyle BackColor="#FFCBCB" ForeColor="#000000" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#FF5454" />
                <SortedDescendingCellStyle BackColor="#F7F7F7" />
                <SortedDescendingHeaderStyle BackColor="#FF5454" />
            </asp:GridView>
    </div>
        
    </div>
    <!-- Bottom Div -->
    <div class="float_center">
        <ul class="child">
          <li class="btn_li">
              <asp:Button class="buttonVisuals_Spacing" Text="Print" runat="server" 
                  ID="btnPrint" OnClientClick="javascript:window.print();" />
          </li>
        </ul>
    </div>

    <!-- END Bottom Div -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dbconnection %>" 
        SelectCommand="SELECT IndoorPrescriptions.PrescriptionID, Patients.Name, IndoorPrescriptions.RoomNumber, Patients.WardID, Patients.RoomID, IndoorPrescriptions.WingNumber, IndoorPrescriptions.FloorNumber, Prescriptions.PrescriptionDate, Prescriptions.PrescriptionStatus FROM IndoorPrescriptions INNER JOIN Prescriptions ON IndoorPrescriptions.PrescriptionID = Prescriptions.PrescriptionID INNER JOIN Patients ON Prescriptions.PatientID = Patients.PatientID"></asp:SqlDataSource>
    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerContainer" runat="server">
    <div class="float_center">
        <ul class="child">
          <li><p>18/11/18</p></li>
          <li><p>Brayden Cantrill</p></li>
          <li><p>454657305</p></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="body" runat="server">
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="view_DistributionSchedule.aspx.cs" Inherits="PharmaCare.view_DistributionSchedule" %>

<asp:Content ID="Title" ContentPlaceHolderID="titile" runat="server">
    ViewDistributionSchedule
</asp:Content>

<asp:Content ID="Head" ContentPlaceHolderID="head" runat="server">
<!-- Author : Dion Bird 463416289
Date : 29/11/18
Version : 1
Purpose : View Distribution Schedule for Nurse and Pharmastist
Bugs : None -->
 
    <style>
        .SelectBtn {
            margin-left: 4%;
        }
    </style>
</asp:Content>
<asp:Content ID="Container" ContentPlaceHolderID="contentContainer" runat="server">
    <!-- This Section Is the Body-->
    <h1 class="DistributionHeader">View Distribution Schedule</h1>
    <div>
        <br />
        <!-- This Is the Drop-Down Menu -->
        <asp:DropDownList ID="SelectButton" CssClass="dropdownRoundDistribution" runat="server" >
            <asp:ListItem Text="1" Value="1"/>
            <asp:ListItem Text="2" Value="2"/>
            <asp:ListItem Text="3" Value="3"/>
            <asp:ListItem Text="4" Value="4"/>
            <asp:ListItem Text="5" Value="5"/>
            <asp:ListItem Text="6" Value="6"/>
        </asp:DropDownList>
        <!-- This is the Display Ward Button -->
        <asp:Button ID="DisplayButton" CssClass="displayWard" runat="server" OnClick="Button1_Click" Text="Display Wing" />
    </div>
    <div>
    </div> <br />

    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
         <div class="left">
         <h4 class="lblPrescriptionTable">Indoor Prescriptions</h4><br />

        </div>
            <!-- This is the First DataGridView -->
        <asp:GridView ID="dgvViewDistributionSchedule" enablePaging="true" class="gridviewProperties" runat="server" CellPadding="2" ForeColor="Black" 
            AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="WingNumber" ShowHeaderWhenEmpty="True" 
            AllowPaging="True" AllowSorting="True" GridLines="Vertical" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" Width="1000px">

            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="WingNumber" HeaderText="Wing"/>

                <asp:BoundField DataField="FloorNumber" HeaderText="Floor"/>

                <asp:BoundField DataField="RoomNumber" HeaderText="Ward"/>
                
                <asp:BoundField DataField="PrescriptionID" HeaderText="Prescription ID"/>

                <asp:BoundField DataField="NursingStationID" HeaderText="Nurse ID"/>

                <asp:BoundField DataField="PatientID" HeaderText="Patient ID"/>         
                
                <asp:BoundField DataField="Name" HeaderText="Patient Name"/>                           
            </Columns>
            <FooterStyle BackColor="#F7F7F7" ForeColor="#000000" />
                <HeaderStyle BackColor="#FF5454" Font-Bold="True" Font-Size="13px" ForeColor="#F7F7F7" />
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
    <br />
    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
         <div class="left">
         <h4 class="lblPrescriptionTable">Distribution Schedule for Selected Wing</h4><br />

        </div>
            <!-- This is the Second DataGridView -->
        <asp:GridView ID="dgvViewDistributionSchedule2" enablePaging="true" class="gridviewProperties" runat="server" CellPadding="2" ForeColor="Black" 
            AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="WingNumber" ShowHeaderWhenEmpty="True" 
            AllowPaging="True" AllowSorting="True" GridLines="Vertical" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" Width="1000px">

            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="LinkID" HeaderText="Prescription ID"/>

                <asp:BoundField DataField="RoomNumber" HeaderText="Ward"/>

                <asp:BoundField DataField="DrugName" HeaderText="Drug Name"/>

                <asp:BoundField DataField="DrugForm" HeaderText="Drug Form"/>
                
                <asp:BoundField DataField="Dose" HeaderText="Dose"/>           
                 
                <asp:BoundField DataField="TimesPerDay" HeaderText="Times Per Day"/>              
                    
                <asp:BoundField DataField="FirstTime" HeaderText="Time First Taken"/>              

                <asp:BoundField DataField="LastTime" HeaderText="Time Last Taken"/>        
                
                <asp:BoundField DataField="StatusOfDose" HeaderText="Status of Dose"/>                           
            </Columns>
            <FooterStyle BackColor="#F7F7F7" ForeColor="#000000" />
                <HeaderStyle BackColor="#FF5454" Font-Bold="True" Font-Size="13px" ForeColor="#F7F7F7" />
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
    <!-- This is the Print Button -->
    <div class="float_center">
        <ul class="child">         
          <li class="btn_li">
              <asp:Button class="buttonVisuals_Spacing" Text="Print" runat="server" 
                  ID="btnPrint" OnClientClick="javascript:window.print();"/>
          </li>
        </ul>
    </div>

</asp:Content>

<asp:Content ID="footer" ContentPlaceHolderID="footerContainer" runat="server">
    <!-- This is the Footer -->
    <div class="float_center">
        <ul class="child">
            <li>
                <p>15/11/18</p>
            </li>

            <li>
                <p>Dion Bird</p>
            </li>
            <li>
                <p>463416289</p>
            </li>

        </ul>
        <div class="clear"></div>
    </div>
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="body" runat="server">
</asp:Content>




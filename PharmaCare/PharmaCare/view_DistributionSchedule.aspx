<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="view_DistributionSchedule.aspx.cs" Inherits="PharmaCare.viewDistributionSchedule" %>

<asp:Content ID="Title" ContentPlaceHolderID="titile" runat="server">
    ViewDistributionSchedule
</asp:Content>

<asp:Content ID="Head" ContentPlaceHolderID="head" runat="server">
    <style>
        .SelectBtn {
            margin-left: 4%;
        }
    </style>
</asp:Content>

<asp:Content ID="Container" ContentPlaceHolderID="contentContainer" runat="server">
    <h1>View Distribution Schedule</h1>
    <div>
        <br />        
        <asp:DropDownList ID="SelectButton" CssClass="SelectBtn" runat="server" Width="729px">
            <asp:ListItem Text="1" Value="1"/>
            <asp:ListItem Text="2" Value="2"/>
            <asp:ListItem Text="3" Value="3"/>
            <asp:ListItem Text="4" Value="4"/>
        </asp:DropDownList>
        <asp:Button ID="DisplayButton" CssClass="searchButtonVisuals" runat="server" Height="26px" OnClick="Button1_Click" Text="Display Ward" Width="128px" />
    </div>
    <div>
    </div>
    <br />
    <div class="globalBorderRound">
        <asp:GridView ID="gvViewDistributionSchedule" enablePaging="true" class="gridviewProperties" runat="server" CellPadding="4" ForeColor="Black" 
            AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="WingNumber" ShowHeaderWhenEmpty="True" 
            AllowPaging="True" AllowSorting="True" GridLines="Vertical" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" CellSpacing="2" Width="1093px">

            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="WingNumber" HeaderText="Wing"/>

                <asp:BoundField DataField="FloorNumber" HeaderText="Floor"/>

                <asp:BoundField DataField="RoomNumber" HeaderText="Ward"/>
                
                <asp:BoundField DataField="PrescriptionID" HeaderText="Prescription ID"/>

                <asp:BoundField DataField="NursingStationID" HeaderText="Nurse ID"/>

                <asp:BoundField DataField="PatientID" HeaderText="Patient ID"/>         
                
                <asp:BoundField DataField="PatientName" HeaderText="Patient Name"/>             
                                        
                <asp:BoundField DataField="DrugName" HeaderText="Drug Name"/>              
                    
                <asp:BoundField DataField="Dose" HeaderText="Dose"/>              
                 
                <asp:BoundField DataField="TimesPerDay" HeaderText="Times Per Day"/>              
                    
                <asp:BoundField DataField="FirstTime" HeaderText="Time First Taken"/>              

                <asp:BoundField DataField="LastTime" HeaderText="Time Last Taken"/>              
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#000000" />
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
    <br />

</asp:Content>

<asp:Content ID="footer" ContentPlaceHolderID="footerContainer" runat="server">
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




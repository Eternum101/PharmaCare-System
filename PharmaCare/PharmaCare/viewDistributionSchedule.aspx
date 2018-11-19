<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="viewDistributionSchedule.aspx.cs" Inherits="PharmaCare.viewDistributionSchedule" %>

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
        <asp:DropDownList ID="SelectButton" CssClass="SelectBtn" runat="server">
            <asp:ListItem Text="1" Value="1"/>
            <asp:ListItem Text="2" Value="2"/>
            <asp:ListItem Text="3" Value="3"/>
            <asp:ListItem Text="4" Value="4"/>
        </asp:DropDownList>
    </div>
    <div>
        <asp:Button ID="DisplayButton" runat="server" Height="26px" OnClick="Button1_Click" Text="Display Ward" Width="128px" />
    </div>
    <br />
    <div>
        <asp:GridView ID="gvViewDistributionSchedule" enablePaging="true" class="gridviewProperties" runat="server" CellPadding="3" ForeColor="Black" 
            AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="WingNumber" ShowHeaderWhenEmpty="True" 
            AllowPaging="True" AllowSorting="True" GridLines="Vertical">

            <AlternatingRowStyle BackColor="#CCCCCC" />
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
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
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




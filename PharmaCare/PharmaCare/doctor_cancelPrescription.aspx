<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="doctor_cancelPrescription.aspx.cs" Inherits="PharmaCare.cancelPrescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
    <h1 class="modifyPrescriptionHeader">Cancel Prescription</h1>
    <div>
        <asp:GridView ID="gvCancelPrescription" class="gridviewProperties" runat="server" CellPadding="3" ForeColor="Black" 
            AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="PrescriptionID" ShowHeaderWhenEmpty="True" 
            AllowPaging="True" AllowSorting="True" OnRowDeleting="gvCancelPrescription_RowDeleting" GridLines="Vertical">

            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:TemplateField HeaderText="Prescription ID">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("PrescriptionID") %>' runat="server"></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Patient ID">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("PatientID") %>' runat="server"></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Doctor ID">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("DoctorID") %>' runat="server"></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Drug Name">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("DrugName") %>' runat="server"></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Date" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Date"></asp:BoundField>
                <asp:TemplateField HeaderText="Patient Name">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("PatientName") %>' runat="server"></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PatientType">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("PatientType") %>' runat="server"></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Dose">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Dose") %>' runat="server"></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Frequency">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Frequency") %>' runat="server"></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="StartDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Start Date"></asp:BoundField>
                <asp:BoundField DataField="EndDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="End Date"></asp:BoundField>
                <asp:TemplateField HeaderText="Prescription Details">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("PrescriptionDetails") %>' runat="server"></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="~/Images/Cancel.png" runat="server" CommandName="Delete" ToolTip="Cancel" Width="20px" Height="20px" />

                    </ItemTemplate>
                </asp:TemplateField>
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
        <br />
        <asp:Label ID="lblSuccessMessage" runat="server" ForeColor="Green"></asp:Label>
        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>

<asp:Content ID="footer" ContentPlaceHolderID="footerContainer" runat="server"> 
    <div class="float_center">
        <ul class="child">
          <li><p>DATE HERE</p></li>
          
          <li><p>NAME HERE</p></li>
          <li><p>STUDENT NUMBER HERE</p></li>
          
        </ul>
        <div class="clear"></div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
</asp:Content>

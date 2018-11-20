<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="PrintIndoorMedicationLabels.aspx.cs" Inherits="PharmaCare.PrintIndoorMedicationLabels" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
    <br />
    <div>
        <asp:Label ID="Label1" runat="server" Text="Patient ID:"></asp:Label>
        <asp:TextBox ID="TextBox1" placeholder="ex:1001" runat="server"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" /><br />
    </div>
    <br />
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:TemplateField HeaderText="Available">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server"><%--Text='<%#Eval("PrescriptionID") %>'--%>
                        </asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="PrescriptionID" HeaderText="Prescription ID" />
                <asp:BoundField DataField="PatientID" HeaderText="Patient ID" />
                <asp:BoundField DataField="DoctorID" HeaderText="Doctor ID" />
                <asp:BoundField DataField="DrugName" HeaderText="Drug Name" />
                <asp:BoundField DataField="Date" HeaderText="Date" />
                <asp:BoundField DataField="PatientName" HeaderText="Patient Name" />
                <asp:BoundField DataField="PatientType" HeaderText="Patient Type" />
                <asp:BoundField DataField="Dose" HeaderText="Dose" />
                <asp:BoundField DataField="Frequency" HeaderText="Frequency" />
                <asp:BoundField DataField="StartDate" HeaderText="Start Date" />
                <asp:BoundField DataField="EndDate" HeaderText="End Date" />
                <asp:BoundField DataField="PrescriptionDetails" HeaderText="Prescription Details" />

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
    <div>
        <input id="btnPrint" style="width: 100px" type="button" value="Print" onclick="PrintGridViewSelectedRows()" />
    </div>


    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script type="text/javascript">
        function PrintGridViewSelectedRows() {
            var strContent = "<html><head>";
            strContent = strContent + "<title" + ">Print Preview</title>";
            strContent = strContent + "<link href=\"App_Themes/Default/Default.css\" type=\"text/css\" rel=\"stylesheet\" />";
            strContent = strContent + "</head><body>";
            strContent = strContent + "<div>";

            strContent = strContent + "<div style='width:100%;text-align:right;'>";
            strContent = strContent + "<input type='button' id='btnPrint' value='Print' style='width:100px' onclick='window.print()' />";
            strContent = strContent + "<input type='button' id='btnCancel' value='Cancel' style='width:100px' onclick='window.close()' />";
            strContent = strContent + "</div>";

            strContent = strContent + "<table>";
            debugger;
            var GridViewContent = "";
            $(':input:checked').closest('tr').each(function (i, item) {
                GridViewContent += "<tr>" + $(item)[0].innerHTML + "</tr>";
            });
            if (GridViewContent == "") {
                GridViewContent = "Please select a row to print";
            }
            strContent = strContent + GridViewContent;
            strContent = strContent + "</table>";
            strContent = strContent + "</div>";
            strContent = strContent + "</body>";
            strContent = strContent + "</html>";

            printWindow = window.open("", "mywindow", "location=0,status=0,width=1000%,height=750,scrollbars=1,resizable=1");
            printWindow.document.write(strContent);
            printWindow.document.close();
            printWindow.focus();
        }

    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
</asp:Content>

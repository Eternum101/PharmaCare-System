<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="pharmacist_PrintIndoorMedicationLabels.aspx.cs" Inherits="PharmaCare.PrintIndoorMedicationLabels" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
    <div>
        <h1 class="writePrescriptionHeading">Indoor Medication</h1>
        
        <div class="searchContainer">
            <ul class="childSearch">
              <li class="searchPosition"><h3>Patient ID: </h3></li>
              <li class="searchPosition"><asp:TextBox ID="txtPatientNameInput" placeholder="ex:1001" class="search_textboxes2" runat="server"/></li>
              <li class="searchPositionSmaller"><asp:Button ID="Button1" class="btnSearchPosition" Text="Search" runat="server" OnClick="Button1_Click" ValidationGroup="SearchValidation" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPatientNameInput" CssClass="text-danger" ErrorMessage="Patient Name Required" ValidationGroup="SearchValidation"></asp:RequiredFieldValidator></li>
            </ul>
        </div>
    </div>

    <div class="globalBorderRound">
        <div class="leftTextboxDiv">
        <div class="left">
            <h4 class="lblPrescriptionTable">Prescription Details</h4><br />

        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowSorting="True" CellPadding="3" Width="1000px" 
            BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellSpacing="2" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
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
            <FooterStyle BackColor="#B5C7DE" ForeColor="#000000" />
                <HeaderStyle BackColor="#FF5454" Font-Bold="True" Font-Size="13px" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#000000" HorizontalAlign="Right" />
                <RowStyle BackColor="#FFCBCB" ForeColor="#000000" />
                <SelectedRowStyle BackColor="#666666" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#FF5454" />
                <SortedDescendingCellStyle BackColor="#F7F7F7" />
                <SortedDescendingHeaderStyle BackColor="#FF5454" />
        </asp:GridView>
    </div>
    </div>

    <div class="float_center">
        <ul class="child">
          <li class="btn_li"><asp:Button class="buttonVisuals_Spacing" Text="Print" runat="server" ID="btnPrint" OnClientClick="PrintGridViewSelectedRows()" /></li>
        </ul>
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
                GridViewContent = "Please Select a Row to Print";
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

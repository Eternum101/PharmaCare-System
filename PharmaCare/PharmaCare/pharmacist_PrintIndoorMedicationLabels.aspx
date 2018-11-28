<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="pharmacist_PrintIndoorMedicationLabels.aspx.cs" Inherits="PharmaCare.PrintIndoorMedicationLabels" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentContainer" runat="server">
    <!--
    Author: Rani
    Date: 28/11/18
    Version: 1.0
    Purpose: The purpose for the Pharmacist Indoor Medication is to display certain indoor prescriptions after the user 
           has searched for the patient ID. Pharmacists can then print the selected rows within the gridview
    -->
    <div>
        <h1 class="writePrescriptionHeading">Indoor Medication</h1>
        
        <!-- Search Features -->
        <div class="searchContainer">
            <ul class="childSearch">
              <li class="searchPosition"><h3>Patient ID: </h3></li>
              <li class="searchPosition"><asp:TextBox ID="txtPrescriptionIDInput" placeholder="ex:1" class="search_textboxes2" runat="server"/></li>
              <li class="searchPositionSmaller"><asp:Button ID="Button1" class="btnSearchPosition" Text="Search" runat="server" OnClick="Button1_Click" ValidationGroup="SearchValidation" />
                <asp:RequiredFieldValidator ID="rfvPatientID" runat="server" ControlToValidate="txtPrescriptionIDInput" CssClass="text-danger" ErrorMessage="Patient ID Required" ValidationGroup="SearchValidation"></asp:RequiredFieldValidator></li>
            </ul>
        </div>
    </div>

    <!-- Indoor prescription gridview -->
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
                <asp:BoundField DataField="PatientID" HeaderText="Patient ID" />
                <asp:BoundField DataField="Name" HeaderText="Patient Name" />
                <asp:BoundField DataField="DoctorName" HeaderText="Doctor Name" />
                <asp:BoundField DataField="DrugName" HeaderText="Drug Name" />
                <asp:BoundField DataField="Dose" HeaderText="Drug Dose" />
                <asp:BoundField DataField="TimesPerDay" HeaderText="Times Per Day" />
                <asp:BoundField DataField="Type" HeaderText="Patient Type" />

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

    <!-- Bottom Buttons -->
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

<!-- Footer Content -->
<asp:Content ID="footer" ContentPlaceHolderID="footerContainer" runat="server"> 
    <div class="float_center">
        <ul class="child">
          <li><p>22/11/18</p></li>
          <li><p>Rani</p></li>
          <li><p>452441249</p></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
</asp:Content>

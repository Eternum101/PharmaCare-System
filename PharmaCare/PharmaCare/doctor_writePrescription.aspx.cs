using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PharmaCare
{
    
    public partial class writePrescription : System.Web.UI.Page
    {
        private Models.drug drugName;
        private Models.prescription prescriptionInfo;

        

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack) ddlDrugName.DataBind();

            drugName = this.GetDrugName();
            ddlDrugName.Text = drugName.DrugName;

            prescriptionInfo = this.GetPrescription();

        }

        private Models.drug GetDrugName()
        {
            DataView drugsTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            drugsTable.RowFilter = string.Format("DrugID = '{0}'", ddlDrugName.SelectedValue);
            DataRowView row = drugsTable[0];

            Models.drug p = new Models.drug();
            p.DrugID = row["DrugID"].ToString();
            p.DrugName = row["DrugName"].ToString();
            return p;
        }

        private Models.prescription GetPrescription()
        {
            DataView prescriptionTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            prescriptionTable.RowFilter = string.Format("PrescriptionID = '{0}'", txtPrescriptionID.Text);
            DataRowView row = prescriptionTable[0];

            Models.prescription p = new Models.prescription();
            p.PrescriptionID = row["PrescriptionID"].ToString();
            p.PatientID = row["PatientID"].ToString();
            p.PatientID = row["PatientID"].ToString();
            return p;
        }

        protected void TextBox13_TextChanged(object sender, EventArgs e)
        {

        }
       

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
        }
    }
}
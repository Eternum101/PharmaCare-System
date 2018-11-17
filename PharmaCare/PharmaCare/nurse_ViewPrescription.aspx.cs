using System;
using PharmaCare.Models;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PharmaCare
{
    
    public partial class nurse_ViewPrescription : System.Web.UI.Page
    {
        // private Models.drug drugName;
        // private Models.prescription prescriptionInfo;
        //private Models.prescription prescriptionInfo;
        patient patientInfo = new patient();
        prescription prescriptionInfo  = new prescription();

        protected void Page_Load(object sender, EventArgs e)
        {
            //UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;


            //prescriptionInfo = this.GetPrescription();

        }
        
        /*
        private Models.prescription GetPrescription()
        {
            SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            DataView prescriptionTable = (DataView)
            prescriptionTable.RowFilter = string.Format("PrescriptionID = '{0}'", txtPrescriptionID.Text);
            DataRowView row = prescriptionTable[0];

            Models.prescription p = new Models.prescription();
            p.PrescriptionID = row["PrescriptionID"].ToString();
            p.PatientID = row["PatientID"].ToString();
            p.PatientID = row["PatientID"].ToString();
            return p;
        }  */

        protected void TextBox13_TextChanged(object sender, EventArgs e)
        {

        }
       

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        protected void btnPatientSearch_Click(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
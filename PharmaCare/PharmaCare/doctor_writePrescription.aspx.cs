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
    
    public partial class writePrescription : System.Web.UI.Page
    {
        // private Models.drug drugName;
        // private Models.prescription prescriptionInfo;
        //private Models.prescription prescriptionInfo;
        patient patientInfo = new patient();
        prescription prescriptionInfo  = new prescription();

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;


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

        
        private void GetPatient(int searchID)
        {
            SqlConnection con = Dbconnection.GetConnection();
            try
            {
                con.Open();
                patientInfo = patient.SearchPatientID(searchID);
                dgvDoctorPrescriptions.DataSource = prescription.GetPrescription(con, searchID);
                dgvDoctorPrescriptions.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        private void GetPatientByName(string searchName)
        {
            try
            {
                patientInfo = patient.SearchPatientName(searchName);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private void DisplayPatientPrescriptions()
        {
            dgvDoctorPrescriptions.DataSource = prescriptionInfo;
            dgvDoctorPrescriptions.DataBind();
        }

        protected void btnPatientSearch_Click(object sender, EventArgs e)
        {
            
            if (txtPatientNameInput.Text != "" && txtPatientNameInput.Text != null)
            {
                GetPatientByName(txtPatientNameInput.Text);
                if (patientInfo != null)
                {
                    GetPatient(patientInfo.PatientID);
                    
                }
                
            }
            else
            {
                return;
            }
            
        }

        protected void dgvDoctorPrescriptions_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.dgvDoctorPrescriptions, "Select$" + e.Row.RowIndex);
            }
        }

        public void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            TableData();
        }

        private void TableData()
        {
            foreach (GridViewRow row in dgvDoctorPrescriptions.Rows)
            {
                if (row.RowIndex == dgvDoctorPrescriptions.SelectedIndex)
                {
                    txtPatientName.Text = row.Cells[0].Text;
                    txtDate.Text = row.Cells[1].Text;
                    txtPrescriptionStatus.Text = row.Cells[2].Text;
                    txtDoctorName.Text = row.Cells[3].Text;
                    ddlDrugName.DataTextFormatString = row.Cells[4].Text.ToString().Trim();
                    txtStartDate.Text = row.Cells[5].Text;
                    txtEndDate.Text = row.Cells[6].Text;
                    txtTimePerDay.Text = row.Cells[7].Text;
                    txtDose.Text = row.Cells[8].Text;
                    txtDoseStatus.Text = row.Cells[9].Text;
                    txtAdditionalInformation.Text = row.Cells[10].Text;
                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtPatientName.Text = null;
            txtDate.Text = null;
            //ddlDrugName.DataTextField = null;
            txtTimePerDay.Text = null;
            txtPrescriptionStatus.Text = null;
            txtDoctorName.Text = null;
            txtStartDate.Text = null;
            txtEndDate.Text = null;
            txtDose.Text = null;
            txtDoseStatus.Text = null;
            txtAdditionalInformation.Text = null;
            dgvDoctorPrescriptions.SelectedIndex = -1;
        }
    }
}
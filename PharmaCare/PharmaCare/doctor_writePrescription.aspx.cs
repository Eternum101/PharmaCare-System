using System;
using PharmaCare.Models;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text.RegularExpressions;

namespace PharmaCare
{
    
    public partial class writePrescription : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        }

        protected void TextBox13_TextChanged(object sender, EventArgs e)
        {

        }
       

        protected void btnPatientSearch_Click(object sender, EventArgs e)
        {
            clearTextboxes();
            if (txtPatientNameInput.Text != "" && txtPatientNameInput.Text != null)
             {
                search_GridViewNames();
            }
             else
             {
                 return;
             }
            
        }

        protected void search_GridViewNames()
        {
            foreach(GridViewRow row in dgvDoctorPrescriptions.Rows)
            {
                string txtSearch = txtPatientNameInput.Text.Trim();
                
                if (!Regex.IsMatch(row.Cells[0].Text, txtSearch, RegexOptions.IgnoreCase))
                {
                    {
                        row.Visible = false;
                    }
                }
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

        private void Insert()
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\2104990817\Documents\PharmaCare-System\PharmaCare\PharmaCare\App_Data\PharmaCare_DB.mdf;Initial Catalog=PharmaCare_DB;Integrated Security=True");
            //SqlConnection conn = Dbconnection.GetConnection();
            string sql = "INSERT INTO Patients (Name) VALUES (@Name)" + "INSERT INTO Doctors (DoctorName) VALUES (@DocName)";
            /*"INSERT INTO Patients.Name, Prescriptions.PrescriptionDate, Prescriptions.PrescriptionStatus, " +
            "Doctors.DoctorName, Drugs.DrugName, Prescriptions.FirstTime, Prescriptions.LastTime, Prescriptions.TimesPerDay, " +
            "Prescriptions.DrugDose, Prescriptions.StatusOfDose, Prescriptions.AdditionalInformation FROM Patients INNER JOIN Prescriptions " +
            "ON Patients.PatientID = Prescriptions.PatientID INNER JOIN Doctors " +
            "ON Doctors.DoctorID = Prescriptions.DoctorID INNER JOIN Drugs ON Drugs.DrugID = Prescriptions.DrugID ";*/
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@Name", txtPatientName.Text);
                cmd.Parameters.AddWithValue("@DocName", txtDoctorName.Text);
                //command.Parameters.AddWithValue("@DrugID", txtDoctorName);
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);

            }
            finally
            {
                conn.Close();
            }
        }

        private void clearTextboxes()
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

            dgvDoctorPrescriptions.DataSource = null;
            dgvDoctorPrescriptions.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Insert();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clearTextboxes();
        }

        protected void txtPatientNameInput_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
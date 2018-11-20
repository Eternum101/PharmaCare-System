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

            DrugnameDropdown();
        }

        protected void DrugnameDropdown()
        {
            if (!this.IsPostBack)
            {
                using (SqlConnection con =  Dbconnection.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT DrugID, DrugName FROM Drugs"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        ddlDrugName.DataSource = cmd.ExecuteReader();
                        ddlDrugName.DataTextField = "DrugName";
                        ddlDrugName.DataValueField = "DrugID";
                        ddlDrugName.DataBind();
                        con.Close();
                    }
                }
                ddlDrugName.Items.Insert(0, new ListItem("", ""));
            }
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
                    ddlPatientName.DataTextFormatString = row.Cells[0].Text.ToString().Trim();
                    txtDate.Text = row.Cells[1].Text;
                    txtPrescriptionStatus.Text = row.Cells[2].Text;
                    ddlDoctorName.DataTextFormatString = row.Cells[3].Text.ToString().Trim();
                    
                    ddlDrugName.SelectedItem.Text = row.Cells[4].Text.ToString().Trim();

                    txtStartDate.Text = row.Cells[5].Text;
                    txtEndDate.Text = row.Cells[6].Text;
                    txtTimePerDay.Text = row.Cells[7].Text;
                    txtDose.Text = row.Cells[8].Text;
                    txtDoseStatus.Text = row.Cells[9].Text;
                    txtAdditionalInformation.Text = row.Cells[10].Text;
                }
            }
        }

        private void checkName()
        {
            
        }

        private void Insert()
        {
            SqlConnection conn = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;Initial Catalog=PharmaCare_DB;AttachDbFilename=|DataDirectory|\PharmaCare_DB.mdf;Integrated Security = True");

            string sql ="INSERT INTO Prescriptions (PatientID, DrugID, DoctorID, PrescriptionDate, PrescriptionStatus, DrugDose, " +
                         "FirstTime, LastTime, TimesPerDay, StatusOfDose, AdditionalInformation) " +
                         "VALUES (@PatientID, @DrugID, @DoctorID, @PrescriptionDate, @PrescriptionStatus, @DrugDose, @FirstTime, @LastTime, " +
                         "@TimesPerDay, @StatusOfDose, @AdditionalInformation )";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@PatientID", ddlPatientName.SelectedValue);
                cmd.Parameters.AddWithValue("@DoctorID", ddlDoctorName.SelectedValue);
                cmd.Parameters.AddWithValue("@PrescriptionDate", txtDate.Text);
                cmd.Parameters.AddWithValue("@FirstTime", txtStartDate.Text);
                cmd.Parameters.AddWithValue("@DrugID", ddlDrugName.SelectedValue);
                cmd.Parameters.AddWithValue("@LastTime", txtEndDate.Text);
                cmd.Parameters.AddWithValue("@TimesPerDay", txtTimePerDay.Text);
                cmd.Parameters.AddWithValue("@DrugDose", txtDose.Text);
                cmd.Parameters.AddWithValue("@PrescriptionStatus", txtPrescriptionStatus.Text);
                cmd.Parameters.AddWithValue("@StatusOfDose", txtDoseStatus.Text);
                cmd.Parameters.AddWithValue("@AdditionalInformation", txtAdditionalInformation.Text);
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
            txtDate.Text = null;
            ddlDrugName.SelectedIndex = 0;
            //ddlDrugName.DataTextField = null;
            txtTimePerDay.Text = null;
            txtPrescriptionStatus.Text = null;
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
            checkName();
            clearTextboxes();

            //dgvDoctorPrescriptions.Databind();
            //dgvDoctorPrescriptions.Update();
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
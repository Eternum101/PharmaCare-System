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

            btnModify.Enabled = false;
            btnModify.CssClass = "buttonVisuals_Spacing_Disabled";

            btnCancel.Enabled = false;
            btnCancel.CssClass = "buttonVisuals_Spacing_Disabled";
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
                
                if (!Regex.IsMatch(row.Cells[1].Text, txtSearch, RegexOptions.IgnoreCase))
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
                    lblPrescriptionNumber.Text = row.Cells[0].Text;
                    txtPatientName.Text = row.Cells[1].Text;
                    txtDate.Text = row.Cells[2].Text;
                    txtPrescriptionStatus.Text = row.Cells[3].Text;
                    txtDoctorName.Text = row.Cells[4].Text;
                    txtDrugName.Text = row.Cells[5].Text;
                    txtStartDate.Text = row.Cells[6].Text;
                    txtEndDate.Text = row.Cells[7].Text;
                    txtTimePerDay.Text = row.Cells[8].Text;
                    txtDose.Text = row.Cells[9].Text;
                    txtDoseStatus.Text = row.Cells[10].Text;
                    if (row.Cells[11].Text != "&nbsp;")
                    {
                        txtAdditionalInformation.Text = row.Cells[11].Text;
                    }
                    else if (row.Cells[11].Text == "&nbsp;")
                    {
                        txtAdditionalInformation.Text = null;
                    }
                    

                    btnSubmit2.Enabled = false;
                    btnSubmit2.CssClass = "buttonVisuals_Spacing_Disabled";

                    btnModify.Enabled = true;
                    btnModify.CssClass = "buttonVisuals_Spacing";

                    btnCancel.Enabled = true;
                    btnCancel.CssClass = "buttonVisuals_Spacing";
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

            if (!string.IsNullOrEmpty(txtPatientName.Text + txtDate.Text + txtStartDate.Text + txtEndDate.Text + txtTimePerDay.Text +
                txtPrescriptionStatus.Text + txtDoctorName.Text + txtDrugName.Text + txtDose.Text + txtDoseStatus.Text))
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@PatientID", txtPatientName.Text);
                    cmd.Parameters.AddWithValue("@DoctorID", txtDoctorName.Text);
                    cmd.Parameters.AddWithValue("@PrescriptionDate", txtDate.Text);
                    cmd.Parameters.AddWithValue("@FirstTime", txtStartDate.Text);
                    cmd.Parameters.AddWithValue("@DrugID", txtDrugName.Text);
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
        }

      

        private void clearTextboxes()
        {
            txtDate.Text = null;
            txtDrugName.Text = null;
            txtDoctorName.Text = null;
            txtPatientName.Text = null;
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

            btnSubmit2.Enabled = true;
            btnSubmit2.CssClass = "buttonVisuals_Spacing";

            btnModify.Enabled = false;
            btnModify.CssClass = "buttonVisuals_Spacing_Disabled";

            btnCancel.Enabled = false;
            btnCancel.CssClass = "buttonVisuals_Spacing_Disabled";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Insert();
            checkName();
            clearTextboxes();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clearTextboxes();
        }

        protected void txtPatientNameInput_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConn = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;Initial Catalog=PharmaCare_DB;AttachDbFilename=|DataDirectory|\PharmaCare_DB.mdf;Integrated Security = True");

            sqlConn.Open();

            SqlCommand cmd = new SqlCommand(
                " DELETE FROM Prescriptions WHERE PrescriptionID = '" + Convert.ToInt16(lblPrescriptionNumber.Text).ToString() + "'", sqlConn);
            cmd.ExecuteNonQuery();
            sqlConn.Close();
            clearTextboxes();
        }

        private void getDrugID()
        {
            SqlConnection sqlConn = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;Initial Catalog=PharmaCare_DB;AttachDbFilename=|DataDirectory|\PharmaCare_DB.mdf;Integrated Security = True");

            try
            {
                sqlConn.Open();
                string connection = 
                 " DECLARE @DrugName varchar(45)" +
                 " SET @DrugName = '" + txtDrugName.Text + "'" +
                 " SELECT Drugs.DrugID FROM Drugs WHERE DrugName = @DrugName " +
                 " UPDATE Prescriptions SET Prescriptions.DrugID = Drugs.DrugID " +
                 " WHERE PrescriptionID = '" + Convert.ToInt16(lblPrescriptionNumber.Text).ToString() + "'";

                SqlCommand cmd = new SqlCommand(connection, sqlConn);
                
                foreach (GridViewRow row in dgvDoctorPrescriptions.Rows)
                {
                    if (row.Cells[0].Text == lblPrescriptionNumber.Text)
                    {
                        row.Cells[5].Text = txtDrugName.Text;
                        cmd.Parameters.AddWithValue("Prescriptions.DrugID", "Drugs.DrugID");
                        cmd.ExecuteNonQuery();
                    }
                }
                clearTextboxes();

            }
            catch (SqlException ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                sqlConn.Close();
            }

        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            
            SqlConnection sqlConn = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;Initial Catalog=PharmaCare_DB;AttachDbFilename=|DataDirectory|\PharmaCare_DB.mdf;Integrated Security = True");
                

            string query = "UPDATE Prescriptions SET " +
                "PrescriptionDate = @PrescriptionDate, PrescriptionStatus = @PrescriptionStatus, DrugDose = @DrugDose, FirstTIme = @FirstTime," +
                "LastTime = @LastTime, TimesPerDay = @TimesPerDay, StatusOfDose = @StatusOfDose, AdditionalInformation = @AdditionalInformation " +
                "WHERE PrescriptionID = '" + Convert.ToInt16(lblPrescriptionNumber.Text).ToString() + "'";
            try
            {
                sqlConn.Open();
                SqlCommand cmd = new SqlCommand(query, sqlConn);
                    foreach (GridViewRow row in dgvDoctorPrescriptions.Rows)
                    {
                        if (row.Cells[0].Text == lblPrescriptionNumber.Text)
                        {
                            
                            row.Cells[2].Text = txtDate.Text;
                            cmd.Parameters.AddWithValue("@PrescriptionDate", txtDate.Text);
                            row.Cells[3].Text = txtPrescriptionStatus.Text;
                            cmd.Parameters.AddWithValue("@PrescriptionStatus", txtPrescriptionStatus.Text);
                            
                            row.Cells[6].Text = txtStartDate.Text;
                            cmd.Parameters.AddWithValue("@FirstTime", txtStartDate.Text);
                            row.Cells[7].Text = txtEndDate.Text;
                            cmd.Parameters.AddWithValue("@LastTime", txtEndDate.Text);
                            row.Cells[8].Text = txtTimePerDay.Text;
                            cmd.Parameters.AddWithValue("@TimesPerDay", txtTimePerDay.Text);
                            row.Cells[9].Text = txtDose.Text;
                            cmd.Parameters.AddWithValue("@DrugDose", txtDose.Text);
                            row.Cells[10].Text = txtDoseStatus.Text;
                            cmd.Parameters.AddWithValue("@StatusOfDose", txtDoseStatus.Text);
                            row.Cells[11].Text = txtAdditionalInformation.Text;
                            cmd.Parameters.AddWithValue("@AdditionalInformation", txtAdditionalInformation.Text);
                            cmd.ExecuteNonQuery();
                        }
                    }
                    clearTextboxes();
                
            }
            catch (SqlException ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                sqlConn.Close();
            }
            getDrugID();
        }
        
    }
}
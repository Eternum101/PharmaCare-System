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
        string Con = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            btnModify.Enabled = false;
            btnModify.CssClass = "buttonVisuals_Spacing_Disabled";

            btnCancel.Enabled = false;
            btnCancel.CssClass = "buttonVisuals_Spacing_Disabled";

            btnSubmitNewDrugDetail.Enabled = false;
            btnSubmitNewDrugDetail.CssClass = "btnSubmitNewDrugDetailDisabled";
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

        private void TableData()
        {
            string prescriptionID;
            foreach (GridViewRow row in dgvDoctorPrescriptions.Rows)
            {
                prescriptionID = row.Cells[0].Text;
                if (row.RowIndex == dgvDoctorPrescriptions.SelectedIndex)
                {
                    dgvDrugDetails.SelectedIndex = -1;
                    dgvDrugDetails.DataSource = null;
                    dgvDrugDetails.DataBind();

                    lblPrescriptionNumber.Text = row.Cells[0].Text;
                    txtPatientName.Text = row.Cells[1].Text;
                    txtDate.Text = row.Cells[2].Text;
                    txtDoctorName.Text = row.Cells[3].Text;
                    

                    /*
                    txtDrugName.Text = row.Cells[5].Text;
                    txtStartDate.Text = row.Cells[6].Text;
                    txtEndDate.Text = row.Cells[7].Text;
                    txtTimePerDay.Text = row.Cells[8].Text;
                    txtDose.Text = row.Cells[9].Text;
                    txtDoseStatus.Text = row.Cells[10].Text;
                    */
                    if (row.Cells[4].Text != "&nbsp;")
                      {
                        txtPrescriptionStatus.Text = row.Cells[4].Text;
                    }
                      else if (row.Cells[4].Text == "&nbsp;")
                      {
                        txtPrescriptionStatus.Text = null;
                      }
                      
                    dgvDrugDetails.DataSource = SqlDataSourceDetails;
                    dgvDrugDetails.DataBind();

                    txtPatientName.Enabled = false;
                    btnSubmit2.Enabled = false;
                    btnSubmit2.CssClass = "buttonVisuals_Spacing_Disabled";

                    btnModify.Enabled = true;
                    btnModify.CssClass = "buttonVisuals_Spacing";

                    btnCancel.Enabled = true;
                    btnCancel.CssClass = "buttonVisuals_Spacing";

                    btnSubmitNewDrugDetail.Enabled = true;
                    btnSubmitNewDrugDetail.CssClass = "btnSubmitNewDrugDetail";

                    lblCocktailWarning.Text = null;

                    


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

        protected void dgvDrugPrescription_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.dgvDrugDetails, "Select$" + e.Row.RowIndex);
            }
        }

        public void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            TableData();
        }

        public void OnSelectedDrugIndexChanged(object sender, EventArgs e)
        {
            TableDrugData();
        }

        

        private void TableDrugData()
        {
            foreach (GridViewRow row2 in dgvDrugDetails.Rows)
            {
                if (row2.RowIndex == dgvDrugDetails.SelectedIndex)
                {
                    lblDrugID.Text = row2.Cells[0].Text;
                    txtDrugName.Text = row2.Cells[2].Text;
                    txtDrugForm.Text = row2.Cells[3].Text;
                    txtDose.Text = row2.Cells[4].Text;
                    txtStartDate.Text = row2.Cells[5].Text;
                    txtEndDate.Text = row2.Cells[6].Text;
                    txtTimePerDay.Text = row2.Cells[7].Text;
                    txtDoseStatus.Text = row2.Cells[8].Text;

                    txtPatientName.Enabled = false;
                    btnSubmit2.Enabled = false;
                    btnSubmit2.CssClass = "buttonVisuals_Spacing_Disabled";

                    btnModify.Enabled = true;
                    btnModify.CssClass = "buttonVisuals_Spacing";

                    btnCancel.Enabled = true;
                    btnCancel.CssClass = "buttonVisuals_Spacing";

                    btnSubmitNewDrugDetail.Enabled = false;
                    btnSubmitNewDrugDetail.CssClass = "btnSubmitNewDrugDetailDisabled";

                    lblCocktailWarning.Text = null;
                }
            }
        }
        
        
        private void checkName()
        {
            
        }
        private void InsertIDs()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
            int drugID = 0;
            int doctorID = 0;
            int patientID = 0;
            try
            {
                con.Open();
                SqlCommand cmdGetDrugID = new SqlCommand("SELECT DrugID FROM Drugs WHERE DrugName = '" + txtDrugName.Text + "'", con);
                SqlDataReader myReaderDrugID = cmdGetDrugID.ExecuteReader();
                while (myReaderDrugID.Read())
                {
                    drugID = myReaderDrugID.GetInt32(0);
                }

                con.Close();
                con.Open();
                SqlCommand cmdUpdateDrugID = new SqlCommand("INSERT INTO Prescriptions (DrugID) VALUES (@DrugID)", con) ;
                cmdUpdateDrugID.Parameters.AddWithValue("@DrugID", drugID);
                cmdUpdateDrugID.CommandType = CommandType.Text;
                cmdUpdateDrugID.ExecuteNonQuery();
                con.Close();

                con.Open();
                SqlCommand cmdGetDoctorID = new SqlCommand("SELECT DoctorID FROM Doctors WHERE DoctorName = '" + txtDoctorName.Text + "'", con);
                SqlDataReader myReaderDoctorID = cmdGetDoctorID.ExecuteReader();
                while (myReaderDoctorID.Read())
                {
                    doctorID = myReaderDoctorID.GetInt32(0);
                }

                con.Close();
                con.Open();
                SqlCommand cmdUpdateDoctorID = new SqlCommand("INSERT INTO Prescriptions (DoctorID) VALUES (@DoctorID)", con);
                cmdUpdateDoctorID.Parameters.AddWithValue("@DoctorID", doctorID);
                cmdUpdateDoctorID.CommandType = CommandType.Text;
                cmdUpdateDoctorID.ExecuteNonQuery();
                con.Close();

                con.Open();
                SqlCommand cmdGetPatientID = new SqlCommand("SELECT PatientID FROM Patients WHERE Name = '" + txtPatientName.Text + "'", con);
                SqlDataReader myReaderPatientID = cmdGetPatientID.ExecuteReader();
                while (myReaderPatientID.Read())
                {
                    patientID = myReaderPatientID.GetInt32(0);
                }

                con.Close();
                con.Open();
                SqlCommand cmdUpdatePatientID = new SqlCommand("INSERT INTO Prescriptions (PatientID) VALUES (@PatientID)", con);
                cmdUpdatePatientID.Parameters.AddWithValue("@PatientID", patientID);
                cmdUpdatePatientID.CommandType = CommandType.Text;
                cmdUpdatePatientID.ExecuteNonQuery();
                con.Close();

            }
            catch (SqlException ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
        }

        private void dgvDoctorPrescriptions_Insert()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
            int doctorID = 0;
            int patientID = 0;

            conn.Open();
            SqlCommand cmdGetPatientID = new SqlCommand("SELECT PatientID FROM Patients WHERE Name = '" + txtPatientName.Text + "'", conn);
            SqlDataReader myReaderPatientID = cmdGetPatientID.ExecuteReader();
            while (myReaderPatientID.Read())
            {
                patientID = myReaderPatientID.GetInt32(0);
            }

            conn.Close();

            conn.Open();
            SqlCommand cmdGetDoctorID = new SqlCommand("SELECT DoctorID FROM Doctors WHERE DoctorName = '" + txtDoctorName.Text + "'", conn);
            SqlDataReader myReaderDoctorID = cmdGetDoctorID.ExecuteReader();
            while (myReaderDoctorID.Read())
            {
                doctorID = myReaderDoctorID.GetInt32(0);
            }

            conn.Close();

            string sql = "INSERT INTO Prescriptions (PatientID, DoctorID, PrescriptionDate, StatusOfPrescription) " +
                         "VALUES (@PatientID, @DoctorID, @PrescriptionDate, @StatusOfPrescription)";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@PatientID", patientID);
                cmd.Parameters.AddWithValue("@DoctorID", doctorID);
                cmd.Parameters.AddWithValue("@PrescriptionDate", txtDate.Text);
                cmd.Parameters.AddWithValue("@StatusOfPrescription", txtPrescriptionStatus.Text);
                // cmd.Parameters.AddWithValue("@AdditionalInformation", txtAdditionalInformation.Text);
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

        private void dgvDrugDetails_Insert()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);

            int prescriptionID = 0;

            conn.Open();
            SqlCommand cmdGetDoctorID = new SqlCommand("SELECT MAX(PrescriptionID) FROM Prescriptions", conn);
            SqlDataReader myReaderDoctorID = cmdGetDoctorID.ExecuteReader();
            while (myReaderDoctorID.Read())
            {
                prescriptionID = myReaderDoctorID.GetInt32(0);
            }

            conn.Close();


            string sql = "INSERT INTO PrescriptionsDetails (DrugName, DrugForm, Dose, FirstTime, LastTime, TimesPerDay, StatusOfDose, LinkID) " +
                         "VALUES (@DrugName, @DrugForm, @Dose, @FirstTime, @LastTime, @TimesPerDay, @StatusOfDose, @LinkID)";
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@FirstTime", txtStartDate.Text);
                cmd.Parameters.AddWithValue("@LastTime", txtEndDate.Text);
                cmd.Parameters.AddWithValue("@TimesPerDay", txtTimePerDay.Text);
                cmd.Parameters.AddWithValue("@DrugForm", txtDrugForm.Text);
                cmd.Parameters.AddWithValue("@Dose", txtDose.Text);
                cmd.Parameters.AddWithValue("@StatusOfDose", txtDoseStatus.Text);
                cmd.Parameters.AddWithValue("@DrugName", txtDrugName.Text);
                cmd.Parameters.AddWithValue("@LinkID", prescriptionID);
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

        private void Insert()
        {
            if (!string.IsNullOrEmpty(txtPatientName.Text + txtDoctorName.Text + txtDate.Text + txtPrescriptionStatus.Text +
                txtStartDate.Text + txtEndDate.Text + txtTimePerDay.Text + txtDrugForm.Text + txtDose.Text + txtDoseStatus.Text + txtDrugName.Text))
            {
                dgvDoctorPrescriptions_Insert();
                dgvDrugDetails_Insert();
            }
            clearTextboxes();
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
            txtDrugForm.Text = null;
            //txtAdditionalInformation.Text = null;

            txtPatientName.Enabled = true;

            lblCocktailWarning.Text = null;
            lblPrescriptionNumber.Text = null;
            lblDrugID.Text = null;

            dgvDoctorPrescriptions.SelectedIndex = -1;
            dgvDoctorPrescriptions.DataSource = null;
            dgvDoctorPrescriptions.DataBind();

            dgvDrugDetails.SelectedIndex = -1;
            dgvDrugDetails.DataSource = null;
            dgvDrugDetails.DataBind();

            btnSubmit2.Enabled = true;
            btnSubmit2.CssClass = "buttonVisuals_Spacing";

            btnModify.Enabled = false;
            btnModify.CssClass = "buttonVisuals_Spacing_Disabled";

            btnCancel.Enabled = false;
            btnCancel.CssClass = "buttonVisuals_Spacing_Disabled";

            btnSubmitNewDrugDetail.Enabled = true;
            btnSubmitNewDrugDetail.CssClass = "btnSubmitNewDrugDetail";
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
            

            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);

            sqlConn.Open();

            SqlCommand cmd2 = new SqlCommand(
                " DELETE FROM PrescriptionsDetails WHERE LinkID = '" + Convert.ToInt16(lblPrescriptionNumber.Text).ToString() + "'", sqlConn);
            cmd2.ExecuteNonQuery();
            sqlConn.Close();


            sqlConn.Open();

            SqlCommand cmd = new SqlCommand(
                " DELETE FROM Prescriptions WHERE PrescriptionID = '" + Convert.ToInt16(lblPrescriptionNumber.Text).ToString() + "'", sqlConn);
            cmd.ExecuteNonQuery();
            sqlConn.Close();
            
            
            clearTextboxes();

        }

        private void dgvDoctorPrescriptions_ContentModify()
        {
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);

            int doctorID = 0;

            string query = "UPDATE Prescriptions SET " +
                " PrescriptionDate = @PrescriptionDate, StatusOfPrescription = @PrescriptionStatus " +
                " WHERE PrescriptionID = '" + Convert.ToInt16(lblPrescriptionNumber.Text).ToString() + "'";

            sqlConn.Open();
            SqlCommand cmd = new SqlCommand(query, sqlConn);
            foreach (GridViewRow row in dgvDoctorPrescriptions.Rows)
            {
                if (row.Cells[0].Text == lblPrescriptionNumber.Text)
                {
                    cmd.Parameters.AddWithValue("@PrescriptionDate", txtDate.Text);
                    cmd.Parameters.AddWithValue("@PrescriptionStatus", txtPrescriptionStatus.Text);
                    //row.Cells[5].Text = txtAdditionalInformation.Text;
                    //cmd.Parameters.AddWithValue("@AdditionalInformation", txtAdditionalInformation.Text);
                    cmd.ExecuteNonQuery();
                }
            }
            sqlConn.Close();

            sqlConn.Open();
            SqlCommand cmdGetDoctorID = new SqlCommand("SELECT DoctorID FROM Doctors WHERE DoctorName = '" + txtDoctorName.Text + "'", sqlConn);
            SqlDataReader myReaderDoctorID = cmdGetDoctorID.ExecuteReader();
            while (myReaderDoctorID.Read())
            {
                doctorID = myReaderDoctorID.GetInt32(0);
            }

            sqlConn.Close();

            sqlConn.Open();
            SqlCommand cmdUpdateDoctorID = new SqlCommand("UPDATE Prescriptions set DoctorID = '" + doctorID + "' WHERE PrescriptionID ='" + Convert.ToInt16(lblPrescriptionNumber.Text) + "'", sqlConn);
            cmdUpdateDoctorID.ExecuteNonQuery();
            sqlConn.Close();
        }

        private void dgvDrugDetails_ContentModify()
        {
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
            
            string queryDetails = "UPDATE PrescriptionsDetails SET FirstTime = @FirstTime, " +
                " LastTime = @LastTime, TimesPerDay = @TimesPerDay, DrugForm = @DrugForm, " +
                " Dose = @Dose, StatusOfDose = @DoseStatus, DrugName = @DrugName " +
                " WHERE PrescriptionDetailsID = '" + Convert.ToInt16(lblDrugID.Text).ToString() + "'";

            sqlConn.Open();
            SqlCommand cmdDetails = new SqlCommand(queryDetails, sqlConn);
            foreach (GridViewRow row2 in dgvDrugDetails.Rows)
            {
                if (row2.Cells[0].Text == lblDrugID.Text)
                {
                    cmdDetails.Parameters.AddWithValue("@FirstTime", txtStartDate.Text);
                    cmdDetails.Parameters.AddWithValue("@LastTime", txtEndDate.Text);
                    cmdDetails.Parameters.AddWithValue("@TimesPerDay", txtTimePerDay.Text);
                    cmdDetails.Parameters.AddWithValue("@DrugForm", txtDrugForm.Text);
                    cmdDetails.Parameters.AddWithValue("@Dose", txtDose.Text);
                    cmdDetails.Parameters.AddWithValue("@DoseStatus", txtDoseStatus.Text);
                    cmdDetails.Parameters.AddWithValue("@DrugName", txtDrugName.Text);

                    cmdDetails.ExecuteNonQuery();
                }
            }
            sqlConn.Close();
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            try
            {
                dgvDoctorPrescriptions_ContentModify();

                if (!string.IsNullOrEmpty(txtStartDate.Text + txtEndDate.Text + txtTimePerDay.Text + txtDrugForm.Text + txtDose.Text +
                txtDoseStatus.Text + txtDrugName.Text))
                {
                    dgvDrugDetails_ContentModify();
                }
            }
            catch (SqlException ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            clearTextboxes();
        }

        protected void btnCheckCocktail_Click(object sender, EventArgs e)
        {

            CocktailService.CocktailServiceClient client = new CocktailService.CocktailServiceClient();

            for (int i = 0; i < dgvDrugDetails.Rows.Count; i++)
            {
                if (client.checkCocktail(dgvDrugDetails.Rows[i].Cells[3].Text) == true)
                {
                    lblCocktailWarning.CssClass = "lblcocktailWarning";
                    lblCocktailWarning.Text = "Warning! Dangerous Cocktail!";
                }
                else if (client.checkCocktail(dgvDrugDetails.Rows[i].Cells[3].Text) == false)
                {
                    lblCocktailWarning.CssClass = "lblCocktailSafe";
                    lblCocktailWarning.Text = "Current Drug Cocktail Is Safe!";
                }
            }

            client.Close();
        }

        protected void btnSubmitNewDrugDetail_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);

            string sql = "INSERT INTO PrescriptionsDetails (DrugName, DrugForm, Dose, FirstTime, LastTime, TimesPerDay, StatusOfDose, LinkID) " +
                         "VALUES (@DrugName, @DrugForm, @Dose, @FirstTime, @LastTime, @TimesPerDay, @StatusOfDose, @LinkID)";

            try
            {
                sqlConn.Open();
                SqlCommand cmd = new SqlCommand(sql, sqlConn);
                cmd.Parameters.AddWithValue("@FirstTime", txtStartDate.Text);
                cmd.Parameters.AddWithValue("@LastTime", txtEndDate.Text);
                cmd.Parameters.AddWithValue("@TimesPerDay", txtTimePerDay.Text);
                cmd.Parameters.AddWithValue("@DrugForm", txtDrugForm.Text);
                cmd.Parameters.AddWithValue("@Dose", txtDose.Text);
                cmd.Parameters.AddWithValue("@StatusOfDose", txtDoseStatus.Text);
                cmd.Parameters.AddWithValue("@DrugName", txtDrugName.Text);
                cmd.Parameters.AddWithValue("@LinkID", Convert.ToInt32(lblPrescriptionNumber.Text));
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
                sqlConn.Close();
            }
            dgvDrugDetails.DataSource = SqlDataSourceDetails;
            dgvDrugDetails.DataBind();
            clearTextboxes();
        }
    }
}
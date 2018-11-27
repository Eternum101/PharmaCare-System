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
            string prescriptionID;
            foreach (GridViewRow row in dgvDoctorPrescriptions.Rows)
            {
                prescriptionID = row.Cells[0].Text;
                if (row.RowIndex == dgvDoctorPrescriptions.SelectedIndex)
                    {
                        lblPrescriptionNumber.Text = row.Cells[0].Text;
                        txtPatientName.Text = row.Cells[1].Text;
                        txtDate.Text = row.Cells[2].Text;
                        txtDoctorName.Text = row.Cells[3].Text;
                        txtPrescriptionStatus.Text = row.Cells[4].Text;
                       
                        /*
                        txtDrugName.Text = row.Cells[5].Text;
                        txtStartDate.Text = row.Cells[6].Text;
                        txtEndDate.Text = row.Cells[7].Text;
                        txtTimePerDay.Text = row.Cells[8].Text;
                        txtDose.Text = row.Cells[9].Text;
                        txtDoseStatus.Text = row.Cells[10].Text;
                        */
                        /*  if (row.Cells[5].Text != "&nbsp;")
                          {
                              txtAdditionalInformation.Text = row.Cells[5].Text;
                          }
                          else if (row.Cells[5].Text == "&nbsp;")
                          {
                              txtAdditionalInformation.Text = null;
                          }
                          */
                        txtPatientName.Enabled = false;
                        btnSubmit2.Enabled = false;
                        btnSubmit2.CssClass = "buttonVisuals_Spacing_Disabled";

                        btnModify.Enabled = true;
                        btnModify.CssClass = "buttonVisuals_Spacing";

                        btnCancel.Enabled = true;
                        btnCancel.CssClass = "buttonVisuals_Spacing";

                        lblCocktailWarning.Text = null;

                    dgvDrugDetails.DataSource = SqlDataSourceDetails;
                    dgvDrugDetails.DataBind();
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

        private void Insert()
        {
            int drugID = 0;
            int doctorID = 0;
            int patientID = 0;

            

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);

            conn.Open();
            SqlCommand cmdGetDrugID = new SqlCommand("SELECT DrugID FROM Drugs WHERE DrugName = '" + txtDrugName.Text + "'", conn);
            SqlDataReader myReaderDrugID = cmdGetDrugID.ExecuteReader();
            while (myReaderDrugID.Read())
            {
                drugID = myReaderDrugID.GetInt32(0);
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

            conn.Open();
            SqlCommand cmdGetPatientID = new SqlCommand("SELECT PatientID FROM Patients WHERE Name = '" + txtPatientName.Text + "'", conn);
            SqlDataReader myReaderPatientID = cmdGetPatientID.ExecuteReader();
            while (myReaderPatientID.Read())
            {
                patientID = myReaderPatientID.GetInt32(0);
            }

            conn.Close();

            string sql ="INSERT INTO Prescriptions (PatientID, DoctorID, DrugID, PrescriptionDate, PrescriptionStatus, DrugDose, " +
                         "FirstTime, LastTime, TimesPerDay, StatusOfDose, AdditionalInformation) " +
                         "VALUES (@PatientID, @DoctorID, @DrugID, @PrescriptionDate, @PrescriptionStatus, @DrugDose, @FirstTime, @LastTime, " +
                         "@TimesPerDay, @StatusOfDose, @AdditionalInformation )";

            if (!string.IsNullOrEmpty(txtPatientName.Text + txtDate.Text + txtStartDate.Text + txtEndDate.Text + txtTimePerDay.Text +
                txtPrescriptionStatus.Text + txtDoctorName.Text + txtDrugName.Text + txtDose.Text + txtDoseStatus.Text))
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@PatientID", patientID);
                    cmd.Parameters.AddWithValue("@DoctorID", doctorID);
                    cmd.Parameters.AddWithValue("@DrugID", drugID);
                    cmd.Parameters.AddWithValue("@PrescriptionDate", txtDate.Text);
                    cmd.Parameters.AddWithValue("@FirstTime", txtStartDate.Text);
                    cmd.Parameters.AddWithValue("@LastTime", txtEndDate.Text);
                    cmd.Parameters.AddWithValue("@TimesPerDay", txtTimePerDay.Text);
                    cmd.Parameters.AddWithValue("@DrugDose", txtDose.Text);
                    cmd.Parameters.AddWithValue("@PrescriptionStatus", txtPrescriptionStatus.Text);
                    cmd.Parameters.AddWithValue("@StatusOfDose", txtDoseStatus.Text);
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
            //txtAdditionalInformation.Text = null;

            txtPatientName.Enabled = true;

            lblCocktailWarning.Text = null;

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
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);

            sqlConn.Open();

            SqlCommand cmd = new SqlCommand(
                " DELETE FROM Prescriptions WHERE PrescriptionID = '" + Convert.ToInt16(lblPrescriptionNumber.Text).ToString() + "'", sqlConn);
            cmd.ExecuteNonQuery();
            sqlConn.Close();
            clearTextboxes();
        }

        private void getIDs()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
           //int drugID = 0;
            int doctorID = 0;
            try
            {
                /*  con.Open();
                  SqlCommand cmdGetDrugID = new SqlCommand("SELECT DrugID FROM Drugs WHERE DrugName = '" + txtDrugName.Text + "'", con);
                  SqlDataReader myReaderDrugID = cmdGetDrugID.ExecuteReader();
                  while (myReaderDrugID.Read())
                  {
                      drugID = myReaderDrugID.GetInt32(0);
                  }

                  con.Close();
                  
                con.Open();
                SqlCommand cmdUpdateDrugID = new SqlCommand("UPDATE Prescriptions set DrugID = '" + drugID + "' WHERE PrescriptionID ='" + Convert.ToInt16(lblPrescriptionNumber.Text) + "'", con);
                cmdUpdateDrugID.ExecuteNonQuery();
                con.Close();
                */
                con.Open();
                SqlCommand cmdGetDoctorID = new SqlCommand("SELECT DoctorID FROM Doctors WHERE DoctorName = '" + txtDoctorName.Text + "'", con);
                SqlDataReader myReaderDoctorID = cmdGetDoctorID.ExecuteReader();
                while (myReaderDoctorID.Read())
                {
                    doctorID = myReaderDoctorID.GetInt32(0);
                }

                con.Close();
                con.Open();
                SqlCommand cmdUpdateDoctorID = new SqlCommand("UPDATE Prescriptions set DoctorID = '" + doctorID + "' WHERE PrescriptionID ='" + Convert.ToInt16(lblPrescriptionNumber.Text) + "'", con);
                cmdUpdateDoctorID.ExecuteNonQuery();
                con.Close();

            }
            catch (SqlException ex)
            {
                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
                

            string query = "UPDATE Prescriptions SET " +
                " PrescriptionDate = @PrescriptionDate, PrescriptionStatus = @PrescriptionStatus, " +
                " AdditionalInformation = @AdditionalInformation " +
                " WHERE PrescriptionID = '" + Convert.ToInt16(lblPrescriptionNumber.Text).ToString() + "'";
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
                            //row.Cells[5].Text = txtAdditionalInformation.Text;
                            //cmd.Parameters.AddWithValue("@AdditionalInformation", txtAdditionalInformation.Text);
                            cmd.ExecuteNonQuery();
                        }
                    }                   
                
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
            getIDs();
            clearTextboxes();
        }

        protected void btnCheckCocktail_Click(object sender, EventArgs e)
        {

            CocktailService.CocktailServiceClient client = new CocktailService.CocktailServiceClient();

            if (client.checkCocktail(txtDrugName.Text) == true)
            {
                lblCocktailWarning.CssClass = "lblcocktailWarning";
                lblCocktailWarning.Text = "Warning! Dangerous Drug Used!";    
            }
            else if (client.checkCocktail(txtDrugName.Text) == false)
            {
                lblCocktailWarning.CssClass = "lblCocktailSafe";
                lblCocktailWarning.Text = "Current Drug Used Is Safe!";
            }

            client.Close();
        }
    }
}
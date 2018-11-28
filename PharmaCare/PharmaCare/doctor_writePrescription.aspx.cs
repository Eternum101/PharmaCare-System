﻿using System;
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

/*
 *Author: Jakob Farrow
 *Date: 28/11/18
 *Version: 1.0
 *Purpose: The purpose for the Write Prescription page is to create, modify, and remove prescriptions 
           within the database and to check if the cocktails of drugs are dangerous or not 
*/

namespace PharmaCare
{
    
    public partial class writePrescription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            // On Load Set the modify, cancel and submit buttons to be disabled 
            btnModify.Enabled = false;
            btnModify.CssClass = "buttonVisuals_Spacing_Disabled";

            btnCancel.Enabled = false;
            btnCancel.CssClass = "buttonVisuals_Spacing_Disabled";

            btnSubmitNewDrugDetail.Enabled = false;
            btnSubmitNewDrugDetail.CssClass = "btnSubmitNewDrugDetailDisabled";
        }

        // Search button Event
        protected void btnPatientSearch_Click(object sender, EventArgs e)
        {
            clearTextboxes();

            // Make connection to the database
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
            int patientID = 0;

            // Get PatientID and apply that value to the patientID int. 
            conn.Open();
            SqlCommand cmdGetDoctorID = new SqlCommand("SELECT PatientID FROM Patients WHERE Name = '" + txtPatientNameInput.Text + "'", conn);
            SqlDataReader myReaderDoctorID = cmdGetDoctorID.ExecuteReader();
            while (myReaderDoctorID.Read())
            {
                patientID = myReaderDoctorID.GetInt32(0);
            }

            conn.Close();

            // If patientID has been found and is not 0
            if (patientID != 0)
            {
                lblPatientNameError.Text = null;
                if (txtPatientNameInput.Text != "" && txtPatientNameInput.Text != null)
                {
                    search_GridViewNames();
                }
                else
                {
                    return;
                }
            }
            // If patientID has been not been found and remains 0
            else if (patientID == 0)
            {
                lblPatientNameError.Text = "Patient Name Doesnt Exist";
                return;
            }
            
        }

        // Search and filter patient Names in the GridView
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
                    txtPrescriptionDetails.Text = row.Cells[4].Text;
                    
                    if (row.Cells[5].Text != "&nbsp;")
                    {
                        txtPrescriptionStatus.Text = row.Cells[5].Text;
                    }
                    else if (row.Cells[5].Text == "&nbsp;")
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

        // Prescription Insert Method
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

            string sql = "INSERT INTO Prescriptions (PatientID, DoctorID, PrescriptionDate, PrescriptionDetails, StatusOfPrescription) " +
                         "VALUES (@PatientID, @DoctorID, @PrescriptionDate, @PrescriptionDetails, @StatusOfPrescription)";

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@PatientID", patientID);
                cmd.Parameters.AddWithValue("@DoctorID", doctorID);
                cmd.Parameters.AddWithValue("@PrescriptionDate", txtDate.Text);
                cmd.Parameters.AddWithValue("@PrescriptionDetails", txtPrescriptionDetails.Text);
                cmd.Parameters.AddWithValue("@StatusOfPrescription", txtPrescriptionStatus.Text);
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

        // Drug Details Insert Method
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

      
        /* Main Clear Method */
        private void clearTextboxes()
        {
            // Textbox clear
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

            // Label clear
            lblCocktailWarning.Text = null;
            lblPrescriptionNumber.Text = null;
            lblDrugID.Text = null;
            lblPatientNameError.Text = null;

            // GridView clear
            dgvDoctorPrescriptions.SelectedIndex = -1;
            dgvDoctorPrescriptions.DataSource = null;
            dgvDoctorPrescriptions.DataBind();

            dgvDrugDetails.SelectedIndex = -1;
            dgvDrugDetails.DataSource = null;
            dgvDrugDetails.DataBind();

            // Button clear
            btnSubmit2.Enabled = true;
            btnSubmit2.CssClass = "buttonVisuals_Spacing";

            btnModify.Enabled = false;
            btnModify.CssClass = "buttonVisuals_Spacing_Disabled";

            btnCancel.Enabled = false;
            btnCancel.CssClass = "buttonVisuals_Spacing_Disabled";

            btnSubmitNewDrugDetail.Enabled = true;
            btnSubmitNewDrugDetail.CssClass = "btnSubmitNewDrugDetail";
        }

        // Submit Button Event
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Insert();
            checkName();
            clearTextboxes();
        }

        // Clear Button Event
        protected void btnClear_Click(object sender, EventArgs e)
        {
            clearTextboxes();
        }

        // Cancel Button Event
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

        // Prescriptions Modify Method 
        private void Prescriptions_ContentModify()
        {
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);

            int doctorID = 0;

            string query = "UPDATE Prescriptions SET " +
                " PrescriptionDate = @PrescriptionDate, PrescriptionDetails = @PrescriptionDetails , StatusOfPrescription = @PrescriptionStatus " +
                " WHERE PrescriptionID = '" + Convert.ToInt16(lblPrescriptionNumber.Text).ToString() + "'";

            sqlConn.Open();
            SqlCommand cmd = new SqlCommand(query, sqlConn);
            foreach (GridViewRow row in dgvDoctorPrescriptions.Rows)
            {
                if (row.Cells[0].Text == lblPrescriptionNumber.Text)
                {
                    cmd.Parameters.AddWithValue("@PrescriptionDate", txtDate.Text);
                    cmd.Parameters.AddWithValue("@PrescriptionStatus", txtPrescriptionStatus.Text);
                    cmd.Parameters.AddWithValue("@PrescriptionDetails", txtPrescriptionDetails.Text);
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

        // Drug Detail Modify Method 
        private void DrugDetails_ContentModify()
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

        // Modify Button Event 
        protected void btnModify_Click(object sender, EventArgs e)
        {
            try
            {
                Prescriptions_ContentModify();

                if (!string.IsNullOrEmpty(txtStartDate.Text + txtEndDate.Text + txtTimePerDay.Text + txtDrugForm.Text + txtDose.Text +
                txtDoseStatus.Text + txtDrugName.Text))
                {
                    DrugDetails_ContentModify();
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

        // Check Cocktail Button Event 
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

        // New Details Button Event 
        protected void btnSubmitNewDrugDetail_Click(object sender, EventArgs e)
        {
            // Make connection with the Dbconnection Database
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);

            string sql = "INSERT INTO PrescriptionsDetails (DrugName, DrugForm, Dose, FirstTime, LastTime, TimesPerDay, StatusOfDose, LinkID) " +
                         "VALUES (@DrugName, @DrugForm, @Dose, @FirstTime, @LastTime, @TimesPerDay, @StatusOfDose, @LinkID)";

            try
            {
                // Insert textbox text into database
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
                // Report any errors 
                string msg = "Insert Error:";
                msg += ex.Message;
                throw new Exception(msg);

            }
            finally
            {
                sqlConn.Close();
            }
            // Reset page
            dgvDrugDetails.DataSource = SqlDataSourceDetails;
            dgvDrugDetails.DataBind();
            clearTextboxes();
        }
    }
}
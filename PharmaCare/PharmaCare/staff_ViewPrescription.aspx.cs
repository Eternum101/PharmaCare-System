using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
 *Author: Jakob Farrow
 *Date: 28/11/18
 *Version: 1.0
 *Purpose: The purpose for the Staff View Prescription page is to view Outdoor prescriptions within the database and print out the contents
*/

namespace PharmaCare
{
    public partial class staff_ViewPrescription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

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
            foreach (GridViewRow row in dgvStaffPrescriptions.Rows)
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
        //Clear textbx method
        private void clearTextboxes()
        {
            //Reset the page
            dgvStaffPrescriptions.DataSource = null;
            dgvStaffPrescriptions.DataBind();
            lblPatientNameError.Text = null;
        }

        //Clear button Event
        protected void btnClear_Click(object sender, EventArgs e)
        {

            clearTextboxes();
            txtPatientNameInput.Text = null;
        }
    }
}
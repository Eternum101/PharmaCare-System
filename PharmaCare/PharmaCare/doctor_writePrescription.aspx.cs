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

        /*
        private void GetPatient(int searchID)
        {
            SqlConnection con = Dbconnection.GetConnection();
            try
            {
                con.Open();
                patientInfo = patient.SearchPatientID(searchID);
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


        private void PatientTextboxFill()
        {
            txtPrescriptionID.Text = prescriptionInfo.PrescriptionID.ToString();
            txtPrescriptionID.DataBind();
            txtPatientID.Text = prescriptionInfo.PatientID.ToString();
            txtPatientID.DataBind();
            txtDoctorID.Text = prescriptionInfo.DoctorID.ToString();
            txtDoctorID.DataBind();
            txtDate.Text = prescriptionInfo.PrescriptionDate.ToString();
            txtDate.DataBind();
            txtPatientName.Text = patientInfo.Name.ToString();
            txtPatientName.DataBind();

            
        }*/

        /* //public SqlConnection conn = new SqlConnection(@"PharmaCare_DB.mdf;Initial Catalog = PharmaCare_DB; Integrated Security = True");
         public void test()
         {
             SqlConnection conn = Dbconnection.GetConnection();
             SqlCommand connect;
             string str;

             conn.Open();
             str = "SELECT Prescriptions.PrescriptionID, Drugs.DrugName, Patients.Name, Doctors.DoctorName, " +
                 "Prescriptions.PrescriptionDate, Prescriptions.AdditionalInformation, Prescriptions.PrescriptionStatus, Prescriptions.DrugDose, " +
                 "Prescriptions.FirstTime, Prescriptions.LastTime, Prescriptions.TimesPerDay, Prescriptions.StatusOfDose FROM Prescriptions " +
                 "INNER JOIN Drugs ON Prescriptions.DrugID = Drugs.DrugID " +
                 "INNER JOIN Doctors ON Prescriptions.DoctorID = Doctors.DoctorID " +
                 "INNER JOIN Patients ON Prescriptions.PatientID = Patients.PatientID " +
                 "WHERE Prescriptions.PatientID = @PatientID";
             connect = new SqlCommand(str, conn);
             SqlDataReader reader = connect.ExecuteReader();
             if (reader.Read())
             {
                 txtPrescriptionID.Text = reader["Prescriptions.PrescriptionID"].ToString();
                 txtPatientID.Text = reader["Prescriptions.PatientID"].ToString();
                 txtDoctorID.Text = reader["Prescriptions.DoctorID"].ToString();
                 txtDate.Text = reader["Prescriptions.PrescriptionDate"].ToString();
                 txtPatientName.Text = reader["Patients.Name"].ToString();
                 reader.Close();
                 conn.Close();
             }
         } */

        protected void btnPatientSearch_Click(object sender, EventArgs e)
        {
            /*
            if (txtPatientNameInput.Text != "" && txtPatientNameInput.Text != null)
            {
                GetPatientByName(txtPatientNameInput.Text);
                if (patientInfo != null)
                {
                    GetPatient(patientInfo.PatientID);
                    PatientTextboxFill();
                }
            }
            else
            {
                return;
            }
            */
        }
    }
}
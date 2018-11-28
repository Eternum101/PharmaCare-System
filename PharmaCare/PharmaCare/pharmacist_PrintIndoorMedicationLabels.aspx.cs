using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
 *Author: Rani
 *Date: 28/11/18
 *Version: 1.0
 *Purpose: The purpose for the Pharmacist Indoor Medication is to display certain indoor prescriptions after the user 
           has searched for the patient ID. Pharmacists can then print the selected rows within the gridview
*/

namespace PharmaCare
{
    public partial class PrintIndoorMedicationLabels : System.Web.UI.Page
    {
        // Make connection to the database
        string Con = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        // Select the content from the tables within the database 
        private DataTable GetData()
        {
            using (SqlConnection con = new SqlConnection(Con))
            {
                using (SqlCommand cmd = new SqlCommand("Select Patients.PatientID, Patients.Name, Doctors.DoctorName, PrescriptionsDetails.DrugName, " +
                    "PrescriptionsDetails.DrugForm, PrescriptionsDetails.Dose, PrescriptionsDetails.TimesPerDay, Patients.Type FROM Doctors " +
                    "INNER JOIN Patients ON Doctors.DoctorID = Patients.DoctorID INNER JOIN Prescriptions ON Doctors.DoctorID = Prescriptions.DoctorID AND " +
                    "Patients.PatientID = Prescriptions.PatientID INNER JOIN PrescriptionsDetails ON Prescriptions.PrescriptionID = PrescriptionsDetails.LinkID " +
                    "WHERE Patients.PatientID=" + txtPrescriptionIDInput.Text + " and Type='IN'"))
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        return ds.Tables[0];
                    }
                }
            }
        }
        // Display the content within the database in the gridview
        protected void Button1_Click(object sender, EventArgs e)
        {
            // If the search textbox has been filled
            if (txtPrescriptionIDInput.Text!="")
            {
                DataTable ds = GetData();
                if (!object.Equals(ds, null))
                {
                    if (ds.Rows.Count > 0)
                    {
                        GridView1.DataSource = this.GetData();
                        GridView1.DataBind();
                        GridView1.Visible = true;
                    }
                    // If patient ID is incorrect or non-existent
                    else
                    {
                        GridView1.Visible = false;
                        string message = "Patient ID Not Registered or Not Found";
                        System.Text.StringBuilder sb = new System.Text.StringBuilder();
                        sb.Append("<script type = 'text/javascript'>");
                        sb.Append("window.onload=function(){");
                        sb.Append("alert('");
                        sb.Append(message);
                        sb.Append("')};");
                        sb.Append("</script>");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                    }
                }
            }
            // If the search textbox has not been filled
            else
            {
                string message = "Please Enter Valid Patient ID!";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            }
            
        }
    }
}
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

namespace PharmaCare
{
    public partial class PrintIndoorMedicationLabels : System.Web.UI.Page
    {
        string Con = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
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
        protected void Button1_Click(object sender, EventArgs e)
        {
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
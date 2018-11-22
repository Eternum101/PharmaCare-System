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
            
        }
        private DataTable GetData()
        {
            using (SqlConnection con = new SqlConnection(Con))
            {
                using (SqlCommand cmd = new SqlCommand("Select PrescriptionID,PatientID,DoctorID,DrugName,Date,PatientName," +
                    "PatientType,Dose,Frequency,startdate,enddate,Prescriptiondetails from PharmaCare_Master where PrescriptionId=" + TextBox1.Text + " and PatientType='IN'"))
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
            if (TextBox1.Text!="")
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
                        string message = "Pharmacist or Patient not registered or Drug dose details not found";
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
                string message = "Please enter valid Patient Id!";
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
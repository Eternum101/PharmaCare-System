using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PharmaCare
{
    public partial class nurse_ViewNursingStation : System.Web.UI.Page
    {
        string Con = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        private void PopulateGridView()
        {
            using (SqlConnection con = new SqlConnection(Con))
            {
                string sql = "SELECT IndoorPrescriptions.NursingStationID, IndoorPrescriptions.PrescriptionID, Patients.Name, Patients.WardID," +
                    " Patients.RoomID, IndoorPrescriptions.RoomNumber, IndoorPrescriptions.WingNumber, IndoorPrescriptions.FloorNumber, Prescriptions.PrescriptionDate," +
                    " Prescriptions.PrescriptionDetails FROM IndoorPrescriptions INNER JOIN Prescriptions ON IndoorPrescriptions.PrescriptionID = Prescriptions.PrescriptionID" +
                    " INNER JOIN Patients ON Prescriptions.PatientID = Patients.PatientID WHERE IndoorPrescriptions.NursingStationID= '" + ddlNursingStation.SelectedItem.Text + "'";
                dgvNurseStation.DataSource = this.GetData(sql);
                dgvNurseStation.DataBind();
            }
        }

        private DataTable GetData(string sql)
        {
            using (SqlConnection con = new SqlConnection(Con))
            {
                using (SqlCommand cmd = new SqlCommand(sql))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        cmd.Connection = con;
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        protected void ddlNursingStation_SelectedIndexChanged1(object sender, EventArgs e)
        {
            PopulateGridView();
        }
    }
}
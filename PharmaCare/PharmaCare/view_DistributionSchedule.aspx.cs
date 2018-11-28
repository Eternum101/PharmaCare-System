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
    public partial class view_DistributionSchedule : System.Web.UI.Page
    {
        string connectionstring = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulatedGridView();
            }
        }
        //The onclick event that starts the population of the gridview
        protected void Button1_Click(object sender, EventArgs e)
        {
            PopulatedGridView();
        }
        void PopulatedGridView()
        {

            int selectValue = Convert.ToInt32(SelectButton.SelectedItem.Value);
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                //displays wing depending on the selected value of the drop down menu.
                if (selectValue == 1)
                {


                    string sql = "SELECT WingNumber, FloorNumber, RoomNumber, IndoorPrescriptions.PrescriptionID, NursingStationId, Patients.PatientID, " +
                        "Patients.Name " +
                        "FROM IndoorPrescriptions " +
                        "LEFT JOIN Prescriptions ON IndoorPrescriptions.PrescriptionID = Prescriptions.PrescriptionID " +
                        "LEFT JOIN Patients ON Prescriptions.PatientID = Patients.PatientID " +
                        "WHERE WingNumber = 1 " +
                        "ORDER BY IndoorPrescriptions.FloorNumber";
                    dgvViewDistributionSchedule.DataSource = this.GetData(sql);
                    dgvViewDistributionSchedule.DataBind();
                    string sql2 = "SELECT LinkID, DrugName, DrugForm, Dose, FirstTime, LastTime, TimesPerDay, StatusOfDose, IndoorPrescriptions.WingNumber " +
                        "FROM PrescriptionsDetails " +
                        "LEFT JOIN IndoorPrescriptions ON PrescriptionsDetails.LinkID = IndoorPrescriptions.PrescriptionID " +
                        "WHERE IndoorPrescriptions.WingNumber = 1 " +
                        "ORDER BY LinkID";
                    dgvViewDistributionSchedule2.DataSource = this.GetData(sql2);
                    dgvViewDistributionSchedule2.DataBind();
                }
                if (selectValue == 2)
                {


                    string sql = "SELECT WingNumber, FloorNumber, RoomNumber, IndoorPrescriptions.PrescriptionID, NursingStationId, Patients.PatientID, " +
                        "Patients.Name " +
                        "FROM IndoorPrescriptions " +
                        "LEFT JOIN Prescriptions ON IndoorPrescriptions.PrescriptionID = Prescriptions.PrescriptionID " +
                        "LEFT JOIN Patients ON Prescriptions.PatientID = Patients.PatientID " +
                        "WHERE WingNumber = 2 " +
                        "ORDER BY IndoorPrescriptions.FloorNumber";
                    dgvViewDistributionSchedule.DataSource = this.GetData(sql);
                    dgvViewDistributionSchedule.DataBind();
                    string sql2 = "SELECT LinkID, DrugName, DrugForm, Dose, FirstTime, LastTime, TimesPerDay, StatusOfDose, IndoorPrescriptions.WingNumber " +
                        "FROM PrescriptionsDetails " +
                        "LEFT JOIN IndoorPrescriptions ON PrescriptionsDetails.LinkID = IndoorPrescriptions.PrescriptionID " +
                        "WHERE IndoorPrescriptions.WingNumber = 2 " +
                        "ORDER BY LinkID";
                    dgvViewDistributionSchedule2.DataSource = this.GetData(sql2);
                    dgvViewDistributionSchedule2.DataBind();
                }
                if (selectValue == 3)
                {


                    string sql = "SELECT WingNumber, FloorNumber, RoomNumber, IndoorPrescriptions.PrescriptionID, NursingStationId, Patients.PatientID, " +
                        "Patients.Name " +
                        "FROM IndoorPrescriptions " +
                        "LEFT JOIN Prescriptions ON IndoorPrescriptions.PrescriptionID = Prescriptions.PrescriptionID " +
                        "LEFT JOIN Patients ON Prescriptions.PatientID = Patients.PatientID " +
                        "WHERE WingNumber = 3 " +
                        "ORDER BY IndoorPrescriptions.FloorNumber";
                    dgvViewDistributionSchedule.DataSource = this.GetData(sql);
                    dgvViewDistributionSchedule.DataBind();
                    string sql2 = "SELECT LinkID, DrugName, DrugForm, Dose, FirstTime, LastTime, TimesPerDay, StatusOfDose, IndoorPrescriptions.WingNumber " +
                        "FROM PrescriptionsDetails " +
                        "LEFT JOIN IndoorPrescriptions ON PrescriptionsDetails.LinkID = IndoorPrescriptions.PrescriptionID " +
                        "WHERE IndoorPrescriptions.WingNumber = 3 " +
                        "ORDER BY LinkID";
                    dgvViewDistributionSchedule2.DataSource = this.GetData(sql2);
                    dgvViewDistributionSchedule2.DataBind();
                }
                if (selectValue == 4)
                {


                    string sql = "SELECT WingNumber, FloorNumber, RoomNumber, IndoorPrescriptions.PrescriptionID, NursingStationId, Patients.PatientID, " +
                        "Patients.Name " +
                        "FROM IndoorPrescriptions " +
                        "LEFT JOIN Prescriptions ON IndoorPrescriptions.PrescriptionID = Prescriptions.PrescriptionID " +
                        "LEFT JOIN Patients ON Prescriptions.PatientID = Patients.PatientID " +
                        "WHERE WingNumber = 4 " +
                        "ORDER BY IndoorPrescriptions.FloorNumber";
                    dgvViewDistributionSchedule.DataSource = this.GetData(sql);
                    dgvViewDistributionSchedule.DataBind();
                    string sql2 = "SELECT LinkID, DrugName, DrugForm, Dose, FirstTime, LastTime, TimesPerDay, StatusOfDose, IndoorPrescriptions.WingNumber " +
                        "FROM PrescriptionsDetails " +
                        "LEFT JOIN IndoorPrescriptions ON PrescriptionsDetails.LinkID = IndoorPrescriptions.PrescriptionID " +
                        "WHERE IndoorPrescriptions.WingNumber = 4 " +
                        "ORDER BY LinkID";
                    dgvViewDistributionSchedule2.DataSource = this.GetData(sql2);
                    dgvViewDistributionSchedule2.DataBind();
                }
                if (selectValue == 5)
                {


                    string sql = "SELECT WingNumber, FloorNumber, RoomNumber, IndoorPrescriptions.PrescriptionID, NursingStationId, Patients.PatientID, " +
                        "Patients.Name " +
                        "FROM IndoorPrescriptions " +
                        "LEFT JOIN Prescriptions ON IndoorPrescriptions.PrescriptionID = Prescriptions.PrescriptionID " +
                        "LEFT JOIN Patients ON Prescriptions.PatientID = Patients.PatientID " +
                        "WHERE WingNumber = 5 " +
                        "ORDER BY IndoorPrescriptions.FloorNumber";
                    dgvViewDistributionSchedule.DataSource = this.GetData(sql);
                    dgvViewDistributionSchedule.DataBind();
                    string sql2 = "SELECT LinkID, DrugName, DrugForm, Dose, FirstTime, LastTime, TimesPerDay, StatusOfDose, IndoorPrescriptions.WingNumber " +
                        "FROM PrescriptionsDetails " +
                        "LEFT JOIN IndoorPrescriptions ON PrescriptionsDetails.LinkID = IndoorPrescriptions.PrescriptionID " +
                        "WHERE IndoorPrescriptions.WingNumber = 5 " +
                        "ORDER BY LinkID";
                    dgvViewDistributionSchedule2.DataSource = this.GetData(sql2);
                    dgvViewDistributionSchedule2.DataBind();
                }
                if (selectValue == 6)
                {


                    string sql = "SELECT WingNumber, FloorNumber, RoomNumber, IndoorPrescriptions.PrescriptionID, NursingStationId, Patients.PatientID, " +
                        "Patients.Name " +
                        "FROM IndoorPrescriptions " +
                        "LEFT JOIN Prescriptions ON IndoorPrescriptions.PrescriptionID = Prescriptions.PrescriptionID " +
                        "LEFT JOIN Patients ON Prescriptions.PatientID = Patients.PatientID " +
                        "WHERE WingNumber = 6 " +
                        "ORDER BY IndoorPrescriptions.FloorNumber";
                    dgvViewDistributionSchedule.DataSource = this.GetData(sql);
                    dgvViewDistributionSchedule.DataBind();
                    string sql2 = "SELECT LinkID, DrugName, DrugForm, Dose, FirstTime, LastTime, TimesPerDay, StatusOfDose, IndoorPrescriptions.WingNumber " +
                        "FROM PrescriptionsDetails " +
                        "LEFT JOIN IndoorPrescriptions ON PrescriptionsDetails.LinkID = IndoorPrescriptions.PrescriptionID " +
                        "WHERE IndoorPrescriptions.WingNumber = 6 " +
                        "ORDER BY LinkID";
                    dgvViewDistributionSchedule2.DataSource = this.GetData(sql2);
                    dgvViewDistributionSchedule2.DataBind();
                }
                // 2nd Attempt

                /*con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet dataSet1 = new DataSet();
                adapter.Fill(dataSet1, "viewDistributionSchedule");

                gvViewDistributionSchedule.DataSource = dataSet1;
                gvViewDistributionSchedule.DataBind();*/

                //1st Attempt

                // SqlDataReader reader = cmd.ExecuteReader();


                /* gvViewDistributionSchedule.DataSource = reader;
                 gvViewDistributionSchedule.DataBind();*/


            }/*
            if (dtbl.Rows.Count > 0)
            {
                gvViewDistributionSchedule.DataSource = dtbl;
                gvViewDistributionSchedule.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvViewDistributionSchedule.DataSource = dtbl;
                gvViewDistributionSchedule.DataBind();
                gvViewDistributionSchedule.Columns[0].Visible = false;
                gvViewDistributionSchedule.Rows[0].Cells.Clear();
                gvViewDistributionSchedule.Rows[0].Cells.Add(new TableCell());
                gvViewDistributionSchedule.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvViewDistributionSchedule.Rows[0].Cells[0].Text = "No Data Found...!";
                gvViewDistributionSchedule.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }*/
        }
        private DataTable GetData(string sql)
        {
            using (SqlConnection con = new SqlConnection(connectionstring))
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
    }
}
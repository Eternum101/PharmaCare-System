using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PharmaCare
{
    public partial class pharmacist_viewPrescription : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        }

        protected void btnPharmacistPatientSearch_Click(object sender, EventArgs e)
        {
            if (txtPharmacistPatientSearch.Text != "" && txtPharmacistPatientSearch.Text != null)
            {
                search_Prescription();
            }
            else
            {
                return;
            }
        }

        protected void search_Prescription()
        {
            foreach (GridViewRow row in dgvPharmacistPrescriptions.Rows)
            {
                string txtSearch = txtPharmacistPatientSearch.Text.Trim();

                if (!Regex.IsMatch(row.Cells[1].Text, txtSearch, RegexOptions.IgnoreCase))
                {
                    {
                        row.Visible = false;
                    }
                }
            }
        }

        protected void dgvPharmacistPrescriptions_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(dgvPharmacistPrescriptions, "Select$" + e.Row.RowIndex);
            }

        }

        protected void dgvPharmacistPrescriptions_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in dgvPharmacistPrescriptions.Rows)
            {
                if (row.RowIndex == dgvPharmacistPrescriptions.SelectedIndex)
                {
                    txtPrescriptionID.Text = row.Cells[0].Text;
                    txtDoctorName.Text = row.Cells[2].Text.ToString().Trim();
                    txtPatientName.Text = row.Cells[1].Text;
                    txtStatus.Text = row.Cells[4].Text;

                }
            }

        }

        protected void btnDispatch_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Prescriptions set PrescriptionStatus = 'Filled and Dispatched' WHERE PrescriptionID = '" + Convert.ToInt16(txtPrescriptionID.Text).ToString() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                foreach (GridViewRow row in dgvPharmacistPrescriptions.Rows)
                {
                    if (row.Cells[0].Text == txtPrescriptionID.Text)
                    {
                        row.Cells[3].Text = "Filled and Dispatched";

                    }
                }
                ClearTextBox();
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        protected void btnRecall_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Prescriptions set PrescriptionStatus = 'Hold' WHERE PrescriptionID = '" + Convert.ToInt16(txtPrescriptionID.Text).ToString() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                foreach (GridViewRow row in dgvPharmacistPrescriptions.Rows)
                {
                    if (row.Cells[0].Text == txtPrescriptionID.Text)
                    {
                        row.Cells[3].Text = "Hold";

                    }
                }
                ClearTextBox();
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private void ClearTextBox()
        {
            txtPrescriptionID.Text = "";
            txtDoctorName.Text = "";
            txtPatientName.Text = "";
            txtStatus.Text = "";
        }
    }
}
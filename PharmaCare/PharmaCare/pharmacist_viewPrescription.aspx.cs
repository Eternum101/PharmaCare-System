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

        protected void dgvOPDPrescriptions_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(dgvOPDPrescriptions, "Select$" + e.Row.RowIndex);
            }
        }

        protected void dgvOPDPrescriptions_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in dgvOPDPrescriptions.Rows)
            {
                if (row.RowIndex == dgvOPDPrescriptions.SelectedIndex)
                {
                    txtPrescriptionID.Text = row.Cells[0].Text;
                    txtPatientName.Text = row.Cells[1].Text;
                    txtDoctorName.Text = row.Cells[2].Text.ToString().Trim();
                    txtFilledAndDispatched.Text = row.Cells[3].Text;
                    txtTimeDispatched.Text = row.Cells[4].Text;
                    txtDateDispatched.Text = row.Cells[5].Text;
                    txtIndoorEmergency.Text = row.Cells[6].Text;
                    txtToFill.Text = row.Cells[7].Text;
                    txtType.Text = row.Cells[8].Text;
                }
            }
        }

        protected void btnDispatch_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE OPDPrescriptions set FilledandDispatched = 'Yes' WHERE PrescriptionID = '" + 
                Convert.ToInt16(txtPrescriptionID.Text).ToString() + "'", con);
                cmd.ExecuteNonQuery();
                foreach (GridViewRow row in dgvPharmacistPrescriptions.Rows)
                {
                    if (row.Cells[0].Text == txtPrescriptionID.Text)
                    {
                        row.Cells[3].Text = "Yes";
                    }
                }
                ClearTextBox();
                con.Close();
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
                SqlCommand cmd = new SqlCommand("UPDATE OPDPrescriptions set FilledandDispatched = 'No' WHERE PrescriptionID = '" + Convert.ToInt16(txtPrescriptionID.Text).ToString() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                foreach (GridViewRow row in dgvPharmacistPrescriptions.Rows)
                {
                    if (row.Cells[0].Text == txtPrescriptionID.Text)
                    {
                        row.Cells[3].Text = "No";

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
            txtPatientName.Text = "";
            txtDoctorName.Text = "";
            txtFilledAndDispatched.Text = "";
            txtTimeDispatched.Text = "";
            txtDateDispatched.Text = "";
            txtIndoorEmergency.Text = "";
            txtToFill.Text = "";
            txtType.Text = "";
        }
    }
}
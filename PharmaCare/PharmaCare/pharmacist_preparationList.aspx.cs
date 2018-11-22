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
    public partial class pharmacist_preparationList : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            foreach (GridViewRow row in dgvPharmacistPreparation.Rows)
            {

                if (!Regex.IsMatch(row.Cells[2].Text, "Hold", RegexOptions.IgnoreCase))
                {
                    {
                        row.Visible = false;
                    }
                }
            }

        }

        protected void dgvPharmacistPreparation_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in dgvPharmacistPreparation.Rows)
            {
                if (row.RowIndex == dgvPharmacistPreparation.SelectedIndex)
                {
                    txtPrescriptionID.Text = row.Cells[0].Text;
                    txtDrugName.Text = row.Cells[1].Text;
                    txtDrugDose.Text = row.Cells[3].Text;
                }
            }

        }

        protected void dgvPharmacistPreparation_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(dgvPharmacistPreparation, "Select$" + e.Row.RowIndex);
            }
        }

        protected void btnPharmacistPrescriptionSearch_Click(object sender, EventArgs e)
        {
            if (txtPharmacistPrescriptionSearch.Text != "" && txtPharmacistPrescriptionSearch.Text != null)
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
            foreach (GridViewRow row in dgvPharmacistPreparation.Rows)
            {
                string txtSearch = txtPharmacistPrescriptionSearch.Text.Trim();

                if (!Regex.IsMatch(row.Cells[0].Text, txtSearch, RegexOptions.IgnoreCase))
                {
                    {
                        row.Visible = false;
                    }
                }
            }
        }

        protected void btnFill_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Prescriptions set PrescriptionStatus = 'Filled' WHERE PrescriptionID = '" + Convert.ToInt16(txtPrescriptionID.Text).ToString() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                foreach (GridViewRow row in dgvPharmacistPreparation.Rows)
                {
                    if (row.Cells[0].Text == txtPrescriptionID.Text)
                    {
                        row.Visible = false;
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
            txtDrugName.Text = "";
            txtDrugDose.Text = "";
        }
    }
}

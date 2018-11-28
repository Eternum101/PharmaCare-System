using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
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

          lblPrescriptionNumber.Text = dgvPharmacistPrescriptions.Rows[0].Cells[0].Text;

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
                    lblPrescriptionNumber.Text = row.Cells[0].Text;

                }
            }

        }

        protected void btnDispatch_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE OPDPrescriptions set FilledandDispatched = 'Yes' WHERE PrescriptionID = '" + Convert.ToInt16(txtPrescriptionID.Text).ToString() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                foreach (GridViewRow row in dgvOPDPrescription.Rows)
                {
                    if (row.Cells[0].Text == txtPrescriptionID.Text)
                    {
                        row.Cells[3].Text = "Yes";

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
                SqlCommand cmd = new SqlCommand("UPDATE OPDPrescriptions set FilledandDispatched = 'No' WHERE PrescriptionID = '" + Convert.ToInt16(txtPrescriptionID.Text).ToString() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                foreach (GridViewRow row in dgvOPDPrescription.Rows)
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

        protected void dgvOPDPrescription_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in dgvOPDPrescription.Rows)
            {
                if (row.RowIndex == dgvOPDPrescription.SelectedIndex)
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

                    lblPrescriptionNumber.Text = row.Cells[0].Text;

                }
            }
        }

        protected void dgvOPDPrescription_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(dgvOPDPrescription, "Select$" + e.Row.RowIndex);
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            string printString = " Name: " + txtPatientName.Text + "@ Doctor: " + txtDoctorName.Text;

            foreach (GridViewRow row in dgvPrescriptionsDetails.Rows)
            {
                printString += "@ Drug Name: " + row.Cells[1].Text + " Dose: " + row.Cells[3].Text + " First Time: " + row.Cells[4].Text + " Last Time: " + row.Cells[5].Text + " Times Per Day:  " + row.Cells[6].Text;
            }
            printString = printString.Replace("@", "" + System.Environment.NewLine);

            //File.WriteAllText(@"C:\WriteText.txt", printString);
            Response.Clear();
            Response.ClearHeaders();

            Response.AppendHeader("Content-Length", printString.Length.ToString());
            Response.ContentType = "text/plain";
            Response.AppendHeader("Content-Disposition", "attachment;filename=\"output.txt\"");

            Response.Write(printString);
            Response.End();

        }
    }
}
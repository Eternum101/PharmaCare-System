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
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
        
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;


        }

        protected void dgvPharmacistPreparation_SelectedIndexChanged(object sender, EventArgs e)
        {
            dgvPrescriptionsDetails.Visible = true;
            dgvPrescriptionsDetails1.Visible = false; 

            foreach (GridViewRow row in dgvPharmacistPreparation.Rows)
            {
                if (row.RowIndex == dgvPharmacistPreparation.SelectedIndex)
                {
                    lblPrescriptionNumber.Text = row.Cells[0].Text;
                }
            }

        }

        protected void dgvPharmacistPreparation_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            dgvPrescriptionsDetails.Visible = true;
            dgvPrescriptionsDetails1.Visible = false;
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
            dgvPrescriptionsDetails.Visible = false;
            dgvPrescriptionsDetails1.Visible = true;
            lblPrescriptionNumber.Text = "";

        }
        private void ClearTextBox()
        {
            txtPrescriptionID.Text = "";
            txtDrugName.Text = "";
            txtDrugDose.Text = "";
            TxtDrugForm.Text = "";
        }

        protected void dgvPrescriptionsDetails_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in dgvPrescriptionsDetails.Rows)
            {
                if (row.RowIndex == dgvPrescriptionsDetails.SelectedIndex)
                {
                    txtDrugDose.Text = row.Cells[4].Text;
                    TxtDrugForm.Text = row.Cells[3].Text;
                    txtDrugName.Text = row.Cells[2].Text;
                    txtPrescriptionID.Text = row.Cells[0].Text;

                }
            }
        }

        protected void dgvPrescriptionsDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(dgvPrescriptionsDetails, "Select$" + e.Row.RowIndex);
            }
        }

        protected void dgvPrescriptionsDetails1_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in dgvPrescriptionsDetails1.Rows)
            {
                if (row.RowIndex == dgvPrescriptionsDetails1.SelectedIndex)
                {
                    txtDrugDose.Text = row.Cells[4].Text;
                    TxtDrugForm.Text = row.Cells[3].Text;
                    txtDrugName.Text = row.Cells[2].Text;
                    txtPrescriptionID.Text = row.Cells[0].Text;
                }
            }
        }

        protected void dgvPrescriptionsDetails1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(dgvPrescriptionsDetails1, "Select$" + e.Row.RowIndex);
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            string printString = "Preparation List: @ @ ";

            if (dgvPrescriptionsDetails.Visible)
            {
                foreach (GridViewRow row in dgvPrescriptionsDetails.Rows)
                {
                    printString += "@ Drug Name: " + row.Cells[2].Text + " Form: " + row.Cells[3].Text + " Dose: " + row.Cells[4].Text + " Times Per Day:  " + row.Cells[7].Text + "@";
                }
                
            }
            else
            {
                foreach (GridViewRow row in dgvPrescriptionsDetails1.Rows)
                {
                    printString += "@ Drug Name: " + row.Cells[2].Text + " Form: " + row.Cells[3].Text + " Dose: " + row.Cells[4].Text + " Times Per Day:  " + row.Cells[7].Text + "@";
                }
            }

            printString = printString.Replace("@", "" + System.Environment.NewLine);

            Response.Clear();
            Response.ClearHeaders();

            Response.AppendHeader("Content-Length", printString.Length.ToString());
            Response.ContentType = "text/plain";
            Response.AppendHeader("Content-Disposition", "attachment;filename=\"PreparationList.txt\"");

            Response.Write(printString);
            Response.End();

        }

        protected void btnPrepare_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE PrescriptionsDetails set StatusOfDose = 'Active' WHERE PrescriptionDetailsID = '" + Convert.ToInt16(txtPrescriptionID.Text).ToString() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                if (dgvPrescriptionsDetails.Visible)
                {
                    foreach (GridViewRow row in dgvPrescriptionsDetails.Rows)
                    {
                        if (row.Cells[0].Text == txtPrescriptionID.Text)
                        {
                            row.Cells[8].Text = "Active";

                        }
                    }
                }
                else
                {
                    foreach (GridViewRow row in dgvPrescriptionsDetails1.Rows)
                    {
                        if (row.Cells[0].Text == txtPrescriptionID.Text)
                        {
                            row.Cells[8].Text = "Active";

                        }
                    }
                }
                ClearTextBox();


            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}

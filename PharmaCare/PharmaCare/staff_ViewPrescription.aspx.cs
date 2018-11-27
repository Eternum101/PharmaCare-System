using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PharmaCare
{
    public partial class staff_ViewPrescription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnPatientSearch_Click(object sender, EventArgs e)
        {
            clearTextboxes();
            if (txtPatientNameInput.Text != "" && txtPatientNameInput.Text != null)
            {
                search_GridViewNames();
            }
            else
            {
                return;
            }

        }

        protected void search_GridViewNames()
        {
            foreach (GridViewRow row in dgvStaffPrescriptions.Rows)
            {
                string txtSearch = txtPatientNameInput.Text.Trim();

                if (!Regex.IsMatch(row.Cells[1].Text, txtSearch, RegexOptions.IgnoreCase))
                {
                    {
                        row.Visible = false;
                    }
                }
            }
        }

        private void clearTextboxes()
        {
            dgvStaffPrescriptions.DataSource = null;
            dgvStaffPrescriptions.DataBind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clearTextboxes();
            txtPatientNameInput.Text = null;
        }
    }
}
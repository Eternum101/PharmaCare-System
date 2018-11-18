using System;
using PharmaCare.Models;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text.RegularExpressions;

namespace PharmaCare
{
    
    public partial class nurse_ViewPrescription : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnNursePatientSearch_Click(object sender, EventArgs e)
        {
            clearTextboxes();
            if (txtNursePatientSearch.Text != "" && txtNursePatientSearch.Text != null)
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
            foreach (GridViewRow row in dgvNursePrescriptions.Rows)
            {
                string txtSearch = txtNursePatientSearch.Text.Trim();

                if (!Regex.IsMatch(row.Cells[0].Text, txtSearch, RegexOptions.IgnoreCase))
                {
                    {
                        row.Visible = false;
                    }
                }
            }
        }

        private void clearTextboxes()
        {
            dgvNursePrescriptions.SelectedIndex = -1;
            dgvNursePrescriptions.DataSource = null;
            dgvNursePrescriptions.DataBind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clearTextboxes();
            txtNursePatientSearch.Text = null; 
        }
    }
}
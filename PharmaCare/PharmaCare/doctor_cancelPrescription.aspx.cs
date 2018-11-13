using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace PharmaCare
{
    public partial class cancelPrescription : System.Web.UI.Page
    {

        string connectionstring = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulatedGridView();
            }
        }
        void PopulatedGridView()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM PharmaCare_Master where IsActive=1", con);
                da.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvCancelPrescription.DataSource = dtbl;
                gvCancelPrescription.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvCancelPrescription.DataSource = dtbl;
                gvCancelPrescription.DataBind();
                gvCancelPrescription.Columns[0].Visible = false;
                gvCancelPrescription.Rows[0].Cells.Clear();
                gvCancelPrescription.Rows[0].Cells.Add(new TableCell());
                gvCancelPrescription.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvCancelPrescription.Rows[0].Cells[0].Text = "No Data Found...!";
                gvCancelPrescription.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }
        protected void gvCancelPrescription_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

                using (SqlConnection con = new SqlConnection(connectionstring))
                {
                    con.Open();
                    string query = "update PharmaCare_Master set IsActive=0 where PrescriptionID = @id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvCancelPrescription.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    PopulatedGridView();
                    Response.Write("<script>alert('Selected Record Canceled')</script>");
                    //lblSuccessMessage.Text = "Selected Record Canceled";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void gvCancelPrescription_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
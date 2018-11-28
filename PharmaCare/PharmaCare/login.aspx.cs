using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace PharmaCare
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None; 
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString);
            conn.Open();
            string checkuser = "SELECT count(*) from Staff WHERE UserName='" + txtUsername.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp == 1)
            {

                string checkpassword = "SELECT Password from Staff WHERE UserName='" + txtUsername.Text + "'";
                SqlCommand command = new SqlCommand(checkpassword, conn);
                string password = command.ExecuteScalar().ToString();


                password = string.Join("", password.Split(default(string[]), StringSplitOptions.RemoveEmptyEntries)); //EXTRA LINE

                if (password == txtPassword.Text)
                {
                    Session["New"] = txtPassword.Text;
                    Response.Redirect("doctor_writePrescription.aspx");
                }
                else
                {
                    lblPasswordIncorrect.Text = "Password Is Incorrect";
                }
            }
            else
            {
                lblUserNameIncorrect.Text = "Username Is Incorrect";
            }
            conn.Close();
        }
    }
}
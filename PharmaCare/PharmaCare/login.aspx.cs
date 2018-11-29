using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

/*
 *Author: Jakob, Brayden 
 *Date: 28/11/18
 *Version: 1.0
 *Purpose: The purpose for the login page is allow the user to successfully sign into the web application
 * using there username and password. 
*/

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
            // Connects to the database and selects both the username and password from the table "Staff"
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

                // Removes empty space in the textbox to prevent the password from being incorrect when it is acutally correct 
                password = string.Join("", password.Split(default(string[]), StringSplitOptions.RemoveEmptyEntries)); //EXTRA LINE

                // Ensures that if the username & password is correct, redirect to the Doctor - Write Prescriptions Page
                if (password == txtPassword.Text)
                {
                    Session["New"] = txtPassword.Text;
                    Response.Redirect("doctor_writePrescription.aspx");
                }
                // If the password is not correct then prevent redirecting to the next page and change the label text
                else
                {
                    lblPasswordIncorrect.Text = "Password Is Incorrect";
                }
            }
            // If the username is not correct then prevent redirecting to the next page and change the label text
            else
            {
                lblUserNameIncorrect.Text = "Username & Password Is Incorrect";
            }
            conn.Close();
        }

        // Ensures that the label is null when text has been changed in the textbox
        protected void txtUsername_TextChanged(object sender, EventArgs e)
        {
            lblUserNameIncorrect.Text = null;
        }
    }
}
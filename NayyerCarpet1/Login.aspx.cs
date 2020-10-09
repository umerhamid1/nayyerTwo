using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;




public partial class Login : System.Web.UI.Page
{


    public static string cs = System.Configuration.ConfigurationManager.ConnectionStrings["OrderManagementSystemConnectionString"].ConnectionString; //ConfigurationManager.ConnectionStrings["connectionStringName"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

        lblmsgerror.Visible = false;
    }



    protected void btnLogin_Click(object sender, EventArgs e)
    {
        using (SqlConnection sqlcon = new SqlConnection(cs
//@"Data Source=.;Initial Catalog=OrderManagementSystem;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework;"
))
        {
            sqlcon.Open();
            string query = "SELECT COUNT(1) FROM Login WHERE Email=@Email AND Password=@Password";
            SqlCommand sqlCmd = new SqlCommand(query, sqlcon);
            sqlCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Password", txtpassword.Text.Trim());
            int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
            if (count == 1)
            {
                Session["Email"] = txtEmail.Text.Trim();
                Response.Redirect("CompanyTable.aspx");
            }
            else
            {
                lblmsgerror.Visible = true;
            }

        }
    }
}
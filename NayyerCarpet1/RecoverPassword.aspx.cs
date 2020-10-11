using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Email"]!=null)
        {
            string Email = Session["Email"].ToString();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string Email = Request.QueryString["username"].ToString();

        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["OrderManagementSystemConnectionString"].ConnectionString
            //"Data Source=.;Initial Catalog=OrderManagementSystem;Integrated Security=True"
            );
        SqlCommand cmd = new SqlCommand("Update Login set password = '" + txtnewpwd.Text + "'where Email= '" + Email + "'", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert ('Your Password Has Been Successfully Updated.')</script>");
        txtnewpwd.Text = "";
        txtconfirmpwd.Text = "";
    }
}
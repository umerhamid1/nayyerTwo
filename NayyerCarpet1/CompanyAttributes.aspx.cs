using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class CustomerBill : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=OrderManagementSystem;Integrated Security=True");
    string Id = "0";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GenerateAutoId();
        }
    }

    private void GenerateAutoId()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Select Count(Id) from AddNewCompany", con);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        i++;
        lblCompanyId.Text = Id + i.ToString();
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //Database Code
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into AddNewCompany values('" + lblCompanyId.Text + "','" + txtCompany_Name.Text + "','" + txtCompany_Contact.Text + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            GenerateAutoId();
            ClearTextBox();

            Response.Redirect("CompanyTable.aspx");
        }
    }

    private void ClearTextBox()
    {
        txtCompany_Name.Text = "";
        txtCompany_Contact.Text = "";
    }
}
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

    int Id = 0;
    String CompanyName = "";
    String Contact = "";
    String TableName = "Register Company";

    protected void Page_Load(object sender, EventArgs e)
    {
        {
            String mycon = "Data Source=.;Initial Catalog=OrderManagementSystem;Integrated Security=True";
            String myquery = "Select Id,CompanyName,Contact from AddNewCompany where Id=" + Request.QueryString["Id"];
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Id = int.Parse(ds.Tables[0].Rows[0]["Id"].ToString());
                CompanyName = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                Contact = ds.Tables[0].Rows[0]["Contact"].ToString();

                if (Page.IsPostBack == false)
                {
                    lblCompanyId.Text = ds.Tables[0].Rows[0]["Id"].ToString();
                    txtCompany_Name.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                    txtCompany_Contact.Text = ds.Tables[0].Rows[0]["Contact"].ToString();
                }
                con.Close();
            }
        }

        if (Session["Email"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("Insert into OldDataBillReceive values('" + TableName + "','" + Id + "','" + 0 + "','" + 0 + "','" + CompanyName + "','" + 0 + "','" + 0 + "','" + 0 + "','" + 0 + "','" + Contact + "','" + 0 + "','" + DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss") + "')", con);
            cmd1.ExecuteNonQuery();
            con.Close();

            con.Open();
            SqlCommand cmd = new SqlCommand("update AddNewCompany Set CompanyName=@CompanyName,Contact=@Contact where Id=@Id", con);
            cmd.Parameters.AddWithValue("@Id", lblCompanyId.Text);
            cmd.Parameters.AddWithValue("@CompanyName", txtCompany_Name.Text);
            cmd.Parameters.AddWithValue("@Contact", txtCompany_Contact.Text);

            cmd.Connection = con;
            cmd.ExecuteNonQuery();

            Response.Redirect("CompanyTable.aspx");
        }
    }
}
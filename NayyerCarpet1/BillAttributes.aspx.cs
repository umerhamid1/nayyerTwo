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

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            string sql = "Select CompanyName From AddNewCompany";
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataSet ds = new DataSet();
            da.Fill(ds, "s");
            DataTable dt = ds.Tables["s"];
            DropDownList1.Items.Add("Choose a Name");
            foreach (DataRow r in dt.Rows)
            {
                DropDownList1.Items.Add(r["CompanyName"].ToString());
            }
        }

        //if (Session["Email"] == null)
        //{
        //    Response.Redirect("Login.aspx");
        //}
        //else
        //{
        //    Label1.Text = "User Email " + Session["Email"].ToString();
        //} 
    }

    protected void btnB_Submit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //Database Code

            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into BillReceive values('" + txtB_Vr.Text + "','" + lblB_Sale.Text + "','" + DropDownList1.Text + "','" + txtB_Description.Text + "','" + txtB_Amount.Text + "','" + 0 + "','" + txtB_Date.Text + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            ClearTextBox();

            Response.Redirect("BillTable.aspx");
        }
    }

    private void ClearTextBox()
    {
        txtB_Vr.Text = "";
        lblB_Sale.Text = "";
        txtB_Description.Text = "";
        txtB_Amount.Text = "";
        txtB_Date.Text = "";
    }
}

    
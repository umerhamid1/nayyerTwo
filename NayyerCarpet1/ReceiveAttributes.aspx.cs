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
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["OrderManagementSystemConnectionString"].ConnectionString
        //"Data Source=.;Initial Catalog=OrderManagementSystem;Integrated Security=True"
    );

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

        if (Session["Email"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnR_Submit_Click(object sender, EventArgs e)
    {
        //if (Page.IsValid)
        //{
        if (checkemail() == true)
        {
            lblVrNo.Text = "Your Vr No Already Registered !";
            //txtB_Vr.BackColor = System.Drawing.Color.PaleGreen;
        }
        else
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into BillReceive values('" + txtR_Vr.Text + "','" + lblR_Receive.Text + "','" + DropDownList1.Text + "','" + txtR_Description.Text + "','" + 0 + "','" + txtR_Amount.Text + "','" + txtR_Date.Text + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            ClearTextBox();

            Response.Redirect("ReceiveTable.aspx");
        }
    }

    private Boolean checkemail()
    {
        Boolean emailavailable = false;
        String mycon = "Data Source=.;Initial Catalog=OrderManagementSystem;Integrated Security=True";
        String myquery = "Select * from BillReceive where VrNo='" + txtR_Vr.Text + "'";
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
            emailavailable = true;
        }
        con.Close();
        return emailavailable;
    }

    private void ClearTextBox()
    {
        txtR_Vr.Text = "";
        lblR_Receive.Text = "";
        txtR_Description.Text = "";
        txtR_Amount.Text = "";
        txtR_Date.Text = "";
    }
}
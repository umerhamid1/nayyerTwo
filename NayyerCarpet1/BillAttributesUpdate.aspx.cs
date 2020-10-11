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

    int VrNo = 0;
    String Jrn_Type = "";
    String CompanyName = "";
    String Description = "";
    int bilAmt = 0;
    String Date = "";
    String TableName = "Customer Bill List";
    String email = "";

    protected void Page_Load(object sender, EventArgs e)
    {
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

        {
            String mycon = System.Configuration.ConfigurationManager.ConnectionStrings["OrderManagementSystemConnectionString"].ConnectionString;
                //"Data Source=.;Initial Catalog=OrderManagementSystem;Integrated Security=True";
            String myquery = "Select VrNo,Jrn_Type,CompanyName,Description,BillAmount,Date from BillReceive where VrNo=" + Request.QueryString["VrNo"];
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
                VrNo = int.Parse(ds.Tables[0].Rows[0]["VrNo"].ToString());
                Jrn_Type = ds.Tables[0].Rows[0]["Jrn_Type"].ToString();
                CompanyName = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                Description = ds.Tables[0].Rows[0]["Description"].ToString();
                bilAmt = int.Parse(ds.Tables[0].Rows[0]["BillAmount"].ToString());
                Date = Convert.ToDateTime(ds.Tables[0].Rows[0]["Date"]).ToString("MM/dd/yyyy");
               
                if (Page.IsPostBack == false)
                {
                    txtB_Vr.Text = ds.Tables[0].Rows[0]["VrNo"].ToString();
                    lblB_Sale.Text = ds.Tables[0].Rows[0]["Jrn_Type"].ToString();
                    DropDownList1.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                    txtB_Description.Text = ds.Tables[0].Rows[0]["Description"].ToString();
                    txtB_Amount.Text = ds.Tables[0].Rows[0]["BillAmount"].ToString();
                    txtB_Date.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["Date"]).ToString("MM/dd/yyyy");
                }
                con.Close();
            }
        }

        //var email = Session["Email"];
        if (Session["Email"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        //else
        //{
        //  Label3.Text = "Welcome To " + Session["username"].ToString();
        //}
    }   
    

    protected void btnB_Update_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            
            con.Open();
            SqlCommand cmd1 = new SqlCommand("Insert into OldDataBillReceive values('" + TableName + "','" + 0 + "','" + VrNo + "','" + Jrn_Type + "','" + CompanyName + "','" + Description + "','" + bilAmt + "','" + 0 + "','" + Date + "','" + 0 + "','" + email + "','" + DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss") + "')", con);
            cmd1.ExecuteNonQuery();
            con.Close();

            con.Open();
            SqlCommand cmd = new SqlCommand("update BillReceive set CompanyName = @CompanyNames,Description=@Description,BillAmount=@BillAmount,Date=@Date where VrNo=@VrNo", con);
            cmd.Parameters.AddWithValue("@VrNo", txtB_Vr.Text);
            cmd.Parameters.AddWithValue("@Jrn_Type", lblB_Sale.Text);
            cmd.Parameters.AddWithValue("@CompanyNames", DropDownList1.Text);
            cmd.Parameters.AddWithValue("@Description", txtB_Description.Text);
            cmd.Parameters.AddWithValue("@BillAmount", txtB_Amount.Text);
            cmd.Parameters.AddWithValue("@Date", txtB_Date.Text);

            cmd.Connection = con;
            cmd.ExecuteNonQuery();

            Response.Redirect("BillTable.aspx");
        }
    }
}
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
            lblCompanyId.Text = ds.Tables[0].Rows[0]["Id"].ToString();
            Id = int.Parse(ds.Tables[0].Rows[0]["Id"].ToString());

            txtCompany_Name.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
            CompanyName = ds.Tables[0].Rows[0]["CompanyName"].ToString();

            txtCompany_Contact.Text = ds.Tables[0].Rows[0]["Contact"].ToString();
            Contact = ds.Tables[0].Rows[0]["Contact"].ToString();
        }
        con.Close();

        //if (Session["Email"] == null)
        //{
        //    Response.Redirect("Login.aspx");
        //}
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("Insert into OldDataBillReceive values('" + TableName + "','" + Id + "','" + 0 + "','" + 0 + "','" + CompanyName + "','" + 0 + "','" + 0 + "','" + 0 + "','" + 0 + "','" + Contact + "','" + 0 + "','" + DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss") + "')", con);
            cmd1.ExecuteNonQuery();
            con.Close();

            //con.Open();
            //SqlCommand cmd = new SqlCommand("update BillReceive Set CompanyName=@CompanyName,Description=@Description,BillAmount=@BillAmount,Date=@Date where VrNo=@VrNo", con);
            //cmd.Parameters.AddWithValue("@VrNo", txtB_Vr.Text);
            //cmd.Parameters.AddWithValue("@Jrn_Type", lblB_Sale.Text);
            //cmd.Parameters.AddWithValue("@CompanyName", DropDownList1.Text);
            //cmd.Parameters.AddWithValue("@Description", txtB_Description.Text);
            //cmd.Parameters.AddWithValue("@BillAmount", txtB_Amount.Text);
            //cmd.Parameters.AddWithValue("@Date", txtB_Date.Text);  



            //con.Open();
            //SqlCommand cmd9 = new SqlCommand(@"UPDATE [BillReceive] SET [VrNo]='" + txtB_Vr.Text + "',[Jrn_Type]='" + lblB_Sale.Text + "',[CompanyName]='" + DropDownList1.Text + "',[Description]='" + txtB_Description.Text + "',[BillAmount]='" + txtB_Amount.Text + "',[ReceiveAmount]= '" + 0 + "',[Date] = '" + txtB_Date.Text + "' WHERE [VrNo]='" + txtB_Vr.Text + "'", con);
            //cmd9.ExecuteNonQuery();
            //con.Close();

            Response.Redirect("CompanyTable.aspx");
            //cmd.CommandText = "Update BillReceive set  VrNo = '" + txtB_Vr.Text + "' , Jrn_Type = '" + lblB_Sale.Text + "' , CompanyName = '" + DropDownList1.Text + "' , Description = '" + txtB_Description.Text + "' , BillAmount = '" + txtB_Amount.Text + "', ReceiveAmount = '" + 0 + "' , Date = '" + txtB_Date.Text + "'  where VrNo = '" + txtB_Vr.Text + "'";
            //cmd.Connection = con;
            //cmd.ExecuteNonQuery();

        }
    }
}
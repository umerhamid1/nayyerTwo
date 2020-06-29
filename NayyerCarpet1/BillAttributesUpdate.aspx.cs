﻿using System;
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

    int VrNo = 0;
    String Jrn_Type = "";
    String CompanyName = "";
    String Description = "";
    int bilAmt = 0;
    String Date = "";
    String TableName = "Customer Bill List";

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

        {
            String mycon = "Data Source=.;Initial Catalog=OrderManagementSystem;Integrated Security=True";
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
                txtB_Vr.Text = ds.Tables[0].Rows[0]["VrNo"].ToString();
                VrNo = int.Parse(ds.Tables[0].Rows[0]["VrNo"].ToString());

                lblB_Sale.Text = ds.Tables[0].Rows[0]["Jrn_Type"].ToString();
                Jrn_Type = ds.Tables[0].Rows[0]["Jrn_Type"].ToString();

                DropDownList1.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                CompanyName = ds.Tables[0].Rows[0]["CompanyName"].ToString();

                txtB_Description.Text = ds.Tables[0].Rows[0]["Description"].ToString();
                Description = ds.Tables[0].Rows[0]["Description"].ToString();

                txtB_Amount.Text = ds.Tables[0].Rows[0]["BillAmount"].ToString();
                bilAmt = int.Parse(ds.Tables[0].Rows[0]["BillAmount"].ToString());

                txtB_Date.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["Date"]).ToString("MM/dd/yyyy");
                Date = Convert.ToDateTime(ds.Tables[0].Rows[0]["Date"]).ToString("MM/dd/yyyy");
            }
            con.Close();
        }

        //if (Session["Email"] == null)
        //{
        //    Response.Redirect("Login.aspx");
        //}
    }

    protected void btnB_Update_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("Insert into OldDataBillReceive values('" + TableName + "','" + 0 + "','" + VrNo + "','" + Jrn_Type + "','" + CompanyName + "','" + Description + "','" + bilAmt + "','" + 0 + "','" + Date + "','" + 0 + "','" + 0 + "','" + DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss") + "')", con);
            cmd1.ExecuteNonQuery();
            con.Close();

            var a = "UPDATE       BillReceive"+
          "  SET                VrNo = '" + txtB_Vr.Text + "', Jrn_Type = '" + lblB_Sale.Text + "', CompanyName ='" + DropDownList1.Text + "' , Description = '" + txtB_Description.Text + "', ReceiveAmount = '" + 0 + "', BillAmount = '" + txtB_Amount.Text + "', Date = '" + txtB_Date.Text + "'"
            +  "  WHERE        (VrNo = '" + txtB_Vr.Text + "')";

            con.Open();
            SqlCommand cmd9 = new SqlCommand(@"UPDATE [BillReceive] SET [VrNo]='" + txtB_Vr.Text + "',[Jrn_Type]='" + lblB_Sale.Text + "',[CompanyName]='" + DropDownList1.Text + "',[Description]='" + txtB_Description.Text + "',[BillAmount]='" + txtB_Amount.Text + "',[ReceiveAmount]= '" + 0 + "',[Date] = '" + txtB_Date.Text + "' WHERE [VrNo]='" + txtB_Vr.Text + "'", con);
            cmd9.ExecuteNonQuery();
            con.Close();

            //con.Open();
            //SqlCommand cmd = new SqlCommand("update BillReceive Set CompanyName=@CompanyName,Description=@Description,BillAmount=@BillAmount,Date=@Date where VrNo=@VrNo", con);
            //cmd.Parameters.AddWithValue("@VrNo", txtB_Vr.Text);
            //cmd.Parameters.AddWithValue("@Jrn_Type", lblB_Sale.Text);
            //cmd.Parameters.AddWithValue("@CompanyName", DropDownList1.Text);
            //cmd.Parameters.AddWithValue("@Description", txtB_Description.Text);
            //cmd.Parameters.AddWithValue("@BillAmount", txtB_Amount.Text);
            //cmd.Parameters.AddWithValue("@Date", txtB_Date.Text);  

            
            //cmd.CommandText = "Update BillReceive set  VrNo = '" + txtB_Vr.Text + "' , Jrn_Type = '" + lblB_Sale.Text + "' , CompanyName = '" + DropDownList1.Text + "' , Description = '" + txtB_Description.Text + "' , BillAmount = '" + txtB_Amount.Text + "', ReceiveAmount = '" + 0 + "' , Date = '" + txtB_Date.Text + "'  where VrNo = '" + txtB_Vr.Text + "'";
            //cmd.Connection = con;
            //cmd.ExecuteNonQuery();

            Response.Redirect("BillTable.aspx");
        }
    }
}
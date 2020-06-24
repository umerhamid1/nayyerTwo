﻿using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BillTable : System.Web.UI.Page
{
    string strconn = @"Data Source=.;Initial Catalog=OrderManagementSystem;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            string sql = "SELECT DISTINCT [CompanyName] FROM [BillReceive]";
            SqlDataAdapter da = new SqlDataAdapter(sql, strconn);
            DataSet ds = new DataSet();
            da.Fill(ds, "s");
            DataTable dt = ds.Tables["s"];
            DropDownList1.Items.Add("Choose a Name");
            foreach (DataRow r in dt.Rows)
            {
                DropDownList1.Items.Add(r["CompanyName"].ToString());
            }
        }
    }

    protected void btnViewReport_Click(object sender, EventArgs e)
    {
        Balance();
        ShowReport();
    }

    double income = 0;
    public void Balance()
    {
        DataTable dt = new DataTable();
        //string strconn = @"Data Source=.;Initial Catalog=OrderManagementSystem;Integrated Security=True";
        SqlConnection conn = new SqlConnection(strconn);
        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT sum(BillAmount) - sum(ReceiveAmount)   from BillReceive" +
                             "  where Date < '" + txtFrom.Text + "' and" +
                             "  CompanyName = '" + DropDownList1.Text + "' " +
                             "  GROUP   BY CompanyName", conn);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            income = Convert.ToDouble(dr[0]);
        }
        conn.Close();
    }

    private void ShowReport()
    {
        ReportViewer1.Reset();

        DataTable dt = GetData1(DateTime.Parse(txtFrom.Text), DateTime.Parse(txtTo.Text), DropDownList1.Text);
        ReportDataSource rds = new ReportDataSource("DataSet1", dt);

        ReportViewer1.LocalReport.DataSources.Add(rds);

        ReportViewer1.LocalReport.ReportPath = "GeneralLedger1.rdlc";

        ReportParameter[] rptParams = new ReportParameter[]{
            new ReportParameter("ReportParameter1",income.ToString()),
            new ReportParameter("FromDate",txtFrom.Text),
            new ReportParameter("ToDate",txtTo.Text),
            new ReportParameter("CompanyName",DropDownList1.Text),
        };
        ReportViewer1.LocalReport.SetParameters(rptParams);

        ReportViewer1.LocalReport.Refresh();

    }

    private DataTable GetData1(DateTime fromDate, DateTime toDate, String cname)
    {
        DataTable dt = new DataTable();
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OrderManagementSystemConnectionString"].ConnectionString;
        using (SqlConnection cn = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("GetOrdersByDates5", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@From", SqlDbType.DateTime).Value = fromDate;
            cmd.Parameters.Add("@To", SqlDbType.DateTime).Value = toDate;
            cmd.Parameters.Add("@cName", SqlDbType.VarChar).Value = cname;

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);

        }
        return dt;
    }
}
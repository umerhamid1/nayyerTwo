﻿using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class BillTable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Email"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnViewReport_Click(object sender, EventArgs e)
    {
        ShowReport();
    }

    private void ShowReport()
    {
        ReportViewer1.Reset();

        DataTable dt = GetData1(DateTime.Parse(txtFrom.Text), DateTime.Parse(txtTo.Text));
        ReportDataSource rds = new ReportDataSource("DataSet1", dt);

        ReportViewer1.LocalReport.DataSources.Add(rds);

        ReportViewer1.LocalReport.ReportPath = "GeneralLedger2.rdlc";

        ReportParameter[] rptParams = new ReportParameter[]{
            new ReportParameter("FromDate",txtFrom.Text),
            new ReportParameter("ToDate",txtTo.Text),

        };
        ReportViewer1.LocalReport.SetParameters(rptParams);

        ReportViewer1.LocalReport.Refresh();

    }

    private DataTable GetData1(DateTime fromDate, DateTime toDate)
    {
        DataTable dt = new DataTable();
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OrderManagementSystemConnectionString"].ConnectionString;
        using (SqlConnection cn = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("GetOrdersByDates4", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@From", SqlDbType.DateTime).Value = fromDate;
            cmd.Parameters.Add("@To", SqlDbType.DateTime).Value = toDate;

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);

        }
        return dt;
    }

    protected void btnB_Print_Click(object sender, EventArgs e)
    {
        Warning[] warnings;
        string[] streamIds;
        string contentType;
        string encoding;
        string extension;

        //Export the RDLC Report to Byte Array.
        byte[] bytes = ReportViewer1.LocalReport.Render(ddlFileFormat.SelectedItem.Value, null, out contentType, out encoding, out extension, out streamIds, out warnings);

        //Download the RDLC Report in Word, Excel, PDF and Image formats.
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = contentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=RDLC." + extension);
        Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();
    }
}

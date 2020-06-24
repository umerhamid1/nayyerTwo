using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class BillTable : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=OrderManagementSystem;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            string sql = "SELECT DISTINCT [CompanyName] FROM [BillReceive] WHERE (Jrn_Type = N'Receive')";
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
    }

    protected void btnR_Search_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        GridView2.Visible = true;
    }

    protected void btnR_GetAllRecord_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        GridView2.Visible = false;
    }

    protected void btnR_AddNewCustomer_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReceiveAttributes.aspx");
    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        string VrNo = GridView1.SelectedRow.Cells[0].Text;
        Response.Redirect("ReceiveAttributesUpdate.aspx?VrNo=" + VrNo);
    }
    protected void GridView2_SelectedIndexChanged1(object sender, EventArgs e)
    {
        string VrNo = GridView2.SelectedRow.Cells[0].Text;
        Response.Redirect("ReceiveAttributesUpdate.aspx?VrNo=" + VrNo);
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnGetPassword_Click(object sender, EventArgs e)
    {
        String password;
        String mycon = "Data Source=.;Initial Catalog=OrderManagementSystem;Integrated Security=True";
        String myquery = "Select * from Login where email='" + txtemail.Text + "'";
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
            password = ds.Tables[0].Rows[0]["password"].ToString();
            sendpassword(password, txtemail.Text);

            lblmsg2.Text = "Your Password Has Been Sent To Your Email.";
            lblmsg1.Visible = false;
            lblmsg2.Visible = true;
        }
        else
        {
            lblmsg1.Text = "Your Email isn't Registered.";
            lblmsg2.Visible = false;
            lblmsg1.Visible = true;
        }
        con.Close();
    }

    private void sendpassword(String password, String email)
    {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("Princerizwan985@gmail.com", "mumTAZ890");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Forgot Password ( NAYYER CARPETS KARACHI )";
        msg.Body = "Dear Friend, Your Password is  " + password + "\n\n\nThanks & Regards\nNAYYER CARPETS Team";
        string toaddress = txtemail.Text;
        msg.To.Add(toaddress);
        string fromaddress = "NAYYER CARPETS KARACHI <Princerizwan985@gmail.com>";
        msg.From = new MailAddress(fromaddress);
        try
        {
            smtp.Send(msg);
        }
        catch
        {
            throw;
        }
    }
}
   
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
        String mycon = System.Configuration.ConfigurationManager.ConnectionStrings["OrderManagementSystemConnectionString"].ConnectionString;
            //"Data Source=.;Initial Catalog=OrderManagementSystem;Integrated Security=True";
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
    protected void SendMail(string password , string email)
    {
        var fromAddress = "nayyerkarachi@gmail.com";
        var toAddress = email;
        const string fromPassword = "nayyerkarachi1!@";
        string subject = "Forgot Password ( NAYYER CARPETS KARACHI )";
        string body = "Dear Friend, Your Password is '"+password+"' \n\n\nThanks & Regards\nNAYYER CARPETS Team";
      


        try
        {
            using (MailMessage mm = new MailMessage(fromAddress, toAddress))
            {

                mm.Subject = subject;
                mm.Body = body;

                mm.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential(fromAddress, fromPassword);
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);

            }
        }
        catch (Exception ex)
        {

            Response.Write("Error" + ex.Message);
        }
    }




    private void sendpassword(String password, String email)
    {
        SendMail(password,email);
    
    }

}

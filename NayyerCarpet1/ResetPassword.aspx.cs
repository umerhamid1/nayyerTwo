using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Net.Mail;
using System.Configuration;
using System.Data;
using System.Net;

public partial class ForgotPassword : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["OrderManagementSystemConnectionString"].ConnectionString
        //"Data Source=.;Initial Catalog=OrderManagementSystem;Integrated Security=True"
        );
    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        //try
        //{
            Session["Email"] = txtemail.Text;
            SqlDataAdapter adp = new SqlDataAdapter("select * from Login where Email=@Email", con);
            con.Open();
            adp.SelectCommand.Parameters.AddWithValue("@Email", txtemail.Text);
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                SqlCommand cmd = new SqlCommand("Update Login set password_change_status=1 where Email='" + txtemail.Text + "'", con);
                cmd.ExecuteNonQuery();
                SendEmail();

                lblmsgerror2.Text = "Reset link Sent On Your Email.";
                con.Close();
                cmd.Dispose();
                txtemail.Text = "";
                lblmsgerror2.Visible = true;
                lblmsgerror1.Visible = false;
            }
            else
            {
                lblmsgerror1.Text = "Your Email isn't Registered.";
                lblmsgerror1.Visible = true;
                lblmsgerror2.Visible = false;

            }
        //}
        //catch (Exception ex)
        //{

        //}
    }

    // using this method we sent the mail to reciever

    private void SendEmail()
    {
        //try
        //{
            
        
        var fromAddress = "nayyerkarachi@gmail.com";
        var toAddress = GetUserEmail(txtemail.Text);
        const string fromPassword = "nayyerkarachi1!@";
        string subject = "Reset Password ( NAYYER CARPETS KARACHI )";
        string body = "Dear Friend,  \n\n\nClick on below given link to Reset Your Password";
        //body += "<a href=https://nayyerkarachi.com/RecoverPassword.aspx?username=" + GetUserEmail(txtemail.Text) +" &Email = " + txtemail.Text + " >  Click Here to Change Your Password </ a >  \n \n  ";
        body += "<a href=http://localhost:50817/RecoverPassword.aspx?username=" + GetUserEmail(txtemail.Text) + " &Email = " + txtemail.Text + " >  Click Here to Change Your Password </ a > \n";
        body += "   \n\n\n Thanks & Regards<br>\n NAYYER CARPETS Team ";



        try
        {
            using (MailMessage mm = new MailMessage(fromAddress, toAddress))
            {

                mm.Subject = subject;
                mm.Body = body;

                mm.IsBodyHtml = true;
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




        //}
        //catch (Exception ex)
        //{

        //}
    }

    private string GetUserEmail(string Email)
    {
        SqlCommand cmd = new SqlCommand("select email from Login WHERE email=@Email", con);
        cmd.Parameters.AddWithValue("@Email", txtemail.Text);
        string username = cmd.ExecuteScalar().ToString();
        return username;
    }






}

   
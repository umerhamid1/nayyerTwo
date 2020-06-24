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

public partial class ForgotPassword : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=OrderManagementSystem;Integrated Security=True");
    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        try
        {
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
        }
        catch (Exception ex)
        {

        }
    }

    // using this method we sent the mail to reciever

    private void SendEmail()
    {
        try
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Dear Friend,<br/> Click on below given link to Reset Your Password<br/> <br>");
            //sb.Append("<a href=http://localhost:57355/codesoluation/resetlink.aspx?username=" + GetUserEmail(txtemail.Text));
            sb.Append("<a href=http://localhost:2095/RecoverPassword.aspx?username=" + GetUserEmail(txtemail.Text));

            sb.Append("&Email=" + txtemail.Text + ">Click Here to Change Your Password</a><br/>");
            sb.Append("<br><br>Thanks & Regards<br>NAYYER CARPETS Team");
            MailMessage message = new System.Net.Mail.MailMessage("NAYYER CARPETS KARACHI <Princerizwan985@gmail.com>", txtemail.Text.Trim(), "Reset Your Password ( NAYYER CARPETS KARACHI )", sb.ToString());
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("Princerizwan985@gmail.com", "mumTAZ890");
            smtp.EnableSsl = true;
            message.IsBodyHtml = true;
            smtp.Send(message);
        }
        catch (Exception ex)
        {

        }
    }

    private string GetUserEmail(string Email)
    {
        SqlCommand cmd = new SqlCommand("select email from Login WHERE email=@Email", con);
        cmd.Parameters.AddWithValue("@Email", txtemail.Text);
        string username = cmd.ExecuteScalar().ToString();
        return username;
    }
}

   
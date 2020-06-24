<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forget Password</title>

    <link href="Style%20Sheet/LoginForgetReset.css" rel="stylesheet" />
    <link href="bootstrap-4.4.1/css/bootstrap.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <h2>Forget Password</h2>

            <div class="alert alert-info">
                <p class="m-0">Enter your E-mail below and we will send you get password instructions!</p>
		    </div>
                
            <div class="inputBox">
                <asp:TextBox ID="txtemail" runat="server" name="" TextMode="Email" required=""></asp:TextBox>
                <label>Email</label>
            </div>

            <div class="float-right" >
                <asp:Button ID="btnGetPassword" runat="server" Text="Get Password" class="btn btn-primary" OnClick="btnGetPassword_Click"/>
            </div>

            <br />
            <asp:Label ID="lblmsg1" runat="server" style="font-size: 15px; color: #FF3300; font-weight: 700"></asp:Label>
            <asp:Label ID="lblmsg2" runat="server" style="font-size: 15px; color: #009933; font-weight: 700"></asp:Label>
           
            <br />

           <div class="text-center" style="color:White;" >
                Remembered?
                <a href="Login.aspx" style="color:deepskyblue;">Login!</a>
           </div> 
        </div>

    </form>
</body>
</html>

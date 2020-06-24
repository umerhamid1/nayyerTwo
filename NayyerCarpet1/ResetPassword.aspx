<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>

    <link href="Style%20Sheet/LoginForgetReset.css" rel="stylesheet" />
    <link href="bootstrap-4.4.1/css/bootstrap.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <h2>Reset Password</h2>

            <div class="alert alert-info">
                <p class="m-0">Enter your E-mail below and we will send you get password instructions!</p>
		    </div>
                
            <div class="inputBox">
                <asp:TextBox ID="txtemail" runat="server" name="" TextMode="Email" required=""></asp:TextBox>
                <label>Email</label>
            </div>

            <div class="float-right" >
                <asp:Button ID="btnReset" runat="server" Text="Reset" class="btn btn-primary" OnClick="btnReset_Click"/>
            </div>

            <br />
            
            <asp:Label ID="lblmsgerror1" runat="server" style="font-size: 15px; color: #FF3300; font-weight: 700"></asp:Label>
            <asp:Label ID="lblmsgerror2" runat="server" style="font-size: 15px; color: #009933; font-weight: 700"></asp:Label>
           
            <br />

           <div class="text-center" style="color:White;" >
                Remembered?
                <a href="Login.aspx" style="color:deepskyblue;">Login!</a>
           </div> 
        </div>

    </form>
</body>
</html>

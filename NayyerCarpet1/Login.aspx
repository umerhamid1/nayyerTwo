<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <link href="Style%20Sheet/LoginForgetReset.css" rel="stylesheet" />
    <link href="bootstrap-4.4.1/css/bootstrap.css" rel="stylesheet" />
 
</head>
<body>
    <form id="form2" runat="server">

        <div class="box">
            <h2>Sign Up Now</h2>
        
            <div class="inputBox">
                <asp:TextBox ID="txtEmail" runat="server" name="" required=""></asp:TextBox>
                <label>Email</label>
            </div>

            <div class="clearfix" >
                <a href="ResetPassword.aspx" class="float-right" style="color:deepskyblue;">Reset Password?</a>
            </div>
       
            <div class="inputBox">
                <asp:TextBox ID="txtpassword" runat="server" name="" required="" TextMode="Password"></asp:TextBox>
                <label>Password</label>
            </div>
            
            <div class="float-right" >
                <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-primary" OnClick="btnLogin_Click" />
            </div>
                
            <br />
            
            <asp:Label ID="lblmsgerror" runat="server" Text="Incorrect User Name and Password!" style="font-size: 15px; color: red; font-weight: 700"></asp:Label>
           
            <br />
            
            <div class="text-center" style="color:White;" >
                Don't have an account yet? 
                <a href="ForgetPassword.aspx" style="color:deepskyblue;">Forget Password!</a>
            </div>
        </div>
    </form>
</body>
</html>

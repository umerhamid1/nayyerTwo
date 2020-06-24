<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecoverPassword.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recover Password</title>

    <link href="Style%20Sheet/LoginForgetReset.css" rel="stylesheet" />
    <link href="bootstrap-4.4.1/css/bootstrap.css" rel="stylesheet" />
 
</head>
<body>
    <form id="form2" runat="server">

        <div class="box">
            <h2>Recover Password</h2>
        
            <div class="inputBox">
                <asp:TextBox ID="txtnewpwd" runat="server" TextMode="Password" name="" required=""></asp:TextBox>
                <label>New Password</label>
            </div>

            <div class="inputBox">
                <asp:TextBox ID="txtconfirmpwd" runat="server" TextMode="Password" name="" required=""></asp:TextBox>
                <label>Confirm Password</label>
            </div>
            
            <div class="float-right" >
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-primary" OnClick="btnSubmit_Click"/>
            </div>
         
            <br />

            <asp:CompareValidator ID="CompareValidatorPassword" runat="server" ControlToCompare="txtnewpwd" ControlToValidate="txtconfirmpwd" ErrorMessage="Password Does Not Match" ForeColor="Red" style="font-weight: 700"></asp:CompareValidator>
               
            <br />

            <div class="text-center" style="color:White;" >
                Remembered?
                <a href="Login.aspx" style="color:deepskyblue;">Login!</a>
           </div> 
        </div>
    </form>
</body>
</html>

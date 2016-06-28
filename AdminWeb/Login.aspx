<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="AdminWeb_Login" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Login | Adminstrator</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


    <script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#login").validate({
            rules: {
                user: { required: true },
                pswd: { required: true }
            },
            messages: {
                user: { required: 'Username Harus Di Isi!' },
                pswd: { required: 'Password Baru Harus Di Isi!'}
            }
        });
    });
</script>
    <style>
        #login label.error {
color:#F00;
font-size:12px;
}
        body 
        {
            background-color:#000;
        }
        #login 
        {
            background:#344;
            margin-top:30%;
            border:1px solid #000;
            padding:10%;
            border-radius:10px;
        }
        h3
        {
            color:#fff;
            z-index:999;
        }
        #submit, #reset 
        {
            background:#344;
        }
        #submit:hover, #reset:hover 
        {
            background:#374;
        }
    </style>
  </head>
  <body>
  <div class="container-fluid">
  <div class="row">
  <div class="col-md-3 col-md-offset-3">
      <form id="login" runat="server">
  <i class="glyphicon glyphicon-lock" style="color:#fff; font-size:24px;" aria-hidden="true"> Login</i><hr />
  <div class="form-group">
      <asp:TextBox ID="txtUserName" name="user" CssClass="form-control" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Please enter Username" ForeColor="Red" ControlToValidate="txtUserName" runat="server" />
    <br />
<asp:TextBox ID="txtPWD" class="form-control" name="pswd" runat="server" TextMode="Password"/>
<asp:RequiredFieldValidator ID="rfvUser" ErrorMessage="Please enter Password" ForeColor="Red" ControlToValidate="txtUserName" runat="server" />
    <br />
<asp:Button ID="btnSubmit" runat="server" Text="Login" CssClass="btn btn-default" onclick="btnSubmit_Click" />
      </form>
    </div>
    </div>


    </div>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>

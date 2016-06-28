<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddAdmin.aspx.cs" Inherits="AdminWeb_AddAdmin" %>
<script runat="server">
    protected void Logout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Add Admin | Administrator</title>
<link rel="shortcut icon" href="images/ico.ico"/>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
#Logout {
    border:none;
    outline:none;
    margin-top:10px;
}
/* untuk pemakaian di blog/website anda, yang di copy hanya css di bawah ini*/
	/* style untuk link popup */
    a.popup-link {
		padding:17px 0;
		text-align: center;
		margin:7% auto;
		position: relative;
		width: 300px;
		color: #fff;
		text-decoration: none;
		background-color: #333;
		border-radius: 3px;
		display: block;
	}
	a.popup-link:hover {
		background-color: #fff;
		color:#000;
		border:1px solid #000;
		-webkit-transition:all 1s;
		-moz-transition:all 1s;
		transition:all 1s;
	}
	/* end link popup*/

	/*style untuk popup */	
    #popup {
		visibility: hidden;
		opacity: 0;
		margin-top: -200px;
	}
	#popup:target {
		visibility:visible;
		opacity: 1;
		background-color: rgba(255,255,255,0.8);
		position: fixed;
		top:0;
		left:0;
		right:0;
		bottom:0;
		margin:0;
		z-index: 99999999999;
		-webkit-transition:all 1s;
		-moz-transition:all 1s;
		transition:all 1s;
	}

	@media (min-width: 768px){
		.popup-container {
			width:350px;
		}
	}
	@media (max-width: 767px){
		.popup-container {
			width:100%;
		}
	}
	.popup-container {
		position: relative;
		margin:7% auto;
		padding:30px 50px;
		background-color: #333;
		color:#fff;
		border-radius: 3px;
	}

	a.popup-close {
		position: absolute;
		top:3px;
		right:3px;
		background-color: #fff;
		padding:7px 10px;
		font-size: 20px;
		text-decoration: none;
		line-height: 1;
		color:#333;
	}

	/* style untuk isi popup */


	.popup-form {
		margin:10px auto;
	}
		.popup-form h2 {
			margin-bottom: 5px;
			font-size: 37px;
			text-transform: uppercase;
		}
		.popup-form .input-group {
			margin:10px auto;
		}
			.popup-form .input-group input {
				padding:17px;
				text-align: center;
				margin-bottom: 10px;
				border-radius:3px;
				font-size: 16px; 
				display: block;
				width: 100%;
			}
			.popup-form .input-group input:focus {
				outline-color:#FB8833; 
			}
			.popup-form .input-group input[type="email"] {
				border:0px;
				position: relative;
			}
			.popup-form .input-group input[type="submit"] {
				background-color: #FB8833;
				color: #fff;
				border: 0;
				cursor: pointer;
			}
			.popup-form .input-group input[type="submit"]:focus {
				box-shadow: inset 0 3px 7px 3px #ea7722;
			} 
	/* end isi form */
	</style>
</head>

<body>

    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="background:#000; border-bottom:1px solid #FFF;">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="Dashbord.aspx">Dashbord Web</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                
                <li style="background:#000;">
                    <a><i class="fa fa-user" style="color:#fff;">
                    <asp:Label ID="User" runat="server" ForeColor="White"></asp:Label>
                    </i> </a>
                    </li>
                        <li>
                            <a href="Logout.aspx"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                        <form runat="server">
                        
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav" id="menu">
                    <li class="active">
                        <a href="Dashbord.aspx">Dashbord</a>
                    </li>
                   <li class="active">
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Admin <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li class="active" style="background:#000;">
                                <a href="AddAdmin.aspx">Add Admin</a>
                            </li>
                            <li class="active" style="background:#000;">
                                <a href="EditDeleteAdmin.aspx">Edit Delete Admin</a>
                            </li>
                        </ul>
                    </li>
                    <li class="active">
                        <a href="javascript:;" data-toggle="collapse" data-target="#news"><i class="fa fa-fw fa-arrows-v"></i> News <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="news" class="collapse">
                            <li class="active" style="background:#000;">
                                <a href="AddNews.aspx">Add News</a>
                            </li>
                            <li class="active" style="background:#000;">
                                <a href="EditDeleteNews.aspx">Edit Delete News</a>
                            </li class="active">
                        </ul>
                    </li>
                    <li class="active">
                        <a href="javascript:;" data-toggle="collapse" data-target="#catnews"><i class="fa fa-fw fa-arrows-v"></i> News Category <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="catnews" class="collapse">
                            <li class="active" style="background:#000;">
                                <a href="AddNewsCategory.aspx">Add News Category</a>
                            </li>
                            <li class="active" style="background:#000;">
                                <a href="EditDeleteNewsCategory.aspx">Edit Delete News Category</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">
                            <!-- Page Heading -->
                <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-4">
                        <h1 class="page-header">
                            Add Data Admin
                        </h1>
<div id="closed"></div>
<a href="#popup" class="popup-link">Klick To Add Data Admin</a>
<div class="popup-wrapper" id="popup">
 <div class="popup-container">
		<div class="popup-form">
                            <asp:TextBox ID="txtid" placeholder="ID Admin.." runat="server" Width="250px" 
                                    CssClass="form-control" ontextchanged="txtid_TextChanged" disabled></asp:TextBox>
                        <br />
                            <asp:TextBox ID="txtnama" placeholder="Name.." runat="server" Width="250px" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Can not be empty!" ForeColor="Red" ControlToValidate="txtnama" runat="server" />
                           
                        <br />
                            <asp:TextBox ID="txtuser" placeholder="Username.." runat="server" Width="250px" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Can not be empty!" ForeColor="Red" ControlToValidate="txtuser" runat="server" />
                           
                        <br />
                            <asp:TextBox ID="txtpswd1" type="password" placeholder="Password.." runat="server" Width="250px" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Can not be empty!" ForeColor="Red" ControlToValidate="txtpswd1" runat="server" />
                           
                        <br />
                            <asp:TextBox ID="txtpswd2" type="password" placeholder="Re-Password.." runat="server" Width="250px" CssClass="form-control"></asp:TextBox>
                        <br />
                        <%--<asp:HiddenField runat="server" ID="txtId" />--%>
                        <asp:Button class="btn btn-default" id="simpanKat" runat="server" Text="Simpan" OnClick="simpanKat_Click"/>
                        <button type="reset" class="btn btn-default">Batal</button>
                        </div>
		<a class="popup-close" href="#closed"><a class="popup-close" href="AddAdmin.aspx">X</a></a>
	</div>
</div>
                </div>
          </form>
                <div class="col-lg-4" style="margin-top:5px; margin-left:20px;">
            <h1>Admin Data</h1>
            <hr />
            <div>
            <asp:PlaceHolder ID="Datacat" runat="server"></asp:PlaceHolder>
            </div>
            <br />
            <asp:Label runat="server" ID="txtError"></asp:Label>
                    </div>
                </div>
            </div>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>

    </form>

</body>

</html>
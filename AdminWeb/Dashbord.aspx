<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashbord.aspx.cs" Inherits="AdminWeb_Dashbord" %>
<script runat="server">
    protected void Page_Load(object sender, System.EventArgs e) {
        if (Session["Id"] == "1" && Session["Username"] != "")
        {
            User.Text += Session["Username"];
            string id = Session["ID_Admin"].ToString();
        }
        else
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }

        //if (!IsPostBack)
        //{
        //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        //    Response.Cache.SetNoStore();
        //}
        Response.Cache.SetNoStore();
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        
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

    <title>Dashbord | Administrator</title>
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
    </style>
</head>

<body>

    <form id="form1" runat="server">

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
                        <h1 class="page-header">
                            Welcome To Dashbord Website
                        </h1>
                            <br><br><br><br><br><br><br><br><br><br>
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
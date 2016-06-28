<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditDeleteAdmin.aspx.cs" Inherits="AdminWeb_EditDeleteAdmin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Update and Delete Admin | Administrator</title>

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
    <div id="wrapper">

    <form id="form1" runat="server">
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="background:#000; border-bottom:1px solid #FFF;">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="Dashbord.aspx">Dashbord Web</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li style="background:#000;">
                    <a><i class="fa fa-user">
                    <asp:Label ID="User" runat="server"></asp:Label>
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
                        <a href="Dashbord.aspx">Home Admin</a>
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
                                <a href="EditDeleteCategory.aspx">Edit Delete News Category</a>
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
                        <h3>
                            Update and Delete Admin
                        </h3>
                            <asp:TextBox ID="txtidadmin" placeholder="ID Admin.." ReadOnly runat="server" Width="250px" 
                                    CssClass="form-control"></asp:TextBox>
                        <br />
                            <asp:TextBox ID="txtnama" placeholder="Name.." runat="server" Width="250px" CssClass="form-control"></asp:TextBox>
                           
                        <br />
                            <asp:TextBox ID="txtuser" placeholder="Username.." runat="server" Width="250px" CssClass="form-control"></asp:TextBox>

                        <br />
                            <asp:TextBox ID="txtpwd" placeholder="Password.." runat="server" Width="250px" CssClass="form-control" Type="Password"></asp:TextBox>

                        <br />
                        <%--<asp:HiddenField runat="server" ID="txtId" />--%>
                        <asp:Button class="btn btn-default" id="simpanKat" runat="server" Text="Save" OnClick="simpanKat_Click"/>
                        <button type="reset" class="btn btn-default">Cancel</button>
                        
                        
	

                </div>
                <div class="col-lg-6" style="margin-top:5px; margin-left:20px;">
            <h3>Admin Data</h3>
            <hr />
            <div>
            <asp:GridView ID="gvDetail" CssClass="table table-bordered" style="width:100%;" runat="server" AllowPaging="true" 
            AutoGenerateColumns="false" Width="360px" OnSelectedIndexChanged="gvDetail_SelectedIndexChanged" DataKeyNames="ID_Admin">
            <Columns>
            <asp:TemplateField HeaderText="ID Admin">
                <ItemTemplate>
                    <asp:Label ID="lblID" Text='<%#Eval("ID_Admin") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="lblNamaAdmin" Text='<%#Eval("Nama") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Username">
                <ItemTemplate>
                    <asp:Label ID="lblUser" Text='<%#Eval("Username") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password">
                <ItemTemplate>
                    <asp:Label ID="lblPassword" Visible="false" Text='<%#Eval("Password") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkRemove" CommandArgument='<%#Eval("ID_Admin") %>' runat="server" OnClientClick="return confirm('Do You Want to Delete this Data?')"
                    Text="Delete" OnClick="Delete"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkSelect" CommandName="Select" runat="server" Text="Select"/>
                </ItemTemplate>
            </asp:TemplateField>
            </Columns>
            </asp:GridView>
            </div>
            <br />
            <asp:Label runat="server" ID="txtError"></asp:Label>
                    </div>
                </div>
            </div>
            </div>
            <!-- /.container-fluid -->
    
          </form>

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

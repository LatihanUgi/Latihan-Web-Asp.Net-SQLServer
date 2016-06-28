<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNews.aspx.cs" Inherits="AdminWeb_AddNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Add News | Administrator</title>
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
<script src="js/jquery.js"></script><script language="javascript" type="text/javascript"
src="editor/tiny_mce_src.js"></script>
<%--<script type="text/javascript">
    tinyMCE.init({
        mode: "textareas",
        theme: "advanced",
        plugins: "table,youtube,advhr,advimage,advlink,emotions,flash,searchreplace,paste,directionality,noneditable,contextmenu",

        theme_advanced_buttons2_add: "separator,preview,zoom,separator,forecolor,backcolor,liststyle,fontselect,fontsizeselect",
        theme_advanced_buttons2_add_before: "cut,copy,paste,separator,search,replace,separator",
        theme_advanced_buttons3_add_before: "tablecontrols,separator,youtube,separator",
        theme_advanced_buttons3_add: "emotions,flash",
        theme_advanced_toolbar_location: "top",
        theme_advanced_toolbar_align: "left",
        theme_advanced_statusbar_location: "bottom",
        extended_valid_elements: "hr[class|width|size|noshade]",
        file_browser_callback: "fileBrowserCallBack",
        paste_use_dialog: false,
        theme_advanced_resizing: true,
        theme_advanced_resize_horizontal: false,
        theme_advanced_link_targets: "_something=My somthing;_something2=My somthing2;_something3=My somthing3;",
        apply_source_formatting: true
    });

    function fileBrowserCallBack(field_name, url, type, win) {
        var connector = "../../filemanager/browser.html?Connector=connectors/php/connector.php";
        var enableAutoTypeSelection = true;

        var cType;
        tinymcpuk_field = field_name;
        tinymcpuk = win;

        switch (type) {
            case "image":
                cType = "Image";
                break;
            case "flash":
                cType = "Flash";
                break;
            case "file":
                cType = "File";
                break;
        }

        if (enableAutoTypeSelection && cType) {
            connector += "&Type=" + cType;
        }

        window.open(connector, "tinymcpuk", "modal,width=600,height=400");
    }
</script>--%>
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
                            Add News
                        </h1>
<div id="closed">
                        </div>
                            <asp:TextBox ID="txtidberita" placeholder="ID Berita.." runat="server" 
                            Width="250px" CssClass="form-control" disabled 
                            ontextchanged="txtidberita_TextChanged"></asp:TextBox>
                        <br />
                            <textarea ID="txtjudul" rows="1" cols="50" runat="server" class="form-control" placeholder="News Title.." name="produk" style="width:50%;"></textarea>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Can not be empty!" ForeColor="Red" ControlToValidate="txtjudul" runat="server" />
                                    <br />
                        <asp:DropDownList ID="katberita" CssClass="form-control" runat="server" 
                            Width="200px" DataSourceID="DropDownList" DataTextField="NamaKategori" 
                            DataValueField="NamaKategori">
    </asp:DropDownList>
                        <asp:SqlDataSource ID="DropDownList" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:berita %>" 
                            SelectCommand="SELECT [NamaKategori] FROM [Kategori]"></asp:SqlDataSource>
                        <%--<asp:Button class="btn btn-default" id="Pilih" runat="server" Text="Choise" 
                            onclick="Pilih_Click" />--%>
                            <%--<asp:TextBox ID="idkat" placeholder="News Title.." Visible="true" 
                            runat="server" Width="400px" 
                                    CssClass="form-control" ontextchanged="idkat_TextChanged"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ErrorMessage="You must click button choise!" ForeColor="Red" ControlToValidate="idkat" runat="server" />--%>
    <%--<asp:TextBox ID="textareas" runat="server" CssClass="form-control" TextMode="Multiline" Columns="30" Rows="15" style="width:80%;" placeholder="News.."></asp:TextBox>--%>
                               <br /> <textarea ID="textareas" rows="15" cols="50" runat="server" placeholder="News .." class="form-control" name="produk" style="width:90%;"></textarea>	
                               
                       <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Can not be empty!" ForeColor="Red" ControlToValidate="textareas" runat="server" />--%>
                        <br />
                            <textarea ID="txtsumber" rows="1" cols="1" runat="server" class="form-control" placeholder="News Source.." name="produk" style="width:50%;"></textarea>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Can not be empty!" ForeColor="Red" ControlToValidate="txtsumber" runat="server" />
                        <br />
    <asp:TextBox ID="namaAdmin" runat="server" CssClass="form-control" placeholder="Name Admin.." Width="250px" disabled></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ErrorMessage="Can not be empty!" ForeColor="Red" ControlToValidate="namaAdmin" runat="server" />
                        <br />
    <asp:FileUpload id="FileUploadControl" Width="300px" runat="server" CssClass="form-control" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ErrorMessage="Can not be empty!" ForeColor="Red" ControlToValidate="FileUploadControl" runat="server" />
                        <br />
    <asp:TextBox ID="txtidadmin" runat="server" Visible="false" CssClass="form-control" placeholder="Name Admin.."></asp:TextBox>
    <asp:Label ID="lbldatetime" Visible="false" runat="server"></asp:Label>
                        <asp:Button class="btn btn-default" id="simpanBer" runat="server" Text="Simpan" 
                            onclick="simpanBer_Click" />
                        <Button class="btn btn-default" type="Reset" runat="server">Cancel</Button><br />
    <asp:Label runat="server" id="StatusLabel" text="Status: " />
                </div>
                <div class="col-lg-12">
            <h1>News Data</h1>
            <hr />
            <asp:PlaceHolder ID="DataNews" runat="server"></asp:PlaceHolder>
            <div>
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

    
   

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>

    </form>

</body>

</html>

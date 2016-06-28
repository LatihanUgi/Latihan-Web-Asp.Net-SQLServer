<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditDeleteNews.aspx.cs" Inherits="AdminWeb_EditDeleteNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Edit Delete News | Administrator</title>
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
                            Update and Delete News
                        </h1>
<div id="closed">
                        </div>
                            <asp:TextBox ID="txtidberita" placeholder="ID Berita.." ReadOnly runat="server" 
                            Width="250px" CssClass="form-control" disabled 
                            ontextchanged="txtidberita_TextChanged"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" ErrorMessage="Can not be empty!" ForeColor="Red" ControlToValidate="txtidberita" runat="server" />
                        <br />
                            <asp:TextBox ID="txtjudul" placeholder="News Title.." runat="server" Width="400px" 
                                    CssClass="form-control" AutoPostBack="false"></asp:TextBox>
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
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ErrorMessage="You must click button choise!" ForeColor="Red" ControlToValidate="idkat" runat="server" />--%><br />
    <asp:TextBox ID="textareas" AutoPostBack="false" runat="server" CssClass="form-control" TextMode="Multiline" Columns="30" Rows="15" style="width:80%;" placeholder="News.."></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Can not be empty!" ForeColor="Red" ControlToValidate="textareas" runat="server" />
    <%--
                                <textarea ID="textareas" rows="15" cols="50" runat="server" class="form-control" name="produk" style="width:90%;"></textarea>	--%>
                        <br />
    <asp:TextBox ID="txtsumber" AutoPostBack="false" runat="server" CssClass="form-control" placeholder="News Source.." style="width:400px;"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Can not be empty!" ForeColor="Red" ControlToValidate="txtsumber" runat="server" />
                        <br />
    <asp:TextBox ID="namaAdmin" runat="server" CssClass="form-control" placeholder="Name Admin.." Width="250px" disabled></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ErrorMessage="Can not be empty!" ForeColor="Red" ControlToValidate="namaAdmin" runat="server" />
                        <br />
    <asp:FileUpload id="FileUploadControl" Width="300px" runat="server" CssClass="form-control" />
                        <br />
    <asp:TextBox ID="txtidadmin" runat="server" Visible="false" CssClass="form-control" placeholder="Name Admin.."></asp:TextBox>
    <asp:Label ID="lbldatetime" Visible="false" runat="server"></asp:Label>
                        <asp:Button class="btn btn-default" id="simpanBer" runat="server" Text="Simpan" 
                            onclick="simpanBer_Click" />
                        <asp:Button class="btn btn-default" id="Reset" runat="server" Text="Cancel" 
                            onclick="Reset_Click"/><br />
    <asp:Label runat="server" id="StatusLabel" text="Status: " />
                </div>
                <div class="col-lg-12">
            <h1>News Data</h1>
            <hr />
            <asp:PlaceHolder ID="DataNews" runat="server"></asp:PlaceHolder>
            <%--<asp:GridView ID="gvDetail" runat="server" AllowPaging="true" 
            AutoGenerateColumns="false" Width="360px" OnSelectedIndexChanged="gvDetail_SelectedIndexChanged" DataKeyNames="ID_Berita">
            <Columns>
            <asp:TemplateField HeaderText="ID Berita">
                <ItemTemplate>
                    <asp:Label ID="lblID" Text='<%#Eval("ID_Berita") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Judul">
                <ItemTemplate>
                    <asp:Label ID="lbljudul" Text='<%#Eval("Judul") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kategori">
                <ItemTemplate>
                    <asp:Label ID="lblkategori" Text='<%#Eval("NamaKategori") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Berita">
                <ItemTemplate>
                    <asp:Label ID="lblberita" Text='<%#Eval("IsiBerita") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sumber">
                <ItemTemplate>
                    <asp:Label ID="lblsumber" Text='<%#Eval("Sumber") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Admin">
                <ItemTemplate>
                    <asp:Label ID="lbladmin" Text='<%#Eval("Admin") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Foto">
                <ItemTemplate>
                    <asp:Label ID="lblfoto" Text='<%#Eval("Foto") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkRemove" CommandArgument='<%#Eval("ID_Berita") %>' runat="server" OnClientClick="return confirm('Do You Want to Delete this Data?')"
                    Text="Delete" OnClick="Delete"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkSelect" CommandName="Select" runat="server" Text="Select"/>
                </ItemTemplate>
            </asp:TemplateField>
            </Columns>
            </asp:GridView>--%>
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

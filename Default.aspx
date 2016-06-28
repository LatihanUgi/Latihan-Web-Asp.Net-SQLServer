<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<!--
Dokumen ini dibuat oleh I Putu Rama Adithya
http://id-id.facebook.com/Rama.Adithya31
-->
<title>Second Zone</title>
<!-- Begin Style -->
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/bree.css" />
<link id="clink" href="css/theme-green.css" title="style" rel="stylesheet" type="text/css" media="screen" />
<!-- Javascript -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/tooltip.js"></script>
<script type="text/javascript" src="js/progress.js"></script>
<script type="text/javascript" src="js/bottom-bar.js"></script>
<script type="text/javascript" src="js/scrollto.js"></script>
<script type="text/javascript" src="js/time.js"></script>
<script type="text/javascript" src="js/player.js"></script>
<script type="text/javascript" src="js/welcome-box.js"></script>
<script type="text/javascript" src="js/theme-switcher.js"></script>
</head>
<body>
<!-- navigation -->
<nav>
<ul>
<li><a href="Default.aspx">Second Zone</a></li>
<li><a href="Default.aspx" class="home">Home</a></li>
<li><a href="About.aspx">About</a></li>
<li><a href="News.aspx">News</a></li>
</ul>
<form id="Form1" runat="server"> 
<asp:TextBox id="search" runat="server" placeholder=" Search.." 
    ontextchanged="search_TextChanged"></asp:TextBox>
</form>
</nav>
<!-- main wrapper -->
<div id="wrapper"><div id="content-wrapper">
<!-- header -->
<!-- main content wrapper -->
<div id="main-wrapper">
<div id="post-list"><!-- div post list -->

<asp:PlaceHolder ID="DataNews" runat="server"></asp:PlaceHolder>

<%--<!-- Pagination -->
<div id="pagination">Halaman 1 dari 1</div>--%>

</div><!-- End post-list -->
</div><!-- end main wrapper -->

<aside id="sidebar">
<div class="widget">
 <h1 style="margin-left:20px;">News Category</h1>
 <asp:PlaceHolder ID="DataCategory" runat="server"></asp:PlaceHolder>
 </div>
</aside>

<!-- footer AREA -->
<footer>&copy; 2016 All Rights, Created by Second Zone</footer>
</div></div><!-- end wrapper -->
<!-- bottom fixed bar -->
<div style="display: none;" id="bottom-bar">
</div>
<!-- div scroll progress -->
<div id="scroll"></div>
<a href="#" class="close"></a>
</div>
</body>
</html>

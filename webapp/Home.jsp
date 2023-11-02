<%@ page import="com.utar.assignment.model.entity.Product" %>
<%@ page import="com.utar.assignment.model.entity.Productline" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <!--
    Kool Store Template
    http://www.templatemo.com/preview/templatemo_428_kool_store
    -->
    <meta charset="utf-8">
    <title>Kool Store - Responsive eCommerce Template</title>

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/normalize.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/templatemo-misc.css">
    <link rel="stylesheet" href="css/templatemo-style.css">

    <script src="js/vendor/modernizr-2.6.2.min.js"></script>

</head>
<body>
<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->

<%
    String customer_firstname = (String) request.getAttribute("CustomerFirstName");
    String customer_num = (String) request.getAttribute("CustomerNum");
    List<Product> staffs = (List<Product>) request.getAttribute("staffs");
%>

<header class="site-header">
    <div class="top-header">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="top-header-left">
                        <a href="index.jsp">Logout</a>
                    </div> <!-- /.top-header-left -->
                </div> <!-- /.col-md-6 -->
                <div class="col-md-6 col-sm-6">
                    <div class="social-icons">
                        <ul>
                            <li><a href="#" class="fa fa-facebook"></a></li>
                            <li><a href="#" class="fa fa-dribbble"></a></li>
                            <li><a href="#" class="fa fa-twitter"></a></li>
                            <li><a href="#" class="fa fa-linkedin"></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div> <!-- /.social-icons -->
                </div> <!-- /.col-md-6 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.top-header -->
    <div class="main-header">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-6 col-xs-8">
                    <div class="logo">
                        <h1><a href="#">Kool Store</a></h1>
                    </div> <!-- /.logo -->
                </div> <!-- /.col-md-4 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.main-header -->
    <div class="main-nav">
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-sm-7">
                    <div class="list-menu">
                        <ul>
                            <li><a href="HomeLogic?cusID=<%=customer_num%>" class="red-btn" style="font-size: 14px;">
                                Home
                            </a></li>
                            <li><a href="ViewProductLogic?cusID=<%=customer_num%>&recordsPerPage=20&currentPage=1&keyword=&direction=ASC" class="red-btn" style="font-size: 14px;">
                                Product
                            </a></li>
                            <li><a href="ViewOrderHistoryLogic?cusID=<%=customer_num%>"class="red-btn" style="font-size: 14px;">
                                Order History
                            </a></li>
                            <li><a href="ViewPaymentHistoryLogic?cusID=<%=customer_num%>"class="red-btn" style="font-size: 14px;">
                                Payment History
                            </a></li>
                        </ul>
                    </div> <!-- /.list-menu -->
                </div> <!-- /.col-md-6 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.main-nav -->
</header> <!-- /.site-header -->

<div class="content-section">
    <div class="container">
        <div class="row">

            <div class="col-md-4">
                <div class="product-item-3">
                    <div class="product-thumb">
                        <img src="images/featured/9.jpeg" alt="">
                    </div> <!-- /.product-thumb -->
                    <div class="product-content">
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <h5><% out.println("<a>" + staffs.get(28).getProductname() + "</a>"); %></h5>
                                <%out.println("<span class=\"tagline\">" + staffs.get(28).getProductline().getId() + "</span>");%>
                                <%out.println("<span class=\"price\"> $" + staffs.get(28).getMsrp() + "</span>");%>
                            </div> <!-- /.col-md-6 -->
                            <div class="col-md-6 col-sm-6">
                                <div class="full-row">
                                    <label for="cat0">Engine:</label>
                                    <select name="cat0" id="cat0" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">Diesel</option>
                                        <option class="level-0">Electric</option>
                                        <option class="level-0">Hybrid</option>
                                    </select>
                                </div>
                                <div class="full-row">
                                    <label for="cat1">CC:</label>
                                    <select name="cat1" id="cat1" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">1000</option>
                                        <option class="level-0">1500</option>
                                        <option class="level-0">2000</option>
                                        <option class="level-0">2500</option>
                                    </select>
                                </div>
                                <div class="full-row">
                                    <label for="cat2">Color:</label>
                                    <select name="cat2" id="cat2" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">Blue</option>
                                        <option class="level-0">Red</option>
                                        <option class="level-0">Pink</option>
                                        <option class="level-0">Black</option>
                                        <option class="level-0">White</option>
                                    </select>
                                </div>
                            </div> <!-- /.col-md-6 -->
                            <div class="col-md-12 col-sm-12">
                                <div class="button-holder">
                                    <div class="button-holder">
                                        <a href="ViewProductLogic?cusID=<%=customer_num%>&recordsPerPage=20&currentPage=1&keyword=&direction=ASC" class="red-btn" style="font-size: 14px;">
                                            Find out more
                                        </a>
                                    </div>
                                </div> <!-- /.button-holder -->
                            </div> <!-- /.col-md-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item-3 -->
            </div> <!-- /.col-md-4 -->

            <div class="col-md-4">
                <div class="product-item-3">
                    <div class="product-thumb">
                        <img src="images/featured/10.jpg" alt="">
                    </div> <!-- /.product-thumb -->
                    <div class="product-content">
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <h5><% out.println("<a>" + staffs.get(4).getProductname() + "</a>"); %></h5>
                                <%out.println("<span class=\"tagline\">" + staffs.get(4).getProductline().getId() + "</span>");%>
                                <%out.println("<span class=\"price\"> $" + staffs.get(4).getMsrp() + "</span>");%>
                            </div> <!-- /.col-md-6 -->
                            <div class="col-md-6 col-sm-6">
                                <div class="full-row">
                                    <label for="cat3">Engine:</label>
                                    <select name="cat3" id="cat3" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">Diesel</option>
                                        <option class="level-0">Electric</option>
                                        <option class="level-0">Hybrid</option>
                                    </select>
                                </div>
                                <div class="full-row">
                                    <label for="cat4">CC:</label>
                                    <select name="cat4" id="cat4" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">1000</option>
                                        <option class="level-0">1500</option>
                                        <option class="level-0">2000</option>
                                        <option class="level-0">2500</option>
                                    </select>
                                </div>
                                <div class="full-row">
                                    <label for="cat5">Color:</label>
                                    <select name="cat5" id="cat5" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">Blue</option>
                                        <option class="level-0">Red</option>
                                        <option class="level-0">Pink</option>
                                        <option class="level-0">Black</option>
                                        <option class="level-0">White</option>
                                    </select>
                                </div>
                            </div> <!-- /.col-md-6 -->
                            <div class="col-md-12 col-sm-12">
                                <div class="button-holder">
                                    <div class="button-holder">
                                        <a href="ViewProductLogic?cusID=<%=customer_num%>&recordsPerPage=20&currentPage=1&keyword=&direction=ASC" class="red-btn" style="font-size: 14px;">
                                            Find out more
                                        </a>
                                    </div>
                                </div> <!-- /.button-holder -->
                            </div> <!-- /.col-md-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item-3 -->
            </div> <!-- /.col-md-4 -->

            <div class="col-md-4">
                <div class="product-item-3">
                    <div class="product-thumb">
                        <img src="images/featured/11.jpg" alt="">
                    </div> <!-- /.product-thumb -->
                    <div class="product-content">
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <h5><% out.println("<a>" + staffs.get(89).getProductname() + "</a>"); %></h5>
                                <%out.println("<span class=\"tagline\">" + staffs.get(89).getProductline().getId() + "</span>");%>
                                <%out.println("<span class=\"price\"> $" + staffs.get(89).getMsrp() + "</span>");%>
                            </div> <!-- /.col-md-6 -->
                            <div class="col-md-6 col-sm-6">
                                <div class="full-row">
                                    <label for="cat6">Engine:</label>
                                    <select name="cat6" id="cat6" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">Diesel</option>
                                        <option class="level-0">Electric</option>
                                        <option class="level-0">Hybrid</option>
                                    </select>
                                </div>
                                <div class="full-row">
                                    <label for="cat7">CC:</label>
                                    <select name="cat7" id="cat7" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">1000</option>
                                        <option class="level-0">1500</option>
                                        <option class="level-0">2000</option>
                                        <option class="level-0">2500</option>
                                    </select>
                                </div>
                                <div class="full-row">
                                    <label for="cat8">Color:</label>
                                    <select name="cat8" id="cat8" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">Blue</option>
                                        <option class="level-0">Red</option>
                                        <option class="level-0">Pink</option>
                                        <option class="level-0">Black</option>
                                        <option class="level-0">White</option>
                                    </select>
                                </div>
                            </div> <!-- /.col-md-6 -->
                            <div class="col-md-12 col-sm-12">
                                <div class="button-holder">
                                    <div class="button-holder">
                                        <a href="ViewProductLogic?cusID=<%=customer_num%>&recordsPerPage=20&currentPage=1&keyword=&direction=ASC" class="red-btn" style="font-size: 14px;">
                                            Find out more
                                        </a>
                                    </div>
                                </div> <!-- /.button-holder -->
                            </div> <!-- /.col-md-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item-3 -->
            </div> <!-- /.col-md-4 -->
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="product-item-3">
                    <div class="product-thumb">
                        <img src="images/featured/12.jpg" alt="">
                    </div> <!-- /.product-thumb -->
                    <div class="product-content">
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <h5><% out.println("<a>" + staffs.get(36).getProductname() + "</a>"); %></h5>
                                <%out.println("<span class=\"tagline\">" + staffs.get(36).getProductline().getId() + "</span>");%>
                                <%out.println("<span class=\"price\"> $" + staffs.get(36).getMsrp() + "</span>");%>
                            </div> <!-- /.col-md-6 -->
                            <div class="col-md-6 col-sm-6">
                                <div class="full-row">
                                    <label for="cat9">Engine:</label>
                                    <select name="cat9" id="cat9" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">Diesel</option>
                                        <option class="level-0">Electric</option>
                                        <option class="level-0">Hybrid</option>
                                    </select>
                                </div>
                                <div class="full-row">
                                    <label for="cat10">CC:</label>
                                    <select name="cat10" id="cat10" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">1000</option>
                                        <option class="level-0">1500</option>
                                        <option class="level-0">2000</option>
                                        <option class="level-0">2500</option>
                                    </select>
                                </div>
                                <div class="full-row">
                                    <label for="cat11">Color:</label>
                                    <select name="cat11" id="cat11" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">Blue</option>
                                        <option class="level-0">Red</option>
                                        <option class="level-0">Pink</option>
                                        <option class="level-0">Black</option>
                                        <option class="level-0">White</option>
                                    </select>
                                </div>
                            </div> <!-- /.col-md-6 -->
                            <div class="col-md-12 col-sm-12">
                                <div class="button-holder">
                                    <div class="button-holder">
                                        <a href="ViewProductLogic?cusID=<%=customer_num%>&recordsPerPage=20&currentPage=1&keyword=&direction=ASC" class="red-btn" style="font-size: 14px;">
                                            Find out more
                                        </a>
                                    </div>
                                </div> <!-- /.button-holder -->
                            </div> <!-- /.col-md-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item-3 -->
            </div> <!-- /.col-md-4 -->

            <div class="col-md-4">
                <div class="product-item-3">
                    <div class="product-thumb">
                        <img src="images/featured/13.jpg" alt="">
                    </div> <!-- /.product-thumb -->
                    <div class="product-content">
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <h5><% out.println("<a>" + staffs.get(27).getProductname() + "</a>"); %></h5>
                                <%out.println("<span class=\"tagline\">" + staffs.get(27).getProductline().getId() + "</span>");%>
                                <%out.println("<span class=\"price\"> $" + staffs.get(27).getMsrp() + "</span>");%>
                            </div> <!-- /.col-md-6 -->
                            <div class="col-md-6 col-sm-6">
                                <div class="full-row">
                                    <label for="cat12">Engine:</label>
                                    <select name="cat12" id="cat12" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">Diesel</option>
                                        <option class="level-0">Electric</option>
                                        <option class="level-0">Hybrid</option>
                                    </select>
                                </div>
                                <div class="full-row">
                                    <label for="cat13">CC:</label>
                                    <select name="cat13" id="cat13" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">1000</option>
                                        <option class="level-0">1500</option>
                                        <option class="level-0">2000</option>
                                        <option class="level-0">2500</option>
                                    </select>
                                </div>
                                <div class="full-row">
                                    <label for="cat14">Color:</label>
                                    <select name="cat14" id="cat14" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">Blue</option>
                                        <option class="level-0">Red</option>
                                        <option class="level-0">Pink</option>
                                        <option class="level-0">Black</option>
                                        <option class="level-0">White</option>
                                    </select>
                                </div>
                            </div> <!-- /.col-md-6 -->
                            <div class="col-md-12 col-sm-12">
                                <div class="button-holder">
                                    <div class="button-holder">
                                        <a href="ViewProductLogic?cusID=<%=customer_num%>&recordsPerPage=20&currentPage=1&keyword=&direction=ASC" class="red-btn" style="font-size: 14px;">
                                            Find out more
                                        </a>
                                    </div>
                                </div> <!-- /.button-holder -->
                            </div> <!-- /.col-md-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item-3 -->
            </div> <!-- /.col-md-4 -->

            <div class="col-md-4">
                <div class="product-item-3">
                    <div class="product-thumb">
                        <img src="images/featured/14.jpg" alt="">
                    </div> <!-- /.product-thumb -->
                    <div class="product-content">
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <h5><% out.println("<a>" + staffs.get(67).getProductname() + "</a>"); %></h5>
                                <%out.println("<span class=\"tagline\">" + staffs.get(67).getProductline().getId() + "</span>");%>
                                <%out.println("<span class=\"price\"> $" + staffs.get(67).getMsrp() + "</span>");%>
                            </div> <!-- /.col-md-6 -->
                            <div class="col-md-6 col-sm-6">
                                <div class="full-row">
                                    <label for="cat15">Engine:</label>
                                    <select name="cat15" id="cat15" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">Diesel</option>
                                        <option class="level-0">Electric</option>
                                        <option class="level-0">Hybrid</option>
                                    </select>
                                </div>
                                <div class="full-row">
                                    <label for="cat16">CC:</label>
                                    <select name="cat16" id="cat16" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">1000</option>
                                        <option class="level-0">1500</option>
                                        <option class="level-0">2000</option>
                                        <option class="level-0">2500</option>
                                    </select>
                                </div>
                                <div class="full-row">
                                    <label for="cat17">Color:</label>
                                    <select name="cat17" id="cat17" class="postform">
                                        <option value="-1">- Select -</option>
                                        <option class="level-0">Blue</option>
                                        <option class="level-0">Red</option>
                                        <option class="level-0">Pink</option>
                                        <option class="level-0">Black</option>
                                        <option class="level-0">White</option>
                                    </select>
                                </div>
                            </div> <!-- /.col-md-6 -->
                            <div class="col-md-12 col-sm-12">
                                <div class="button-holder">
                                    <div class="button-holder">
                                        <a href="ViewProductLogic?cusID=<%=customer_num%>&recordsPerPage=20&currentPage=1&keyword=&direction=ASC" class="red-btn" style="font-size: 14px;">
                                            Find out more
                                        </a>
                                    </div>
                                </div> <!-- /.button-holder -->
                            </div> <!-- /.col-md-12 -->
                        </div> <!-- /.row -->
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item-3 -->
            </div> <!-- /.col-md-4 -->
        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.content-section -->

<div class="content-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12 section-title">
                <h2>New Products</h2>
            </div> <!-- /.section -->
        </div> <!-- /.row -->
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="product-item">
                    <div class="product-thumb">
                        <img src="images/featured/15.jpg" alt="">
                    </div> <!-- /.product-thum -->
                    <div class="product-content">
                        <h5><% out.println("<a>" + staffs.get(28).getProductname() + "</a>"); %></h5>
                        <%out.println("<span class=\"price\"> $" + staffs.get(28).getMsrp() + "</span>");%>
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item -->
            </div> <!-- /.col-md-3 -->
            <div class="col-md-3 col-sm-6">
                <div class="product-item">
                    <div class="product-thumb">
                        <img src="images/featured/16.jpg" alt="">
                    </div> <!-- /.product-thum -->
                    <div class="product-content">
                        <h5><% out.println("<a>" + staffs.get(30).getProductname() + "</a>"); %></h5>
                        <%out.println("<span class=\"price\"> $" + staffs.get(30).getMsrp() + "</span>");%>
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item -->
            </div> <!-- /.col-md-3 -->
            <div class="col-md-3 col-sm-6">
                <div class="product-item">
                    <div class="product-thumb">
                        <img src="images/featured/17.jpg" alt="">
                    </div> <!-- /.product-thum -->
                    <div class="product-content">
                        <h5><% out.println("<a>" + staffs.get(45).getProductname() + "</a>"); %></h5>
                        <%out.println("<span class=\"price\"> $" + staffs.get(45).getMsrp() + "</span>");%>
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item -->
            </div> <!-- /.col-md-3 -->
            <div class="col-md-3 col-sm-6">
                <div class="product-item">
                    <div class="product-thumb">
                        <img src="images/featured/18.jpg" alt="">
                    </div> <!-- /.product-thum -->
                    <div class="product-content">
                        <h5><% out.println("<a>" + staffs.get(44).getProductname() + "</a>"); %></h5>
                        <%out.println("<span class=\"price\"> $" + staffs.get(44).getMsrp() + "</span>");%>
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item -->
            </div> <!-- /.col-md-3 -->
        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.content-section -->

<footer class="site-footer">
    <div class="our-partner">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="customNavigation">
                        <a class="btn prev"><i class="fa fa-angle-left"></i></a>
                        <a class="btn next"><i class="fa fa-angle-right"></i></a>
                    </div>
                    <div id="owl-demo" class="owl-carousel">
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-1.jpg" alt=""></a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="images/tm-170x80-2.jpg" alt=""></a>
                        </div>
                    </div> <!-- /#owl-demo -->
                </div> <!-- /.col-md-12 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.our-partner -->
    <div class="main-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="footer-widget">
                        <h3 class="widget-title">About Us</h3>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi, debitis recusandae.
                        <ul class="follow-us">
                            <li><a href="#"><i class="fa fa-facebook"></i>Facebook</a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i>Twitter</a></li>
                        </ul> <!-- /.follow-us -->
                    </div> <!-- /.footer-widget -->
                </div> <!-- /.col-md-3 -->
                <div class="col-md-3">
                    <div class="footer-widget">
                        <h3 class="widget-title">Why Choose Us?</h3>
                        Kool Store is free responsive eCommerce template provided by templatemo website. You can use this layout for any website.
                        <br><br>Tempore cum mollitia eveniet laboriosam corporis voluptas earum voluptate. Lorem ipsum dolor sit amet.
                        <br><br>Credit goes to <a rel="nofollow" href="http://unsplash.com">Unsplash</a> for all images.
                    </div> <!-- /.footer-widget -->
                </div> <!-- /.col-md-3 -->
                <div class="col-md-2">
                    <div class="footer-widget">
                        <h3 class="widget-title">Useful Links</h3>
                        <ul>
                            <li><a href="#">Our Shop</a></li>
                            <li><a href="#">Partners</a></li>
                            <li><a href="#">Gift Cards</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Help</a></li>
                        </ul>
                    </div> <!-- /.footer-widget -->
                </div> <!-- /.col-md-2 -->
                <div class="col-md-4">
                    <div class="footer-widget">
                        <h3 class="widget-title">Our Newsletter</h3>
                        <div class="newsletter">
                            <form action="#" method="get">
                                <p>Sign up for our regular updates to know when new products are released.</p>
                                <input type="text" title="Email" name="email" placeholder="Your Email Here">
                                <input type="submit" class="s-button" value="Submit" name="Submit">
                            </form>
                        </div> <!-- /.newsletter -->
                    </div> <!-- /.footer-widget -->
                </div> <!-- /.col-md-4 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.main-footer -->
    <div class="bottom-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <span>Copyright &copy; 2084 <a href="#">Company Name</a> | Design: <a href="http://www.templatemo.com">templatemo</a></span>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium, expedita soluta mollitia accusamus ut architecto maiores cum fugiat. Pariatur ipsum officiis fuga deleniti alias quia nostrum veritatis enim doloremque eligendi?</p>
                </div> <!-- /.col-md-12 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.bottom-footer -->
</footer> <!-- /.site-footer -->


<script src="js/vendor/jquery-1.10.1.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.1.min.js"><\/script>')</script>
<script src="js/jquery.easing-1.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/plugins.js"></script>
<script src="js/main.js"></script>


</body>
</html>
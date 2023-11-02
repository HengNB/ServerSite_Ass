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
    <style>
        th,td{
            padding:15px;
        }
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
        * {
            box-sizing: border-box;
        }
        /* The popup form - hidden by default */
        /* Popup container */
        .form-popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 3px solid #f1f1f1;
            z-index: 9;
        }

        /* Add styles to the form container */
        .form-container {
            max-height: 900px;
            width: 500px;
            padding: 10px;
            background-color: white;
        }

        .form-container input[type=text]{
            width: 50%;
            padding: 15px;
            margin: 5px 0 22px 0;
            border: 1px solid black;
            border-radius: 15px;
            background: #ffffff;
        }
        /* When the inputs get focus, do something */
        .form-container input[type=text]:focus
        {
            background-color: #ddd;
            outline: none;
        }

        /* Full-width input fields */
        .form-container input[type=date] , .form-container textarea, form.form-container select{
            width: 50%;
            padding: 5px;
            margin-left: 15px;
            border-style: solid;
            border-radius: 10px;
        }

        /* When the inputs get focus, do something */
        .form-container input[type=date].focus, .form-container textarea.focus, form.form-container select.focus
        {
            background-color: #ddd;
            outline: none;
        }

        /* Set a style for the submit button */
        .form-container .btn {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            border: none;
            cursor: pointer;
            width: 32%;
            margin-bottom: 10px;
            opacity: 0.8;
            align-content: center;

        }
        /* Add a red background color to the cancel button */
        .form-container .cancel {
            background-color: red;
        }
        /* Add some hover effects to buttons */
        .form-container .btn:hover, .open-button:hover {
            opacity: 1;
        }
        .pageref {
            text-align: center;
            font-weight: bold;
        }

    </style>

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
    int currentPage = (int) request.getAttribute("currentPage");
    int recordsPerPage = (int) request.getAttribute("recordsPerPage");
    int nOfPages = (int) request.getAttribute("nOfPages");
    String keyword = (String) request.getAttribute("keyword");
    String direction = (String) request.getAttribute("direction");
    int row = (int) request.getAttribute("row");
    String customer_num = (String) request.getAttribute("cusID");
    int no = 0;
    for (int i=0; i<20; i++) {
        out.println("<script>");
        out.println("function addToCart" + i + "() {");
        out.println(" var quantity = document.getElementById(\"quantity" + i + "\").value;");
        out.println(" var addToCartLink = document.getElementById(\"addToCartLink" + i + "\");");
        out.println(" addToCartLink.href += quantity;");
        out.println("}");
        out.println("</script>");
    }
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
        <form class="form-inline md-form mr-auto mb-6" action="ProductDetailLogic" method="get">
            <input class="form-control mr-sm-2" type="text" aria-label="Search" name="keyword" value = "<%=keyword%>"/>
            <select class="form-control" id="direction" name="direction">
                <option value="<%=direction%>">Sorting By</option>
                <option value="ASC">ascending by Quantity In Stock</option>
                <option value="DESC">descending by Quantity In Stock</option>
            </select>
            <button class="btn aqua-gradient btn-rounded btn-sm my-0 btn btn-info" type="submit">Search</button>
            <input type="hidden" name="currentPage" value="<%=currentPage%>" />
            <input type="hidden" name="recordsPerPage" value="<%=recordsPerPage%>" />
            <input type="hidden" name="direction" value="<%=direction%>" />
        </form>

        <div class="row col-md-14">

            <h4>Total Row Found: <%= row %></h4>

            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <th style="width: 10%;">Product Name</th>
                    <th style="width: 10%;">Product Line</th>
                    <th style="width: 10%;">Product Vendor</th>
                    <th style="width: 40%;">Product Description</th>
                    <th style="width: 8%;">Price Each (RM)</th>
                    <th style="width: 10%;">Quantity</th>
                    <th style="width: 10%;">Action</th>
                </tr>
                <%
                    List<Product> staffs = (List<Product>) request.getAttribute("staffs");
                    if (staffs.size() != 0) {
                        for (Product t : staffs) {
                            out.println("<tr>");
                            out.println("<td>" + t.getProductname() + "</td>");
                            out.println("<td>" + t.getProductline().getId() + "</td>");
                            out.println("<td>" + t.getProductvendor() + "</td>");
                            out.println("<td>" + t.getProductdescription() + "</td>");
                            out.println("<td>" + t.getMsrp() + "</td>");
                            out.println("<td><input id=\"quantity" + no + "\" type=\"number\" style=\"width: 200px;\" name=\"quantity\" step=\"1\" value=\"1\" min=\"1\"></td>");
                            out.println("<td><a id=\"addToCartLink" + no +"\" href=\"ProductViewController?cusID=" + customer_num + "&recordsPerPage=" + recordsPerPage + "&currentPage=" + currentPage + "&keyword=" + keyword + "&direction=" + direction +
                                    "&id=" + t.getId() + "&quantity=\" onclick=\"addToCart" + no + "()\">Add to Cart</a></td>");
                            out.println("</tr>");
                            no++;
                        }
                    } else {
                        out.println("<tr>");
                        String status = "No records";
                        for (int i = 0; i < 8; i++) {
                            out.println("<td>" + status + "</td>");
                        }
                        out.println("</tr>");
                    }
                %>
            </table>
            <form action="ProductViewController", method="post" style="text-align: center">
                <input type="hidden" name="cusID" value=<%=customer_num%>>
                <button type="submit" class="btn btn-primary">View Cart</button>
            </form>
        </div>

        <div class="text-center">
            <nav aria-label="Navigation for staffs">
                <ul class="pagination">
                    <% if (currentPage != 1 && nOfPages != 0) { %>
                    <li class="page-item">
                        <% out.println("<a class=\"page-link\" href=\"" + "ViewProductLogic?cusID=" + customer_num + "&recordsPerPage=" + recordsPerPage
                                + "&currentPage=1"+ "&keyword=" + keyword + "&direction=" + direction + "\">First</a>"); %>
                    </li>
                    <li class="page-item">
                        <% out.println("<a class=\"page-link\" href=\"" + "ViewProductLogic?cusID=" + customer_num + "&recordsPerPage=" + recordsPerPage
                                + "&currentPage=" + (currentPage - 1) + "&keyword=" + keyword + "&direction=" + direction + "\">Previous</a>"); %>
                    </li>
                    <% } %>
                    <% if (currentPage < nOfPages) { %>
                    <li class="page-item">
                        <% out.println("<a class=\"page-link\" href=\"" + "ViewProductLogic?cusID=" + customer_num + "&recordsPerPage=" + recordsPerPage
                                + "&currentPage=" + (currentPage + 1)  + "&keyword=" + keyword + "&direction=" + direction + "\">Next</a>"); %>
                    </li>
                    <li class="page-item">
                        <% out.println("<a class=\"page-link\" href=\"" + "ViewProductLogic?cusID=" + customer_num + "&recordsPerPage=" + recordsPerPage
                                + "&currentPage=" + nOfPages + "&keyword=" + keyword + "&direction=" + direction + "\">Last</a>"); %>
                    </li>
                    <% } %>
                </ul>
            </nav>
            <% if (nOfPages != 0) { %>
            <p class="pageref">
                <% out.println(currentPage + " of " + nOfPages); %>
            </p>
            <% } %>
        </div>
    </div>
</div>

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
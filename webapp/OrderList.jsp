<%@ page import="com.utar.assignment.model.entity.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.utar.assignment.model.entity.Customer" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 4/5/2023
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
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


        /* Full-width input fields */
        .form-container input[type=text]{
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            border: none;
            background: #f1f1f1;
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
                            <li><a href="AdminPage.jsp" class="red-btn" style="font-size: 14px;">
                                Home
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
        <form class="form-inline md-form mr-auto mb-6" action="OrderLogic" method="get">
            <input class="form-control mr-sm-2" type="text" aria-label="Search" name="keyword" value = "<%=keyword%>"/>
            <select class="form-control" id="direction" name="direction">
                <option value="<%=direction%>">Sorting By : </option>
                <option value="ASC">ascending by order number</option>
                <option value="DESC">descending by order number</option>
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
                    <th>Order Number</th>
                    <th style="width: 10%;">Order Date</th>
                    <th style="width: 10%;">Require Date</th>
                    <th style="width: 10%;">Shipped Date</th>
                    <th>Status</th>
                    <th style="width: 70%;">Comments</th>
                    <th>Customer Number</th>
                    <th>Update/Delete</th>
                    <th>View Details</th>

                </tr>
                <%
                    List<Order> record = (List<Order>) request.getAttribute("record");
                    if (record.size() != 0) {
                        for (Order o : record) {
                            out.println("<tr>");

                            out.println("<td>" + o.getId()+ "</td>");
                            out.println("<td>" + o.getOrderdate() + "</td>");
                            out.println("<td>" + o.getRequireddate()+ "</td>");
                            out.println("<td>" + o.getShippeddate() + "</td>");
                            out.println("<td>" + o.getStatus()+ "</td>");
                            out.println("<td>" + o.getComments() + "</td>");
                            out.println("<td>" + o.getCustomernumber() + "</td>");
                            out.println("<td><a href=\"OrderController?id=" + o.getId() + "\">Edit</a></td>");
                            out.println("<td><a href=\"OrderDetailLogic?id=" + o.getId()+ "&keyword=&direction=ASC"+"\">View Details</a></td>");
                            out.println("</tr>");
                        }
                    }
                    else {
                        out.println("<tr>");
                        String status = "No records";
                        for (int i = 0; i < 8; i++) {
                            out.println("<td>" + status + "</td>");
                        }
                        out.println("</tr>");
                    }
                %>
            </table>

            <button class="btn aqua-gradient btn-rounded btn-sm my-0 btn btn-success" onclick="showOrderForm()">Add Order</button>
        </div>

        <div class="text-center">
            <nav aria-label="Navigation for staffs">
                <ul class="pagination">
                    <% if (currentPage != 1 && nOfPages != 0) { %>
                    <li class="page-item">
                        <% out.println("<a class=\"page-link\" href=\"" + "OrderLogic?recordsPerPage=" + recordsPerPage
                                + "&currentPage=1"+ "&keyword=" + keyword + "&direction=" + direction + "\">First</a>"); %>
                    </li>
                    <li class="page-item">
                        <% out.println("<a class=\"page-link\" href=\"" + "OrderLogic?recordsPerPage=" + recordsPerPage
                                + "&currentPage=" + (currentPage - 1) + "&keyword=" + keyword + "&direction=" + direction + "\">Previous</a>"); %>
                    </li>
                    <% } %>
                    <% if (currentPage < nOfPages) { %>
                    <li class="page-item">
                        <% out.println("<a class=\"page-link\" href=\"" + "OrderLogic?recordsPerPage=" + recordsPerPage
                                + "&currentPage=" + (currentPage + 1)  + "&keyword=" + keyword + "&direction=" + direction + "\">Next</a>"); %>
                    </li>
                    <li class="page-item">
                        <% out.println("<a class=\"page-link\" href=\"" + "OrderLogic?recordsPerPage=" + recordsPerPage
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

        <div class="form-popup" id="addOrderForm">
            <form onsubmit="return validateForm()" name = "addOrderForm" action="OrderController" class="form-container" method="post">
                <legend>Add Order :</legend>
                <div class="form-group">
                    <%
                        List<Order> orders = (List<Order>) request.getAttribute("allOrderRecord");
                        int largestNumber = 0;
                        for (Order o : orders) {
                            if (o.getId() > largestNumber) {
                                largestNumber = o.getId();
                            }
                        }
                        int nextNumber = largestNumber + 1;
                    %>
                    <label for="orderNumber">Order Number : </label>
                    <input type="text" name="orderNumber" readonly class="form-control-plaintext" id="orderNumber" value="<%= nextNumber %>">
                </div>

                <div class="form-group">
                    <label id="orderDate" for="orderDate">Order Date : </label>
                    <input type="text" name="orderDate" id="orderDateInput" readonly />
<%--                    <label id = "orderDate" for="orderDate">Order Date : </label>
                    <input type="date" name="orderDate" />--%>
                </div>

                <div class="form-group">
                    <label id = "requireDate" for="requireDate">Require Date : </label>
                    <input type="date" name="requireDate" />
                </div>

                <div class="form-group">
                    <label id = "shippedDate" for="shippedDate">Shipped Date : </label>
                    <input type="date" name="shippedDate" />
                </div>

                <div class="form-group">
                    <label for="status">Status :</label>
                    <select name="status" id="status">
                        <option value="In Process">In Process</option>
                        <option value="Shipped">Shipped</option>
                    </select>
                </div>

                <div class="form-group">
                    <label id="comments" for="comments">Comments : </label>
                    <textarea name="comments" rows="4" cols="50"></textarea>
                </div>

                <div class="form-group">
                    <label for="customerNumber">Customer Number : </label>
                    <select name="customerNumber" id="customerNumber" style="width: 200px">
                        out.println("<option value="" selected> Pls select a customer</option>");
                        <% List<Customer> customers = (List<Customer>) request.getAttribute("customer_records");
                            for (Customer customer : customers) {
                                out.println("<option value=\"" + customer.getId() + "\">" + customer.getId() + "</option>");
                            }
                        %>
                    </select>
                </div>

                <button type="submit" class="btn">Add Record</button>
                <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
                <button type="reset" class="btn">Reset</button>
            </form>
        </div>
    </div>
</div>

<script>
    function showOrderForm() {
        document.getElementById("addOrderForm").style.display = "block";
    }
    function closeForm() {
        document.getElementById("addOrderForm").style.display = "none";
    }

    function validateForm() {
        var orderDate = document.forms["addOrderForm"]["orderDate"].value;
        var shippedDate = document.forms["addOrderForm"]["shippedDate"].value;

        if (orderDate && shippedDate && orderDate > shippedDate) {
            alert("Order date cannot be later than shipped date");
            return false;
        }
        return true;
    }

</script>

<script>
    // Get today's date
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    today = yyyy + '-' + mm + '-' + dd;

    // Set the value of the order date input field to today's date
    document.getElementById("orderDateInput").value = today;
</script>

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
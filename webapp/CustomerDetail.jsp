<%@ page import="com.utar.assignment.model.entity.Payment" %>
<%@ page import="java.util.List" %>
<%@ page import="com.utar.assignment.model.entity.Customer" %>
<%@ page import="javax.ejb.EJBException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js lt-ie9 lt-ie8 lt-ie7">
<html class="no-js lt-ie9 lt-ie8">
<html class="no-js lt-ie9">
<html class="no-js">
<head>
    <meta charset="utf-8">
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
    <title>Customer Details</title>
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
        /* Button used to open the contact form - fixed at the bottom of the page */
        .open-button {
            background-color: #555;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            opacity: 0.8;
            position: fixed;
            bottom: 23px;
            right: 28px;
            width: 280px;
        }
        /* The popup form - hidden by default */
        .form-popup {
            overflow-x: hidden;
            overflow-y: auto;
            height: 400px;
            display: none;
            position: fixed;
            top: 60%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }
        /* Add styles to the form container */
        .form-container {
            max-width: 500px;
            padding: 10px;
            background-color: white;
        }
        /* Full-width input fields */
        .form-container input[type=text], .form-container input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            border: none;
            background: #f1f1f1;
        }
        /* When the inputs get focus, do something */
        .form-container input[type=text]:focus, .form-container input[type=password]:focus
        {
            background-color: #ddd;
            outline: none;
        }
        /* Set a style for the submit button */
        .form-container .btn {
            background-color: #4CAF50;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            width: 100%;
            margin-bottom: 10px;
            opacity: 0.8;
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
        table {
            border-collapse: collapse;
            border-spacing: 0;
        }
        td, th {
            padding: 5px;
        }
    </style>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
</head>
<body>

<%
    int currentPage = (int) request.getAttribute("currentPage");
    int recordsPerPage = (int) request.getAttribute("recordsPerPage");
    int nOfPages = (int) request.getAttribute("nOfPages");
    String keyword = (String) request.getAttribute("keyword");
    String direction = (String) request.getAttribute("direction");
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
        <form class="form-inline md-form mr-auto mb-6" action="CustomerDetailLogic" method="get">
            <input class="form-control mr-sm-2" type="text" aria-label="Search"
                   name="keyword" />
            <button class="btn aqua-gradient btn-rounded btn-sm my-0 btn btn-info"
                    type="submit">Search</button>
            <input type="hidden" name="currentPage" value="<%=currentPage%>" />
            <input type="hidden" name="recordsPerPage" value="<%=recordsPerPage%>" />

            <select class="form-control" id="direction" name="direction">
                <option value="ASC">ascending</option>
                <option value="DESC">descending</option>
            </select>
            <button class="btn aqua-gradient btn-rounded btn-sm my-0 btn btn-info" type="submit">Sorting</button>
            <input type="hidden" name="currentPage" value="<%=currentPage%>" />
            <input type="hidden" name="recordsPerPage" value="<%=recordsPerPage%>" />
            <input type="hidden" name="keyword" value="<%=keyword%>" />
        </form>
        <br>
        <div>
            <p><b>*** Scroll right to UPDATE/DELETE</b></p>
        </div>
        <br>
        <div style="overflow-x: scroll;scrollbar-position: top;">
            <table >
                <tr>
                    <th>Customer Number</th>
                    <th>Customer Company Name</th>
                    <th>Contact Last Name</th>
                    <th>Contact First Name</th>
                    <th>Phone</th>
                    <th>Address Line 1</th>
                    <th>Address Line 2</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Postal Code</th>
                    <th>Country</th>
                    <th>SalesRep Employee Number</th>
                    <th>Credit Limit</th>
                </tr>
                <%
                    List<Customer> staffs = (List<Customer>) request.getAttribute("staffs");
                    if (staffs.size() != 0) {
                        for (Customer t : staffs) {
                            out.println("<tr>");
                            out.println("<td>" + t.getId() + "</td>");
                            out.println("<td>" + t.getCustomername() + "</td>");
                            out.println("<td>" + t.getContactfirstname() + "</td>");
                            out.println("<td>" + t.getContactlastname()+ "</td>");
                            out.println("<td>" + t.getPhone() + "</td>");
                            out.println("<td>" + t.getAddressline1() + "</td>");
                            out.println("<td>" + t.getAddressline2() + "</td>");
                            out.println("<td>" + t.getCity() + "</td>");
                            out.println("<td>" + t.getState() + "</td>");
                            out.println("<td>" + t.getPostalcode() + "</td>");
                            out.println("<td>" + t.getCountry() + "</td>");
                            //out.println("<td>" + t.getSalesrepemployeenumber().getId() + "</td>");

                            try {
                                out.println("<td>" + t.getSalesrepemployeenumber().getId() + "</td>");
                            }catch(Exception e){
                                e.printStackTrace();
                                out.println("<td>null</td>");
                            }

                            out.println("<td>" + t.getCreditlimit() + "</td>");
                            out.println("<td><a href=\"CustomerController?id=" + t.getId() + "\">Update</a></td>");
                            out.println("<td><a href=\"CustomerController?id=" + t.getId() + "\">Delete</a></td>");
                            out.println("</tr>");
                        }
                    }
                    else {
                        out.println("<tr>");
                        String status = "No records";
                        for (int i = 0; i < 13; i++) {
                            out.println("<td>" + status + "</td>");
                        }
                        out.println("</tr>");
                    }
                %>
            </table>
        </div>
        <div class="text-center">
            <nav aria-label="Navigation for staffs">
                <ul class="pagination">
                    <%
                        if (currentPage != 1 && nOfPages != 0) {
                    %>
                    <%
                        out.println("<li class=\"page-item\">");
                        out.println("<a class=\"page-link\" href=\"" + "CustomerDetailLogic?recordsPerPage=" + recordsPerPage
                                + "&currentPage=1"+ "&keyword=" + keyword +"&direction=" + direction +"\">First</a>");
                        out.println("</li>");
                    %>
                    <li class="page-item">
                        <%
                            out.println("<a class=\"page-link\" href=\"" + "CustomerDetailLogic?recordsPerPage=" + recordsPerPage
                                    + "&currentPage=" + (currentPage - 1) + "&keyword=" + keyword +"&direction=" + direction + "\">Previous</a>");
                        %>
                    </li>
                    <%
                        }
                    %>
                    <%
                    %>
                    <%
                        if (currentPage < nOfPages) {
                            out.println("<li class=\"page-item\">");
                            out.println("<a class=\"page-link\" href=\"" + "CustomerDetailLogic?recordsPerPage=" + recordsPerPage
                                    + "&currentPage=" + (currentPage + 1)  + "&keyword=" + keyword +"&direction=" + direction + "\">Next</a>");
                            out.println("</li>");
                            out.println("<li class=\"page-item\">");
                            out.println("<a class=\"page-link\" href=\"" + "CustomerDetailLogic?recordsPerPage=" + recordsPerPage
                                    + "&currentPage=" + nOfPages + "&keyword=" + keyword +"&direction=" + direction + "\">Last</a>");
                            out.println("</li>");
                        }
                    %>
                </ul>
            </nav>

            <%
                if (nOfPages != 0) {
                    out.println("<p class=\"pageref\">");
                    out.println(currentPage + " of " + nOfPages);
                    out.println("</p>");
                }
            %>
        </div>
        </div>
        <div>
            <button class="open-button" onclick="openForm()">Open Form</button>
            <div class="form-popup" id="myForm">
                <form action="CustomerController" class="form-container" method="post">
                    <h1>Add Employee</h1>
                    <fieldset>
                        <legend>Add Customer Details:</legend>
                        <br>Customer Number:<input type="number" name="customerNumber" />
                        <br>Customer Name: <input type="text" name="customerName" />
                        <br>Contact Lastname: <input type="text" name="contactLastName" />
                        <br>Contact Firstname: <input type="text"  name="contactFirstName" />
                        <br>Phone Num:<input type="text" name="phone" />
                        <br>Address Line1: <input type="text" name="addressLine1" />
                        <br>Address Line2: <input type="text" name="addressLine2" />
                        <br>City: <input type="text"  name="city" />
                        <br>State:<input type="text" name="state" />
                        <br>Postal Code: <input type="text" name="postalCode" />
                        <br>Country: <input type="text" name="country" />
                        <br>Sales Rep Employee Number: <input type="number" name="salesRepEmployeeNumber" />
                        <br>Credit Limit: <input type="number"  name="creditLimit" />

                    </fieldset>
                    <button type="submit" class="btn">Add Record</button>
                    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
                    <button type="reset" class="btn">Reset</button>
                </form>
            </div>
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


<script>
    function openForm() {
        document.getElementById("myForm").style.display = "block";
    }
    function closeForm() {
        document.getElementById("myForm").style.display = "none";
    }
</script>
</body>
</html>

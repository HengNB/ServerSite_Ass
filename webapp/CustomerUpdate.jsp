<%@ page import="com.utar.assignment.model.entity.Customer" %>
<%@ page import="java.util.List" %>
<%@ page import="com.utar.assignment.model.entity.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Kool Store - Responsive eCommerce Template</title>
</head>
<body>
<%
    Customer customer = (Customer) request.getAttribute("customer_detail");

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
<%--POST THE UPDATE/DELETE--%>
<div class="content-section">
    <div class="container">
        <h2 style="color: black">Update / Delete for CustomerID <%=customer.getId()%>  </h2>
        <h5 style="color: red"> <i>** Delete : Be careful and check the detail before you press the delete button </i></h5>
        <h5 style ="color: #285e8e"> <i>** Update : Data will be updated once you press on the update button</i></h5>
        <hr style="color: black">

        <form action="CustomerController" method="post">
            <table>
                <tr>
                    <td>Customer Number</td>
                    <td>
                        <%
                            out.println("<input type=\"text\" name=\"customerNumber\" readonly value=" + customer.getId());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>Customer Name</td>
                    <td>
                        <%
                            out.println("<input type=\"text\" name=\"customerName\" value=" + customer.getCustomername());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>Contact Lastname</td>
                    <td>
                        <%
                            out.println("<input type=\"text\" name=\"contactLastName\" value=" + customer.getContactlastname());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>Contact Firstname</td>
                    <td>
                        <%
                            out.println("<input type=\"text\" name=\"contactFirstName\" value=" + customer.getContactfirstname());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td>
                        <%
                            out.println("<input type=\"text\" name=\"phone\" value=" + customer.getPhone());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>Address Line 1</td>
                    <td>
                        <%
                            out.println("<input type=\"text\" name=\"addressLine1\" value=" + customer.getAddressline1());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>Address Line 2</td>
                    <td>
                        <%
                            out.println("<input type=\"text\" name=\"addressLine2\" value=" + customer.getAddressline2());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>City Name</td>
                    <td>
                        <%
                            out.println("<input type=\"text\" name=\"city\" value=" + customer.getCity());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>State</td>
                    <td>
                        <%
                            out.println("<input type=\"text\" name=\"state\" value=" + customer.getState());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>Postal Code</td>
                    <td>
                        <%
                            out.println("<input type=\"text\" name=\"postalCode\" value=" + customer.getPostalcode());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>Country</td>
                    <td>
                        <%
                            out.println("<input type=\"text\" name=\"country\" value=" + customer.getCountry());
                        %>
                    </td>
                </tr>
                <tr>
                    <td>Sales rep employee number</td>
                    <td>
                        <select name ="salesRepEmployeeNumber"  style=" width: 200px">
                            <%

                                List<Employee> employeeList = (List<Employee>) request.getAttribute("employee_records");
                                if (customer.getSalesrepemployeenumber()==null)
                                {
                                    out.println("<option value =\"null\">NULL"  + "</option>");

                                }else{

                                    out.println("<option value ="+ customer.getSalesrepemployeenumber().getId() + ">" + customer.getSalesrepemployeenumber().getId()  + "</option>");

                                }

                                for (Employee t : employeeList) {

                                    out.println("<option value =" + t.getId() + ">" + t.getId()  + "</option>");
                                }
                                if  (customer.getSalesrepemployeenumber()!=null){
                                    out.println("<option value =\"null\">NULL"  + "</option>");
                                }

                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Credit Limit</td>
                    <td>
                        <%
                            out.println("<input type=\"text\" name=\"creditLimit\" value=" + customer.getCreditlimit());
                        %>
                    </td>
                </tr>


            </table>

            <%--    Specify Update or Delete--%>
            <input type="submit" name="UPDATE" value="UPDATE" />
            <input type="submit" name="DELETE" value="DELETE" />
        </form>
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

<%@ page import="com.utar.assignment.model.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.utar.assignment.model.entity.Order" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Order Cart</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">


    <script type="text/javascript">
        function changeNum(id, num, totalNum,cusID){
            num = parseInt(num);
            totalNum = parseInt(totalNum);
            console.log(cusID);
            // 判断，如果商品数量小于1
            if(num < 1){
                // 提示用户是否真要从购物车删除该商品
                if(confirm("Are you sure to delete this item？")){
                    num = 0; // 后台处理num=0就直接从购物车删除这个纪录
                }else {
                    num = 1;
                }
            }
            //判断num大于库存情况
            if(num > totalNum) {
                alert("Quantity cannot more than Quantity in stock !!! ")
                num = totalNum;
            }
            location.href="${pageContext.request.contextPath}/ChangeQuantityServlet?id="+ id +"&num="+ num +"&cusID=" + cusID ;
        }
    </script>
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
    List<Order> Orderrecord = (List<Order>) request.getAttribute("allOrderRecord");
    int nextNumber = (Integer) request.getAttribute("nextNumber");
    String cusID = (String) request.getAttribute("cusID");
    System.out.println("Order Cart.jsp : " + cusID);
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
                            <li><a href="HomeLogic?cusID=<%=cusID%>" class="red-btn" style="font-size: 14px;">
                                Home
                            </a></li>
                            <li><a href="ViewProductLogic?cusID=<%=cusID%>&recordsPerPage=20&currentPage=1&keyword=&direction=ASC" class="red-btn" style="font-size: 14px;">
                                Product
                            </a></li>
                            <li><a href="ViewOrderHistoryLogic?cusID=<%=cusID%>"class="red-btn" style="font-size: 14px;">
                                Order History
                            </a></li>
                            <li><a href="ViewPaymentHistoryLogic?cusID=<%=cusID%>"class="red-btn" style="font-size: 14px;">
                                Payment History
                            </a></li>
                        </ul>
                    </div> <!-- /.list-menu -->
                </div> <!-- /.col-md-6 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.main-nav -->
</header> <!-- /.site-header -->

<div class = 'content-section'>
    <div class="container">
        <h1 class="text-center">Order Cart</h1>
        <div class="card mb-3">
            <h2 class="card-title">Your Order :   <%= nextNumber %> </h2>
            <div class="card-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th>No</th>
                        <th>Item Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Quantity Available</th>
                        <th>Total (Rm)</th>
                    </tr>
                    </thead>
                    <tbody>
                        <%
                        Map<Product, Integer> cart = (Map<Product, Integer>) request.getAttribute("product_quantity_list");
                        session.setAttribute("cart", cart);
                        double subtotal = 0.0;

                    %>
                        <% if (cart != null && !cart.isEmpty()) { %>
                        <% int count = 0;
                            for (Map.Entry<Product, Integer> entry : cart.entrySet()) {
                                count++;
                                Product product = entry.getKey();
                                int quantity = entry.getValue();
                                double total = product.getMsrp().doubleValue() * quantity;
                                    subtotal += total;
                        %>
                    <tr>
                        <td><%= count %></td>
                        <td><%= product.getId() %></td>
                        <td><%= product.getMsrp() %></td>
                        <td>
                            <input type="button" value='-' style="width:20px" onclick="changeNum('<%= product.getId() %>','<%= quantity - 1 %>','<%= product.getQuantityinstock() %>', '<%=cusID%>')">
                            <input name="text" type="text" value="<%= quantity %>" style="width:40px;text-align:center" readonly/>
                            <input type="button" value='+' style="width:20px" onclick="changeNum('<%= product.getId() %>','<%= quantity + 1 %>','<%=product.getQuantityinstock() %>', '<%=cusID%>')">
                        </td>
                        <td><%= product.getQuantityinstock()%></td>
                        <td><%= String.format("%.2f", product.getMsrp().doubleValue()*quantity) %></td>
                    </tr>
                        <% } %>
                        <% } else { %>
                    <tr>
                        <td colspan="7" style="text-align: center"><strong>Your cart is empty</strong></td>
                    </tr>
                        <% } %>
                    <tr>
                        <td colspan="5" style="text-align:right;"><strong>Subtotal:</strong></td>
                        <td><%= String.format("%.2f", subtotal) %></td>
                    </tr>

                </table>

                <form action="ProductViewController" method="get" style="text-align: center">
                    <input type ="hidden" name = "recordsPerPage" value="20">
                    <input type ="hidden" name = "currentPage" value="1">
                    <input type="hidden" name="keyword" value=""/>
                    <input type="hidden" name="direction" value="ASC">
                    <input type="hidden" name="id" value="empty">
                    <input type="hidden" name="quantity" value= "0" >
                    <input type="hidden" name="cusID" value="<%=cusID%>">
                    <button type="submit" class="btn btn-primary">Add Product</button>
                </form>

                <br>
                <hr>
                <br>
                <form onsubmit="return validateForm()" action="OrderCartController" method="post" name ="placeOrderForm">
                    <h3>Order Summary : </h3>
                    <input type="hidden" name="addorderdetails" id="addorderdetails" value="yes">
                    <input type="hidden" name="orderNumber" id="orderNumber" value="<%=nextNumber%>">
                    <div class="form-group">
                        <label for="orderDate">Order Date : </label>
                        <input type="text" name="orderDate" id="orderDate" readonly />
                    </div>

                    <div class="form-group">
                        <label  for="requireDate">Require Date : </label>
                        <input type="date" name="requireDate" id = "requireDate"/>
                    </div>

                    <div class="form-group">
                        <input type="hidden" name="shippedDate" value=""/>
                    </div>

                    <div class="form-group">
                        <label for="status">Status :</label>
                        <input type="text" name="status" id="status" value="In Process"/>
                    </div>


                    <div class="form-group">
                        <label id="comments" for="comments">Comments : </label>
                        <textarea name="comments" rows="4" cols="50"></textarea>
                    </div>
                    <input type="hidden" name="customerNumber" id="customerNumber" value="<%=cusID%>"/>
                    <%
                        if (!cart.isEmpty()) {
                            for (Map.Entry<Product, Integer> entry : cart.entrySet()) {
                                Product p = entry.getKey();
                                int quantity = entry.getValue();
                    %>
                    <input type="hidden" name="isEmptyCart" value="isNotempty">
                    <input type="hidden" name="itemList[]" value="<%= p.getId() %>">
                    <input type="hidden" name="quantity[]" value="<%= quantity %>">
                    <%
                        }
                    } else {
                        System.out.println("Is Empty Cart");
                    %>

                    <input type="hidden" name="isEmptyCart" value="empty">
                    <%
                        }
                    %>

                    <input type="hidden" name="paymentDate" id="paymentDate" readonly />
                    <input type="hidden" name="amount" id="amount" value="<%=subtotal%>">

                    <button type="submit" id="placeOrder" class="btn btn-primary" >Place Order</button>
                </form>
            </div>
            <br>
        </div>
    </div>
</div>

<script>
    function validateForm() {
        var orderDate = document.forms["placeOrderForm"]["orderDate"].value;
        var requireDate = document.forms["placeOrderForm"]["requireDate"].value;
        var cartIsEmpty = document.forms["placeOrderForm"]["isEmptyCart"].value;

        if(cartIsEmpty != "empty"){
            if (requireDate === null || requireDate === "") {
                alert("Require date cannot be empty");
                return false;
            } else {
                if (orderDate && requireDate && orderDate > requireDate) {
                    alert("Require date cannot earlier than order date");
                    return false;
                }
                return true;
            }
        }else{
            alert("Cart Cannot Be Empty")
            return false;
        }

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
    document.getElementById("orderDate").value = today;
</script>

<script>
    // Get today's date
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    today =   dd+ '/' + mm + '/' +yyyy;

    // Set the value of the order date input field to today's date
    document.getElementById("paymentDate").value = today;
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
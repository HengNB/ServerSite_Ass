<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

    <title>Admin Page</title>
</head>
<style>
    form{
        padding : 15px;
    }
</style>
<body>
<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->


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
        <h1><%= "Welcome Back Admin" %>
        </h1>
        <br/>
        <h3>Product Module</h3>
        <form action="ProductDetailLogic">
            <input type ="hidden" name = "recordsPerPage" value="20">
            <input type ="hidden" name = "currentPage" value="1">
            <input type="hidden" name="keyword" value=""/>
            <input type="hidden" name="direction" value="ASC">
            <button type="submit" class="btn btn-primary">Product Details</button>
        </form>

        <form action="ProductlineDetailLogic">
            <input type ="hidden" name = "recordsPerPage" value="20">
            <input type ="hidden" name = "currentPage" value="1">
            <input type="hidden" name="keyword" value=""/>
            <button type="submit" class="btn btn-primary">Productline Details</button>
        </form>

        <h3>Order Module</h3>
        <form action="OrderLogic">
            <input type ="hidden" name = "recordsPerPage" value="20">
            <input type ="hidden" name = "currentPage" value="1">
            <input type="hidden" name="keyword" value=""/>
            <input type="hidden" name="direction" value="ASC">
            <button type="submit" class="btn btn-primary">Order</button>
        </form>


        <h3>Payment Module</h3>
        <form action="PaymentDetailLogic">
            <input type ="hidden" name = "recordsPerPage" value="50">
            <input type ="hidden" name = "currentPage" value="1">

            <input type="hidden" name="keyword" value=""/>
            <input type="hidden" name="direction" value="ASC">
            <button type="submit" class="btn btn-primary">Payment Details</button>
        </form>

        <form action="CustomerDetailLogic", method="get">
            <input type ="hidden" name = "recordsPerPage" value="15">
            <input type ="hidden" name = "currentPage" value="1">
            <input type="hidden" name="keyword" value=""/>
            <input type="hidden" name="direction" value="ASC">
            <button type="submit" class="btn btn-primary">Customer Details</button>
        </form>
    </div>
</div>

<footer class="site-footer">
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
</body>
</html>

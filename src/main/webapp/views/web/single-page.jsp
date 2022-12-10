<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Bootstrap News Template - Free HTML Templates</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Bootstrap News Template - Free HTML Templates" name="keywords">
        <meta content="Bootstrap News Template - Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,600&display=swap" rel="stylesheet"> 

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/slick/slick.css" rel="stylesheet">
        <link href="lib/slick/slick-theme.css" rel="stylesheet">

        <!-- Template Stylesheet -->
		<link href="<c:url value='/template/web/css/style.css' />" rel="stylesheet">
    </head>

    <body>
        <!-- Top Bar Start -->
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="tb-contact">
                            <p><i class="fas fa-envelope"></i>info@mail.com</p>
                            <p><i class="fas fa-phone-alt"></i>+012 345 6789</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="tb-menu">
                            <a href="">About</a>
                            <a href="">Privacy</a>
                            <a href="">Terms</a>
                            <a href="">Contact</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Top Bar Start -->
        
        <!-- Brand Start -->
        <div class="brand">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-4">
                        <div class="b-logo">
                            <a href="<c:url value='/home' />">
                                <img src="<c:url value='/template/web/image/logo.png' />" alt="Logo">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Brand End -->

        <!-- Nav Bar Start -->
	    <div class="nav-bar">
	        <div class="container">
	            <nav class="navbar navbar-expand-md bg-dark navbar-dark">
	                <button type="button" class="navbar-toggler" data-toggle="collapse"
	                    data-target="#navbarCollapse">
	                    <span class="navbar-toggler-icon"></span>
	                </button>
	
	                <div class="collapse navbar-collapse justify-content-between"
	                    id="navbarCollapse">
	                    <div class="navbar-nav mr-auto">
	                        <a href="<c:url value='/home' />" class="nav-item nav-link active">Home</a>
	                        <c:if test="${not empty user}">
	                            <a class="nav-item nav-link" href='#'>Wellcome, ${user.getFullName()}</a>
	                            <a class="nav-item nav-link"
	                                href="<c:url value='/logout' />">Thoát</a>
	                        </c:if>
	                        <c:if test="${empty user}">
	                        	<a href="<c:url value='/login' />" class="nav-item nav-link active">Đăng nhập</a>
	                        </c:if> 
	                    </div>
	                    <div class="social ml-auto">
	                        <a href=""><i class="fab fa-twitter"></i></a> <a href=""><i
	                            class="fab fa-facebook-f"></i></a> <a href=""><i
	                            class="fab fa-linkedin-in"></i></a> <a href=""><i
	                            class="fab fa-instagram"></i></a> <a href=""><i
	                            class="fab fa-youtube"></i></a>
	                    </div>
	                </div>
	            </nav>
	        </div>
	    </div>
        <!-- Nav Bar End -->
        
        <!-- Breadcrumb Start -->
        <div class="breadcrumb-wrap">
            <div class="container">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<c:url value='/home' />">Home</a></li>
                    <li class="breadcrumb-item"><a href="">News</a></li>
                    <li class="breadcrumb-item active">News details</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        <!-- Single News Start-->
        <div class="single-news">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="sn-container">
                            <div class="sn-content">
								${news.getContent()}
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="sidebar">
                            <div class="sidebar-widget">
                                <h2 class="sw-title">In This Category</h2>
                                <div class="news-list">
                                	<c:forEach var="news" items="${newsInCategory}">
                                    <div class="nl-item">
                                        <div class="nl-img">
                                            <img src="${news.getThumbnail()}" />
                                        </div>
                                        <div class="nl-title">
                                            <a href="">${news.getTitle()}</a>
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                            
                            <div class="sidebar-widget">
                                <div class="image">
                                    <a href="https://htmlcodex.com"><img src="<c:url value='/template/web/image/ads-2.jpg' />"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Single News End-->        
        
        <!-- Footer Start -->
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h3 class="title">Get in Touch</h3>
                            <div class="contact-info">
                                <p><i class="fa fa-map-marker"></i>123 News Street, NY, USA</p>
                                <p><i class="fa fa-envelope"></i>info@example.com</p>
                                <p><i class="fa fa-phone"></i>+123-456-7890</p>
                                <div class="social">
                                    <a href=""><i class="fab fa-twitter"></i></a>
                                    <a href=""><i class="fab fa-facebook-f"></i></a>
                                    <a href=""><i class="fab fa-linkedin-in"></i></a>
                                    <a href=""><i class="fab fa-instagram"></i></a>
                                    <a href=""><i class="fab fa-youtube"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h3 class="title">Useful Links</h3>
                            <ul>
                                <li><a href="#">Lorem ipsum</a></li>
                                <li><a href="#">Pellentesque</a></li>
                                <li><a href="#">Aenean vulputate</a></li>
                                <li><a href="#">Vestibulum sit amet</a></li>
                                <li><a href="#">Nam dignissim</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h3 class="title">Quick Links</h3>
                            <ul>
                                <li><a href="#">Lorem ipsum</a></li>
                                <li><a href="#">Pellentesque</a></li>
                                <li><a href="#">Aenean vulputate</a></li>
                                <li><a href="#">Vestibulum sit amet</a></li>
                                <li><a href="#">Nam dignissim</a></li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h3 class="title">Newsletter</h3>
                            <div class="newsletter">
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed porta dui. Class aptent taciti sociosqu
                                </p>
                                <form>
                                    <input class="form-control" type="email" placeholder="Your email here">
                                    <button class="btn">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
        
        <!-- Footer Menu Start -->
        <div class="footer-menu">
            <div class="container">
                <div class="f-menu">
                    <a href="">Terms of use</a>
                    <a href="">Privacy policy</a>
                    <a href="">Cookies</a>
                    <a href="">Accessibility help</a>
                    <a href="">Advertise with us</a>
                    <a href="">Contact us</a>
                </div>
            </div>
        </div>
        <!-- Footer Menu End -->

        <!-- Footer Bottom Start -->
        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 copyright">
                        <p>Copyright &copy; <a href="https://htmlcodex.com">HTML Codex</a>. All Rights Reserved</p>
                    </div>

                    <div class="col-md-6 template-by">
                        <p>Template By <a href="https://htmlcodex.com">HTML Codex</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Bottom End -->

        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/slick/slick.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>

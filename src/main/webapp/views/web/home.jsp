<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Trang tin tức</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Bootstrap News Template - Free HTML Templates"
    name="keywords">
<meta content="Bootstrap News Template - Free HTML Templates"
    name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Fonts -->
<link
    href="https://fonts.googleapis.com/css?family=Montserrat:400,600&display=swap"
    rel="stylesheet">

<!-- CSS Libraries -->
<link
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    rel="stylesheet">
<link
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
    rel="stylesheet">
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
                        <p>
                            <i class="fas fa-envelope"></i>info@mail.com
                        </p>
                        <p>
                            <i class="fas fa-phone-alt"></i>+012 345 6789
                        </p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="tb-menu">
                        <a href="">About</a> <a href="">Privacy</a> <a href="">Terms</a> <a
                            href="">Contact</a>
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
                            <c:if test="${user.getRoleid() == 1}">
                            <a class="nav-item nav-link"
                                href="<c:url value='/admin-home' />">Trang quản trị</a>
                        </c:if>
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
    
    <!-- Category News Start-->
    <br>
    <c:if test="${empty categoryId}">
    <div class="cat-news">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <h2>Chủ đề</h2>
                    <div class="col-md-12 mt-1">
                        <a href="<c:url value='/home?categoryId=1' />">Thể Thao</a>
                    </div>
                    <div class="col-md-12 mt-1">
                        <a href="<c:url value='/home?categoryId=2' />">Thế Giới</a>
                    </div>
                    <div class="col-md-12 mt-1">
                        <a href="<c:url value='/home?categoryId=3' />">Chính Trị</a>
                    </div>
                    <div class="col-md-12 mt-1">
                        <a href="<c:url value='/home?categoryId=4' />">Thời Sự</a>
                    </div>
                    <div class="col-md-12 mt-1">
                        <a href="<c:url value='/home?categoryId=5' />">Góc nhìn</a>
                    </div>
                </div>
                <div class="col-md-5">
                    <h2>Thể thao</h2>
                    <c:set var="count" value="0" />
                    <c:forEach var="news" items="${ds}">
                    <c:if test="${news.getCategoryId() == 1 && count < 2 }">
                    <c:set var="count" value="${count + 1}"/>
                    <div class="row cn-slider">
                        <div class="col-md-6">
                            <div class="cn-img">
                                <img src="${news.getThumbnail()}" width="150px" height="120px" />
                                <div class="cn-title">
                                    <a href="<c:url value='/newsPage?id=${news.getId()}' />">${news.getTitle()}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:if>
                    </c:forEach>
                </div>
                <div class="col-md-5">
                    <h2>Thế giới</h2>
                    <c:set var="count" value="0" />
                    <c:forEach var="news" items="${ds}">
                    <c:if test="${news.getCategoryId() == 2 && count < 2 }">
                    <c:set var="count" value="${count + 1}"/>
                    <div class="row cn-slider">
                        <div class="col-md-6">
                            <div class="cn-img">
                                <img src="${news.getThumbnail()}" width="150px" height="120px" />
                                <div class="cn-title">
                                    <a href="<c:url value='/newsPage?id=${news.getId()}' />">${news.getTitle()}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:if>
                    </c:forEach>
                 </div>
             </div>
         </div>
   </div>
    <!-- Category News End-->

    <!-- Category News Start-->
    <div class="cat-news">
        <div class="container">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-5">
                    <h2>Chính trị</h2>
                    <c:set var="count" value="0" />
                    <c:forEach var="news" items="${ds}">
                    <c:if test="${news.getCategoryId() == 3 && count < 2 }">
                    <c:set var="count" value="${count + 1}"/>
                    <div class="row cn-slider">
                        <div class="col-md-6">
                            <div class="cn-img">
                                <img src="${news.getThumbnail()}" width="150px" height="120px" />
                                <div class="cn-title">
                                    <a href="<c:url value='/newsPage?id=${news.getId()}' />">${news.getTitle()}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:if>
                    </c:forEach>
                </div>
                <div class="col-md-5">
                    <h2>Thời sự</h2>
                    <c:set var="myTest" value="1"/>
                    <c:set var="count" value="0" />
                    <c:forEach var="news" items="${ds}">
                    <c:if test="${news.getCategoryId() == 4 && count < 2 }">
                    <c:set var="count" value="${count + 1}"/>
                    <div class="row cn-slider">
                        <div class="col-md-6">
                            <div class="cn-img">
                                <img src="${news.getThumbnail()}" width="150px" height="120px" />
                                <div class="cn-title">
                                    <a href="<c:url value='/newsPage?id=${news.getId()}' />">${news.getTitle()}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    </c:if>
    <!-- Category News End-->
    <c:if test="${not empty categoryId}">
    <div class="cat-news">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <h2>Chủ đề</h2>
                    <div class="col-md-12 mt-1">
                        <a href="<c:url value='/home?categoryId=1' />">Thể Thao</a>
                    </div>
                    <div class="col-md-12 mt-1">
                        <a href="<c:url value='/home?categoryId=2' />">Thế Giới</a>
                    </div>
                    <div class="col-md-12 mt-1">
                        <a href="<c:url value='/home?categoryId=3' />">Chính Trị</a>
                    </div>
                    <div class="col-md-12 mt-1">
                        <a href="<c:url value='/home?categoryId=4' />">Thời Sự</a>
                    </div>
                    <div class="col-md-12 mt-1">
                        <a href="<c:url value='/home?categoryId=5' />">Góc nhìn</a>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="row cn-slider">
                    	<c:forEach var="news" items="${ds}">
                        <div class="col-md-4 mb-4">
                            <div class="cn-img">
                                <img src="${news.getThumbnail()}"/>
                                <div class="cn-title">
                                    <a href="<c:url value='/newsPage?id=${news.getId()}' />">${news.getTitle()}</a>
                                </div>
                            </div>
                        </div>
						</c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:if>
</body>
</html>

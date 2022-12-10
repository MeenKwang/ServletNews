<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>Trang chủ</title>
	<link rel="stylesheet" href="<c:url value='/template/admin/assets/css/bootstrap.min.css' />" />
    <link rel="stylesheet" href="<c:url value='/template/admin/font-awesome/4.5.0/css/font-awesome.min.css' />" />
    <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/ace.min.css' />" class="ace-main-stylesheet" id="main-ace-style" />
    <script src="<c:url value='/template/admin/assets/js/ace-extra.min.js' />"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type='text/javascript' src='<c:url value="/template/admin/js/jquery-2.2.3.min.js" />'></script>
    <script src="<c:url value='/template/admin/assets/js/jquery.2.1.1.min.js' />"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <script src="<c:url value='/ckeditor/ckeditor.js' />"></script>
</head>
<body class="no-skin">
	<!-- header -->
	<div id="navbar" class="navbar navbar-default          ace-save-state">
	    <div class="navbar-container ace-save-state" id="navbar-container">
	        <div class="navbar-header pull-left">
	            <a href='<c:url value="/admin-home"/>' class="navbar-brand">
	                <small>
	                    <i class="fa fa-leaf"></i>
	                    Trang quản trị
	                </small>
	            </a>
	        </div>
	        <div class="navbar-buttons navbar-header pull-right collapse navbar-collapse" role="navigation">
	            <ul class="nav ace-nav">
	            	<li class="light-blue dropdown-modal">
	                    <a href='<c:url value="/home"/>'>
	                        <i class="ace-icon fa fa-home"></i>
	                        Trang tin tức
	                    </a>
	                </li>
	                <li class="light-blue dropdown-modal">
	                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
	                        Xin chào, ${user.getFullName()}
	                    </a>
	                    </li>
	                <li class="light-blue dropdown-modal">
	                    <a href='<c:url value="/logout"/>'>
	                        <i class="ace-icon fa fa-power-off"></i>
	                        Thoát
	                    </a>
	                </li>
	            </ul>
	        </div>
	    </div>
	</div>
    <!-- header -->
	
	<div class="main-container" id="main-container">
		<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		<!-- header -->
		<div id="sidebar" class="sidebar responsive ace-save-state">
		    <script type="text/javascript">
		        try{ace.settings.loadState('sidebar')}catch(e){}
		    </script>
		    <div class="sidebar-shortcuts">
		        <div class="sidebar-shortcuts-large">
		            <button class="btn btn-success">
		                <i class="ace-icon fa fa-signal"></i>
		            </button>
		
		            <button class="btn btn-info">
		                <i class="ace-icon fa fa-pencil"></i>
		            </button>
		
		            <button class="btn btn-warning">
		                <i class="ace-icon fa fa-users"></i>
		            </button>
		
		            <button class="btn btn-danger">
		                <i class="ace-icon fa fa-cogs"></i>
		            </button>
		        </div>
		        <div class="sidebar-shortcuts-mini">
		            <span class="btn btn-success"></span>
		
		            <span class="btn btn-info"></span>
		
		            <span class="btn btn-warning"></span>
		
		            <span class="btn btn-danger"></span>
		        </div>
		    </div>
		    <ul class="nav nav-list">
		        <li >
		            <a href="#" class="dropdown-toggle">
		                <i class="menu-icon fa fa-list"></i>
		                <span class="menu-text"></span>
		                Quản lý trang tin tức
		                <b class="arrow fa fa-angle-down"></b>
		            </a>
		            <b class="arrow"></b>
		            <ul class="submenu">
		                <li>
		                    <a href='<c:url value="/admin-home?type=NewsList"/>'>
		                        <i class="menu-icon fa fa-caret-right"></i>
		                        DS bài viết
		                    </a>
		                    
		                    <b class="arrow"></b>
		                </li>
		             	<li>
		                    <a href='<c:url value="/admin-home?type=userList"/>'>
		                        <i class="menu-icon fa fa-caret-right"></i>
		                        DS người dùng
		                    </a>
		                    
		                    <b class="arrow"></b>
		                </li>
		            </ul>
		        </li>
		    </ul>
		    <div class="sidebar-toggle sidebar-collapse">
		        <i class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
		    </div>
		</div>
    	<!-- header -->
		
		<div class="main-content">
		    <div class="main-content-inner">
		        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
		            <ul class="breadcrumb">
		                <li>
		                    <i class="ace-icon fa fa-home home-icon"></i>
		                    <a href="#">Trang chủ</a>
		                </li>
		            </ul><!-- /.breadcrumb -->
		        </div>
		        <div class="page-content">
		            <div class="row" >
		                <div class="col-xs-12">
								<div class="table-btn-controls">
									<div class="pull-right tableTools-container">
										<div class="dt-buttons btn-overlap btn-group">
										<c:if test="${not empty newsList}">
											<a flag="info"
												  class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												  title='Thêm bài viết' href='<c:url value="/admin-CreateServlet"/>'>
												<span>
													<i class="fa fa-plus-circle bigger-110 purple"></i>
												</span>
											</a>
										</c:if>
										<c:if test="${not empty userList}">
											<a flag="info"
												  class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												  title='Thêm người dùng' href='<c:url value="/admin-CreateUserServlet"/>'>
												<span>
													<i class="fa fa-plus-circle bigger-110 purple"></i>
												</span>
											</a>
										</c:if>
										</div>
									</div>
								</div>
								<!-- new  -->
								<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table class="table table-bordered">
												<thead>
													<tr>
													<c:if test="${not empty newsList}">
														<th>Tên bài viết</th>
														<th>Mô tả ngắn</th>
														<th>Thao tác</th>
													</c:if>
													<c:if test="${not empty userList}">
														<th>Tên người dùng</th>
														<th>Trạng thái</th>
														<th>Vai trò</th>
														<th>Thao tác</th>
													</c:if>
													</tr>
												</thead>
												<tbody>
												<c:if test="${not empty newsList}">
													<c:forEach var="item" items="${newsList}">
														<tr>
															<td>${item.getTitle()}</td>
															<td>${item.getShortDescription()}</td>
															<td>
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật bài viết" href='<c:url value='/admin-EditServlet?id=${item.getId()}' />'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</a>
																<a class="btn btn-sm btn-primary btn-delete" data-toggle="tooltip"
																   title="Xoá bài viết" href='<c:url value='/admin-DeleteServlet?id=${item.getId()}' />'><i class="fa fa-trash-o bigger-110" aria-hidden="true"></i>
																</a>
															</td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${not empty userList}">
													<c:forEach var="userFix" items="${userList}">
														<tr>
															<td>${userFix.getFullName()}</td>
															<td>${userFix.getStatus()}</td>
															<td>${userFix.getRoleid()}</td>
															<td>
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật người dùng" href='<c:url value='/admin-EditUserServlet?id=${userFix.getId()}' />'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</a>
																<a class="btn btn-sm btn-primary btn-delete" data-toggle="tooltip"
																   title="Xoá người dùng" href='<c:url value='/admin-DeleteUserServlet?id=${userFix.getId()}' />'><i class="fa fa-trash-o bigger-110" aria-hidden="true"></i>
																</a>
															</td>
														</tr>
													</c:forEach>
												</c:if>
												</tbody>
											</table>
										</div>
									</div>
								</div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		
		<!-- footer -->
		<div class="footer">
		    <div class="footer-inner">
		        <div class="footer-content">
					<span class="bigger-120">
						<span class="blue bolder">Ace</span>
						Application &copy; 2013-2014
					</span>
		            &nbsp; &nbsp;
		            <span class="action-buttons">
						<a href="#">
							<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
						</a>
		
						<a href="#">
							<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
						</a>
		
						<a href="#">
							<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
						</a>
					</span>
		        </div>
		    </div>
		</div>
    	<!-- footer -->
    	
    	<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse display">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	
	
	<script src="<c:url value='/template/admin/assets/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery-ui.custom.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.ui.touch-punch.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.easypiechart.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.sparkline.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.flot.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.flot.pie.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.flot.resize.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/ace-elements.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/ace.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/bootstrap.min.js'/>"></script>
	
	<!-- page specific plugin scripts -->
	<script src="<c:url value='/template/admin/assets/js/jquery-ui.min.js'/>"></script>
</body>
</html>
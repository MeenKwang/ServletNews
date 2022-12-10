<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Chỉnh sửa bài viết</title>
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
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value="/admin-home?type=NewsList"/>">Trang
							chủ</a></li>
					<li class="active">Chỉnh sửa bài viết</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<form action="<c:url value="/admin-EditServlet2" />" method="post">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right">Thể
									loại</label>
								<div class="col-sm-9">
									<select class="form-control" id="categoryCode"
										name="categoryCode">
											<option value="">Chọn loại bài viết</option>
											<c:forEach var="item" items='${categories}'>
												<c:if test='${item.getId() == news.getCategoryId()}'>
													<option value='${item.getId()}' selected="selected">${item.getName()}</option>
												</c:if>
												<c:if test='${item.getId() != news.getCategoryId()}'>
													<option value='${item.getId()}'>${item.getName()}</option>
												</c:if>
											</c:forEach>
									</select>
								</div>
							</div>
							<br /> <br /> <br />
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right">Tiêu
									đề</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="title" name="title"
										value="${news.getTitle()}" />
								</div>
							</div>
							<br /> <br />
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right">Hình
									đại diện</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="thumbnail"
										name="thumbnail" value="${news.getThumbnail()}" />
								</div>
							</div>
							<br /> <br />
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right">Mô
									tả ngắn</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="shortDescription"
										name="shortDescription" value="${news.getShortDescription()}" />
								</div>
							</div>
							<br /> <br />
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right">Nội
									dung</label>
								<div class="col-sm-9">
									<textarea rows="" cols="" id="content" name="content"
										style="width: 820px; height: 175px">${news.getContent()}</textarea>
								</div>
							</div>
							<br /> <br />
							<div class="form-group">
								<div class="col-sm-12">
									<button type="submit" class="btn btn-white btn-warning btn-bold">Cập nhật bài viết</button>
								</div>
							</div>
							<input type="hidden" value="${news.id}" id="id" name="id" />
							<input type="hidden" value="${user.getFullName()}" id="id" name="user" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var editor = '';
		$(document).ready(function() {
			editor = CKEDITOR.replace('content');
		});
	</script>
</body>
</html>
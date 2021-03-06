<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${article.title}</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	img {
		max-width: 100%;
		height: auto;
		display: block;
	}
	</style>
	
</head>

<body class="gray-bg body-article-detail">
	<div class="wrapper wrapper-content animated fadeInRight">
	 	<div class="ibox float-e-margins">
	 		<div class="ibox-title">
	 			<button type="button" class="btn btn-white btn-article-back btn-sm"><i class="fa fa-chevron-left fa-fw"></i>${title}</button>
	 		</div>
	 		
	 		<div class="ibox-content">
 				<div class="text-center"><h1>${article.title}</h1></div>
 				
 				<div style="padding: 10px 20px; color: #999; text-align: center;">
 					<span style="padding-right: 15px;">来源： ${article.source}</span>
 					<span>时间：<fmt:formatDate value="${article.updateTime}" pattern="yyyy-MM-dd"/></span>
 				</div>
 				
 				<c:if test="${not empty article.imagePath}">
	 				<div>
	 					<img src="${ctx}${article.imagePath}" style="max-width: 100%;">
	 				</div>
 				</c:if>
 				
 				<div style="padding: 20px; word-break: break-all;">${article.content}</div>
	 		</div>
	 	</div>
	
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript">
	
		var $page = $('.body-article-detail');
		
		$page.on('click', '.btn-article-back', function() {
			window.history.back();
		});
		
	</script>
</body>

</html>
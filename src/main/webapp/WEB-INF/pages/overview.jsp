<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>网站概况</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">

</head>

<body class="gray-bg body-overview">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>网站分析</h5>
					</div>
					
					<div class="ibox-content">
						<div class="row">
							<div class="col-sm-6">
								<table class="table-hm table text-center" data-mobile-responsive="true">
									<thead>
										<tr>
											<td>类别</td>
											<td>数量</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="articleCount" items="${articleCountList}">
											<tr>
												<td>${articleCount.title}</td>
												<td>${articleCount.count}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							
							<div class="col-sm-6">
								<div class="chart-article-count"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/echarts/echarts-all.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-overview');
		
		// 网站分析
		var articleChart = echarts.init($page.find('.chart-article-count')[0]);
		
		
	})( jQuery );
	</script>

</body>
</html>
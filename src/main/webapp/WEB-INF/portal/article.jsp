<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet" href="css/index.css" type="text/css"/>
<link rel="stylesheet" href="css/article.css" type="text/css"/>

<title></title>

<script type="text/javascript">
</script>
</head>
<body>
	
	<div id="home">
		<%@ include file="/WEB-INF/template/top.jsp"%>
		
		<div id="toplinecontainer">
			<div id="position">
				<p>
					<span>当前位置：<a href="./">首页</a>
						<em>&gt;</em>
						<a href="" class="weizhi"></a>
					</span>
				</p>
			</div>
			<div id="topline">
				<div class="tophead">
					<h1 style="word-break: break-all;">
						{{=it.data.title}}
					</h1>
					<div class="authortime">
						<span class="author">来源：</span>
						<span>{{=it.data.source}}</span>
						<span class="author">时间：</span>
						<span>{{=(new Date(it.data.createTime)).format("yyyy-MM-dd")}}</span>
					</div>
				</div>
				<div class="toplinecon">
					<div class="toplinetxt">
						<div>{{=it.data.content}}</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/template/footer.jsp"%>
	</div>
</body>

<script>
;(function() {
	
	$home = $("#home");
	
	$home.find("footer").html($(".template.Footer").doT());
	var type = getParam("type");
	var articleId = getParam("id");
	$home.find(".weizhi").html(getTypeStr(type)).attr("href", "column?type="+type);
	
})();
</script>
</html>
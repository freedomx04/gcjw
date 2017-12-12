<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
<link rel="stylesheet" href="${ctx}/local/index.css" type="text/css"/>

<title>${article.title}</title>

<style>
* {
    font-family: "Microsoft Yahei","宋体";
}
#toplinecontainer {
    margin: 0 auto;
    background-color: #ebeaea;
    display: block;
    padding-bottom: 10px;
}
#page img {
	max-width: 100%;
}
#position {
    display: block;
    width: 980px;
    height: 40px;
    background-color: #fff;
    margin: 0 auto 10px;
    white-space: nowrap;
}
#position p {
    margin: 0 10px;
}
#position p a {
	display: inline;
}
#position span {
    font-size: 14px;
    color: #202020;
    height: 40px;
    line-height: 40px;
}
#topline {
    width: 980px;
    margin: 0 auto;
    background-color: #fff;
}
.tophead {
    width: 980px;
    border-bottom: 1px dashed rgb(221, 221, 221);
}
.tophead h2 {
    color: #15537f;
    text-align: center;
    padding: 15px;
}
.authortime {
    display: block;
    width: 980px;
    height: 36px;
    line-height: 36px;
    text-align: center;
}
.authortime span {
    color: #202020;
    font-size: 14px;
}
.author {
    margin-left: 20px;
}
.toplinecon {
    width: 980px;
    height: 100%;
    padding-top: 23px;
}
.toplinetxt {
    width: 850px;
    padding: 0 65px 50px 65px;
    height: 100%;
    word-break: break-all;
    line-height: 1.4;
    font-size: 14px;
}

</style>
</head>

<body>
	<div id="page">
		<%@ include file="/WEB-INF/template/top.jsp"%>
		
		<div id="toplinecontainer">
			<div id="position">
				<p>
					<span>
						当前位置：<a href="${ctx}">首页</a>&nbsp;&gt;&nbsp;
						<a href="${ctx}/column?type=${article.type}" class="weizhi">${articleTitle}</a>&nbsp;&gt;&nbsp;
						正文
					</span>
				</p>
			</div>
			<div id="topline">
				<div class="tophead">
					<h2 style="word-break: break-all;">
						${article.title}
					</h2>
					<div class="authortime">
						<span class="author">来源：</span>
						<span>${article.source}</span>
						<span class="author">时间：</span>
						<span><fmt:formatDate value="${article.updateTime}" pattern="yyyy-MM-dd"/></span>
					</div>
				</div>
				<div class="toplinecon">
					<div class="toplinetxt">
						<div>${article.content}</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/template/footer.jsp"%>
	</div>
</body>
</html>
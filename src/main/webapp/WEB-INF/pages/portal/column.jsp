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
<script type="text/javascript" src="${ctx}/plugins/paging/paging.js"></script>
<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
<script type="text/javascript" src="${ctx}/local/common.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/paging/paging.css">
<link rel="stylesheet" href="${ctx}/local/index.css" type="text/css"/>

<title></title>

<style>
body {
	font-size: 13px;
}
a{
	display: inline-block;
}
.red a{
	color:#000;
	}
.red a:hover{
	color:#F00;
	}
.title a{
 font-size:24px; 
}

.bottom a{
color:#000000;
}
.top a{
color:#FFFFFF;
}
.left-nav-td {
	border-bottom: 1px solid #D8D8D8;
	background: #F8F8F8; 
	padding: 0 10px 0 10px;
}
.left-nav-td a {
	position: relative;
	top:5px; font-size:14px; 
	font-weight: bold; 
	color: #004279;
}
.right-title {
	font-size: 18px; 
	border-bottom: 3px #941D23 solid;
}
</style>

</head>
<body>
	<div id="page">
		<%@ include file="/WEB-INF/template/top.jsp"%>
		
		<table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr>
			<td align="center" valign="top">
				<table width="974" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
					<tbody>
					<tr><td colspan="3" height="6" bgcolor="#EBEAEA"></td></tr>
	                <tr>
						<td colspan="3" height="40" align="left" style="padding-left:5px;" bgcolor="#FFFFFF">当前位置：
							<a href="${ctx}">首页</a>&nbsp;&gt;&nbsp;
							<a class="weizhi-dynamic" style="display: none;" href="ptype=dynamic&type=8">工作动态</a>
							<span class="weizhi-dynamic" style="display: none;" >&nbsp;&gt;&nbsp;</span>
							
							<a href="column?type=${type}">${articleTitle}</a>
							
							<span class="weizhi-topic" style="display: none;" >&nbsp;&gt;&nbsp;</span>
							<a class="weizhi-topic articleTitle" style="display: none;" href="column?type=7"></a>
						</td>
					</tr>                
	                <tr><td colspan="3" height="6" bgcolor="#EBEAEA"></td></tr>
					<tr>
						<td width="292" valign="top" bgcolor="#FFFFFF">
							<table width="100%" cellpadding="0" cellspacing="0">
								<tbody class="article"> 
									<c:forEach var="articleTitle" items="通知公告, 图片新闻" varStatus="status">
									<tr>
										<td class="left-nav-td" width="10%" align="center" valign="middle" height="32"> 
											<img src="${ctx}/img/jian.png" border="0" align="absmiddle" style="padding-top:12px">
										</td>
										<td class="left-nav-td" align="left">
											<a href="column?type=${status.index}">${articleTitle}</a>
										</td>
									</tr>
									</c:forEach>
									<c:forEach var="articleTitle" items="廉情在线, 曝光台, 党纪法规, 莲廉文化, 专题集锦" varStatus="status">
									<tr>
										<td class="left-nav-td" width="10%" align="center" valign="middle" height="32"> 
											<img src="${ctx}/img/jian.png" border="0" align="absmiddle" style="padding-top:12px">
										</td>
										<td class="left-nav-td" align="left">
											<a href="column?type=${status.index + 3}">${articleTitle}</a>
										</td>
									</tr>
									</c:forEach>
									<tr>
										<td class="left-nav-td" width="10%" align="center" valign="middle" height="32"> 
											<img src="${ctx}/img/jian.png" border="0" align="absmiddle" style="padding-top:12px">
										</td>
										<td class="left-nav-td" align="left">
											<a href="column?ptype=dynamic&type=8">工作动态</a>
										</td>
									</tr>
								</tbody>
								
								<tbody class="dynamic" style="display: none;">
									<c:forEach var="articleTitle" items="党风政风, 纪律审查, 巡查工作, 宣传工作, 队伍建设" varStatus="status">
									<tr>
										<td class="left-nav-td" width="10%" align="center" valign="middle" height="32"> 
											<img src="${ctx}/img/jian.png" border="0" align="absmiddle" style="padding-top:12px">
										</td>
										<td class="left-nav-td" align="left">
											<a href="column?ptype=dynamic&type=${status.index + 8}">${articleTitle}</a>
										</td>
									</tr>
									</c:forEach>
								</tbody>
								
								<tbody class="topic" style="display: none;">
									<c:forEach var="topicnews" items="${topicList}">
									<tr>
										<td class="left-nav-td" width="10%" align="center" valign="middle" height="32"> 
											<img src="${ctx}/img/jian.png" border="0" align="absmiddle" style="padding-top:12px">
										</td>
										<td class="left-nav-td" align="left">
											<a href="column?type=7&topicId=${topicnews.id}">${topicnews.title}</a>
										</td>
									</tr>
									</c:forEach>
								</tbody>
								
							</table>				
						</td>
						<td width="5" bgcolor="#EBEAEA"></td>
						
						<td width="669" valign="top" bgcolor="#FFFFFF">
						    <table width="100%"><tbody><tr>
	                            <td class="articleTitle right-title" height="36" align="left" oldid="3395" related="1">${articleTitle}</td>
	                        </tr></tbody></table>
	                        <table width="100%"><tbody>
								<tr>
	                            	<td class="red articleList">
	                                </td>
	                            </tr>                            
	                            <tr>
	                            	<td align="center">
										<div id="pageTool" style="padding: 10px 0;"></div>
									</td>
	                            </tr>
	                        </tbody></table>
	                    </td>
					</tr>
	             </tbody></table>	
	        </td>
		</tr></tbody></table>
		
		<%@ include file="/WEB-INF/template/footer.jsp"%>
	</div>
</body>

<script>
var pageSize = 10;
var $page = $("#page");
;(function() {
	var type = Url.queryString("type");
	var ptype = Url.queryString("ptype");
	
	if (ptype == 'dynamic') {
		$page.find(".dynamic").css("display", "block");
		$page.find(".article").css("display", "none");
		$page.find(".weizhi-dynamic").show();
	}
	if (type == '7') {
		$page.find(".dynamic").css("display", "none");
		$page.find(".article").css("display", "none");
		$page.find(".topic").css("display", "block");
		$page.find(".weizhi-topic").show();
	}
	getData(type, 0, pageSize);
	$page.find('#pageTool').Paging({
		pagesize: pageSize, 
		count: '${count}', 
		callback: function(page, size, count) {
			getData(type, page-1, size);
		}
	});
	
})();
function getData(type, page, size) {
	$page.find(".articleList").html("");
	var topicId = Url.queryString("topicId");
	var url = "${ctx}/api/article/listPaging";
	var data = {
		type: type,
		page: parseInt(page),
		size: pageSize
	};
	
	if (type == '7' && topicId != "") {
		url = "${ctx}/api/article/listByTopicIdPaging";
		data = {
			topicId: topicId,
			page: parseInt(page),
			size: pageSize
		};
		
		$.ajax({
			url: "${ctx}/api/topic/get",
			type: "POST",
			data: {topicId: topicId},
			success: function(ret) {
				$page.find(".articleTitle").text(ret.data.title);
			},
			error: function(err) {}
		});
	}
	
	$.ajax({
		url: url,
		type: "POST",
		data: data,
		success: function(ret) {
			console.info(ret)
			if(ret.code == 0) {
				$.each(ret.data.content, function(key, article) {
					var title = article.title.length > 30 ? article.title.substring(0, 30) + "..." : article.title;
					var content = article.content || "";
					content = content.length > 120 ? content.substring(0, 120) + "..." : content;
					
					$('<table width="100%"><tbody>'
						+ '<tr><td height="15"></td></tr>'
						+ '<tr>'
						+ '<td width="85%" align="left" style="font-family:黑体;color:#555656" class="title">'
						+ '<a href="article/'+ article.path +'?type='+ type +'" target="_blank">'+ title +'</a></td>'
						+ '<td width="15%">'+ formatDate(article.updateTime) +'</td></tr>'
						+ '<tr>'
						+ '<td colspan="2" align="left" style="color:#BCBCA7;word-break: break-all;">'+ content +'</td>'
						+ '</tr>'
                        + '<tr><td height="10" style="border-bottom:1px solid gray;" colspan="2"></td></tr>'
						+ '</tbody></table>')
					.appendTo($page.find(".articleList"));
				});
			}
		},
		error: function(e) {}
	});
}
</script>
</html>
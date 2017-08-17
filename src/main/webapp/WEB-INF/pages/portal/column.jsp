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
.manu {
    PADDING-RIGHT: 3px;
    PADDING-LEFT: 3px;
    PADDING-BOTTOM: 3px;
    MARGIN: 3px;
    PADDING-TOP: 3px;
    TEXT-ALIGN: center;
	
}
.manu A {
    BORDER-RIGHT: #eee 1px solid;
    PADDING-RIGHT: 5px;
    BORDER-TOP: #eee 1px solid;
    PADDING-LEFT: 5px;
    PADDING-BOTTOM: 2px;
    MARGIN: 2px;
    BORDER-LEFT: #eee 1px solid;
    COLOR: #036cb4;
    PADDING-TOP: 2px;
    BORDER-BOTTOM: #eee 1px solid;
    TEXT-DECORATION: none;
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
							<a href="http://www.fzlz.gov.cn">首页</a>&nbsp;&gt;&nbsp;<a href="http://www.fzlz.gov.cn/list-9-1.html"></a>
							<a href="http://www.fzlz.gov.cn/list-9-1.html">${articleTitle}</a> &gt; 
						</td>
					</tr>                
	                <tr><td colspan="3" height="6" bgcolor="#EBEAEA"></td></tr>
					<tr>
						<td width="292" valign="top" bgcolor="#FFFFFF">
								<table width="100%" cellpadding="0" cellspacing="0">
								<tbody> 
									<tr>
										<td width="10%" align="center" valign="middle" height="32" style="border-bottom:1px solid #D8D8D8;background:#F8F8F8; padding:0 10px 0 10px;"> 
											<img src="${ctx}/img/jian.png" border="0" align="absmiddle" style="padding-top:12px">
										</td>
										<td style="border-bottom:1px solid #D8D8D8;background:#F8F8F8; padding:0 10px 0 10px;" align="left">
											<a href="column?type=1" style="position:relative;top:5px; font-size:14px; font-weight:bold; color:#004279">图片新闻</a>
										</td>
									</tr>
									<c:forEach var="articleTitle" items="廉情在线, 曝光台, 党纪法规, 莲廉文化" varStatus="status">
									<tr>
										<td width="10%" align="center" valign="middle" height="32" style="border-bottom:1px solid #D8D8D8;background:#F8F8F8; padding:0 10px 0 10px;"> 
											<img src="${ctx}/img/jian.png" border="0" align="absmiddle" style="padding-top:12px">
										</td>
										<td style="border-bottom:1px solid #D8D8D8;background:#F8F8F8; padding:0 10px 0 10px;" align="left">
											<a href="column?type=${status.index + 2}" style="position:relative;top:5px; font-size:14px; font-weight:bold; color:#004279">${articleTitle}</a>
										</td>
									</tr>
									</c:forEach>
									<tr>
										<td width="10%" align="center" valign="middle" height="32" style="border-bottom:1px solid #D8D8D8;background:#F8F8F8; padding:0 10px 0 10px;"> 
											<img src="${ctx}/img/jian.png" border="0" align="absmiddle" style="padding-top:12px">
										</td>
										<td style="border-bottom:1px solid #D8D8D8;background:#F8F8F8; padding:0 10px 0 10px;" align="left">
											<a href="column?type=0" style="position:relative;top:5px; font-size:14px; font-weight:bold; color:#004279">工作动态</a>
										</td>
									</tr>
								</tbody></table>				
						</td>
						<td width="5" bgcolor="#EBEAEA"></td>
						
						<td width="669" valign="top" bgcolor="#FFFFFF">
						    <table width="100%"><tbody><tr>
	                            <td height="36" style="font-size:18px; border-bottom:3px #941D23 solid;" align="left" oldid="3395" related="1">${articleTitle}</td>
	                        </tr></tbody></table>
	                        <table width="100%"><tbody>
								<tr>
	                            	<td class="red articleList">
										
	                                </td>
	                            </tr>                            
	                            <tr>
	                            	<td align="center">
										<div id="pageTool"></div>
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
	if (type == 0) {
		$page.find(".dynamic").css("display", "block");
		$page.find(".article").css("display", "none");
	} else {
		getData(type, 0, pageSize);
		
		$page.find('#pageTool').Paging({
			pagesize: pageSize, 
			count: '${count}', 
			callback: function(page, size, count) {
				getData(type, page-1, size);
			}
		});
	}
	
})();
function getData(type, page, size) {
	$.ajax({
		url: "${ctx}/api/article/listPaging",
		type: "POST",
		data: {
			type: type,
			page: parseInt(page),
			size: pageSize
		},
		success: function(ret) {
			if(ret.code == 0) {
				console.info(ret)
				$.each(ret.data.content, function(key, article) {
					var title = article.title.length > 20 ? article.title.substring(0, 20) + "..." : article.title;
					var content = article.content || "";
					content = content.length > 60 ? content.substring(0, 60) + "..." : content;
					
					$('<table width="100%"><tbody>'
						+ '<tr><td height="15"></td></tr>'
						+ '<tr>'
						+ '<td width="85%" align="left" style="font-family:黑体;color:#555656" class="title">'
						+ '<a href="article/'+ article.path +'?type='+ type +'" target="_blank">'+ title +'</a></td>'
						+ '<td width="15%">'+ formatDate(article.updateTime) +'</td></tr>'
						+ '<tr>'
						+ '<td colspan="2" align="left" style="color:#BCBCA7;">'+ content +'</td>'
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
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

<title>广昌县纪委监察局</title>

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
				<table width="974" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="min-height: 600px;">
					<tbody>
					<tr><td colspan="3" height="6" bgcolor="#EBEAEA"></td></tr>
	                <tr>
						<td colspan="3" height="40" align="left" style="padding-left:5px;" bgcolor="#FFFFFF">当前位置：
							<a href="${ctx}">首页</a>&nbsp;&gt;&nbsp;
							<a href="javascript: void(0);">搜索结果</a>
						</td>
					</tr>                
	                <tr><td colspan="3" height="6" bgcolor="#EBEAEA"></td></tr>
					<tr>
						<td width="669" valign="top" bgcolor="#FFFFFF">
						    <table width="100%"><tbody><tr>
	                            <td class="articleTitle right-title" align="left" oldid="3395" related="1">${articleTitle}</td>
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

<script type="text/javascript">
	var pageSize = 2;
	var $page = $("#page");
	
	;(function() {
		var init = true;
		getData(init, 0, pageSize);
	})();
	
	function getData(init, page, size) {
		var input = Url.queryString("input");
		$page.find(".articleList").html("");
		
		$.ajax({
			url: "${ctx}/api/article/search",
			type: "POST",
			data: {
				input: input,
				page: parseInt(page),
				size: pageSize
			},
			success: function(ret) {
				if(ret.code == 0) {
					if (init) {
						$page.find('#pageTool').Paging({
							pagesize: pageSize, 
							count: ret.data.totalElements, 
							callback: function(page, size, count) {
								getData(false, page-1, size);
							}
						});
					}
					
					$.each(ret.data.content, function(key, article) {
						var title = article.title.length > 20 ? article.title.substring(0, 20) + "..." : article.title;
						var content = article.content || "";
						content = content.length > 120 ? content.substring(0, 120) + "..." : content;
						
						$('<table width="100%"><tbody>'
							+ '<tr><td height="15"></td></tr>'
							+ '<tr>'
							+ '<td width="85%" align="left" style="font-family:黑体;color:#555656; padding-left: 15px;" class="title">'
							+ '<a href="article/'+ article.path +'?type='+ article.type +'" target="_blank">'+ title +'</a></td>'
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
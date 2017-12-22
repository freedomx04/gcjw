<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	
	<title>${articleTitle}-广昌县纪委监察局</title>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/paging/paging.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/paging/paging.css">
	<link rel="stylesheet" href="${ctx}/local/index.css" type="text/css"/>
	
	<style>
	body {
		font-size: 13px;
	}
	a {
		display: inline-block;
	}
	.red a {
		color:#000;
	}
	.red a:hover {
		color:#F00;
	}
	.title a {
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
	.imgnew {
		float: left;
		display: block;
		width: 30%;
		margin-left: 23px;
		margin-top: 10px;
	}
	.imgnew a {
		color: #000;
		margin: 7px;
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
	                <tr><td colspan="3" height="6" bgcolor="#EBEAEA"></td></tr>
					<tr>
						<td width="5" bgcolor="#EBEAEA"></td>
						<td width="766" valign="top" bgcolor="#FFFFFF">
						    <table width="100%">
						    	<tbody>
						    		<tr>
	                            		<td class="articleTitle right-title" height="36" align="left" oldid="3395" related="1">${articleTitle}</td>
	                        		</tr>
	                        	</tbody>
	                        </table>
	                        <table width="98%"><tbody>
								<tr>
	                            	<td class="red articleList" height="192" align="center">
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

	var pageSize = 12;
	var $page = $("#page");
	
	;(function() {
		
		var type = Url.queryString("type");
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
		var url = "${ctx}/api/article/listPaging";
		var data = {
			type: type,
			page: parseInt(page),
			size: pageSize
		};
		
		$.ajax({
			url: url,
			type: "POST",
			data: data,
			success: function(ret) {
				if(ret.code == 0) {
					$.each(ret.data.content, function(key, article) {
						var title = article.title.length > 12 ? article.title.substring(0, 12) + "..." : article.title;
						
						$('<li class="imgnew">'
							+ '<table width="212" height="168" border="0" cellpadding="0" cellspacing="0">'
							+ '<tbody><tr><td width="212" height="138" align="center">'
							+ '<img src="${ctx}' + article.imagePath + '" width="210" height="150" style="border: #cccccc solid 1px;">'
							+ '<a href="${ctx}/article/' + article.id + '" target="_blank">' + title + '</a>'
							+ '</td></tr></tbody></li>')
						.appendTo($page.find(".articleList"));
					});
				}
			},
			error: function(e) {}
		});
	}
	
</script>
</html>
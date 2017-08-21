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

<title>广昌县纪委监察部举报网站</title>
<style>
body {
	background-image: url(${ctx}/img/report/bg.gif);
    background-repeat: repeat;
    padding: 0px 0px 0px 0px;
    margin: 0px 0px 0px 0px;
}
</style>
</head>

<body>
	<div style="border: 1px solid #FFFF00; background-color: #FFFFFF; height: 100%; width: 1000px; margin: 0px auto 0px auto; top: 0px; bottom: 0px;">
		<%@ include file="/WEB-INF/pages/portal/report/top.jsp"%>
	   
		<div style="width: 600px; margin-right: auto; margin-left: auto">
			<div name="FPContext" id="FPContext" style="overflow: auto;height:350px;">
				<p align="center">
					<a href="javascript: void(0);" target="_blank"></a>&nbsp;
				</p>
				<table border="0" cellspacing="0" cellpadding="0" width="94%">
					<tbody>
						<tr><td height="50" width="707" align="center">
						<div style="font-size: 20px; font-weight: bold;" align="center">抚州市纪委信访室（市监察局举报中心）职能介绍</div></td>
						</tr>
						<tr><td style="line-height: 30px; font-size: 14px;" valign="top">&nbsp;&nbsp;&nbsp; 负责处理群众来信，接待群众来访，接听举报电话，从互联网上收集群众举报；提供信访信息，筛选案件线索；督促、催办、审核转请下级纪检监察机关承办的检举、控告、申诉案件和其他重要信访问题；直接查办一些急待查明、易查易结以及打击报复举报人的案件；对委局领导批办的反映领导干部违纪的问题实施信访监督；对信访工作及信访反映的突出问题进行调查研究，对系统的信访举报工作进行业务指导；承办领导交办的其他事项。
						</td></tr>
					</tbody>
				</table>
				<p align="center">&nbsp;</p>
			</div>
			<div style="width: 160px; margin-right: auto; margin-left: auto; margin-bottom: 20px;">
				<a href="../ForeJBXZ/Index" style="margin-right: auto; margin-left: auto"><img height="43px" src="${ctx}/img/report/02pic.gif" width="160px" border="0"></a>
			</div>
		</div>
	
		<%@ include file="/WEB-INF/pages/portal/report/footer.jsp"%>
		
    </div>
</body>

<script>
;(function() {
	
})();
</script>
</html>
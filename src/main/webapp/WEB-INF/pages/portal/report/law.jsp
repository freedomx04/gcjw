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
	   
	    <div style="width: 800px; margin-right: auto; margin-left: auto">
			<table cellspacing="0" cellpadding="0" width="770px" align="center" border="0">
		    	<tbody><tr> 
					<td valign="top" align="middle"> 
						<table cellspacing="0" cellpadding="0" width="550px" border="0">
							<tbody> 
								<tr> 
								  <td align="middle" width="46px" height="45px">
								  	<img height="20px" src="${ctx}/img/report/flag4.gif" width="20px"></td>
								  <td class="title" width="604px" align="left" style="font-size: large"><strong>相关法律法规：</strong></td>
								</tr>
							</tbody> 
				        </table>
						<table cellspacing="0" cellpadding="0" width="550px" border="0" style="line-height: 10px;">
							<tbody> 
								<tr> 
									<td height="150px" valign="top">
										<table width="95%" border="0" cellpadding="3" cellspacing="0" align="center">
					                   		<tbody>
						                   		<tr>
													<td width="3%" valign="top" height="20px"><img height="14px" src="${ctx}/img/report/flag2.gif" width="16px" align="middle" border="0"></td>
													<td align="left" style="font-size: small"><a href="${ctx}/report/letter" target="_blank">举报信主要样式</a></td>
												</tr>
								                   
						                       	<tr>
													<td width="3%" valign="top" height="20px"><img height="14px" src="${ctx}/img/report/flag2.gif" width="16px" align="middle" border="0"></td>
													<td align="left" style="font-size: small"><a href="${ctx}/report/regulation_1" target="_blank">中国共产党纪律处分条例</a></td>
												</tr>
								                   
						                       	<tr>
													<td width="3%" valign="top" height="20px"><img height="14px" src="${ctx}/img/report/flag2.gif" width="16px" align="middle" border="0"></td>
													<td align="left" style="font-size: small"><a href="${ctx}/report/regulation_2" target="_blank">中国共产党纪律检查机关控告申诉工作条例</a></td>
												</tr>
								                   
						                       	<tr>
													<td width="3%" valign="top" height="20px"><img height="14px" src="${ctx}/img/report/flag2.gif" width="16px" align="middle" border="0"></td>
													<td align="left" style="font-size: small"><a href="${ctx}/report/regulation_3" target="_blank">中纪委监察部关于保护检举、控告人的规定</a></td>
												</tr>
						                       	<tr>
													<td width="3%" valign="top" height="20px"><img height="14px" src="${ctx}/img/report/flag2.gif" width="16px" align="middle" border="0"></td>
													<td align="left" style="font-size: small"><a href="${ctx}/report/regulation_4" target="_blank">中华人民共和国行政监察法实施条例</a></td>
												</tr>
											</tbody>
										</table>
						            </td>
								</tr>
							</tbody> 
						</table>
					</td>
				</tr>
				</tbody>
			</table>
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
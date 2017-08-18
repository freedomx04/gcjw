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
<link rel="stylesheet" href="${ctx}/local/report.css" type="text/css"/>

<title></title>
<style>
body {
	background-image: url(${ctx}/img/report/bg.gif);
    background-repeat: repeat;
    padding: 0px 0px 0px 0px;
    margin: 0px 0px 0px 0px;
}
td, label {
    font-family: 微软雅黑;
    font-size: 12px;
}
</style>
</head>

<body>
	<div style="border: 1px solid #FFFF00; background-color: #FFFFFF; height: 100%; width: 1000px; margin: 0px auto 0px auto; top: 0px; bottom: 0px;">
		<%@ include file="/WEB-INF/pages/portal/report/top.jsp"%>
	   
		<div style="width: 900px; margin-right: auto; margin-left: auto">
			<div align="center" style="width:100%; margin-bottom: 50px; margin-top: 20px;">
				<form id="cform" action="../ForeSJMail/SaveModel" style="margin:0px" method="post">
					<table cellspacing="1" cellpadding="0" class="form" width="900px" bgcolor="DDE5E7" border="0" align="center">
						<tbody>
							<tr> 
								<td align="left" width="70px" bgcolor="#EEF0F7" height="25px" style="padding-left: 15px"><font color="#FF0000"> *</font>认证码</td>
								<td width="850px" bgcolor="F8FBFE" align="left"><input class="input" name="rand" id="rand" maxlength="6">&nbsp;
									<img id="kaptcha-img" src="${ctx}/api/kaptcha/captcha.jpg"  height="30" title="点击更换" style="cursor: pointer;"/>
								</td>
 
							</tr>
							<tr> 
								<td align="left" width="70px" bgcolor="#EEF0F7" height="25px" style="padding-left: 15px"><font color="#FF0000"> *</font>您的信息</td>
								<td width="850px" bgcolor="F8FBFE" align="left"><input class="input" id="SendInfo" name="SendInfo" maxlength="64" style="width: 600px">
								</td>
							</tr>
							<tr> 
								<td align="left" width="70px" bgcolor="#EEF0F7" height="25px" style="padding-left: 15px"><font color="#FF0000"> *</font>信件标题</td>
								<td bgcolor="F8FBFE" align="left">
									<input class="input" id="MailTitle" name="MailTitle" maxlength="64" style="width: 600px">
								</td>
							</tr>
							<tr> 
								<td align="left" valign="top" width="70px" bgcolor="#EEF0F7" height="25px" style="padding-left: 15px;padding-top:5px">
									<font color="#FF0000"> *</font>信件内容
								</td>
								<td bgcolor="F8FBFE" align="left">
									<textarea name="MailContext" id="MailContext" cols="70" rows="8" style="width: 95%;height: 300px"></textarea>
								</td>
							</tr>      
						</tbody>
					</table>
					<table width="900px" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="EEF0F7">
						<tbody>
							<tr>
								<td align="right" height="30px" width="820px">
								</td>
								<td align="right" height="30px" width="100px" style="padding-right: 50px">
									<button type="">发送</button>
    							</td>
							</tr>
						</tbody>
					</table>

				</form>
			</div>
        </div>
	
		<%@ include file="/WEB-INF/pages/portal/report/footer.jsp"%>
		
    </div>
</body>

<script>
;(function() {
	//点击更换图形验证码
	$("#kaptcha-img").click(function() {
		$(this).attr("src", "${ctx}/api/kaptcha/captcha.jpg?t=" + Math.random()); 
	});
})();
</script>
</html>
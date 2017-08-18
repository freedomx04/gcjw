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
				<form id="cform" style="margin:0px">
					<table cellspacing="1" cellpadding="0" class="form" width="900px" bgcolor="DDE5E7" border="0" align="center">
						<tbody>
							<tr> 
								<td align="left" width="70px" bgcolor="#EEF0F7" height="25px" style="padding-left: 15px"><font color="#FF0000"> *</font>认证码</td>
								<td width="850px" bgcolor="F8FBFE" align="left">
									<input class="input" name="kaptcha" id="kaptcha" maxlength="6">&nbsp;
									<img id="kaptcha-img" src="${ctx}/api/kaptcha/captcha.jpg"  height="30" title="点击更换" style="cursor: pointer;"/>
								</td>
 
							</tr>
							<tr> 
								<td align="left" width="70px" bgcolor="#EEF0F7" height="25px" style="padding-left: 15px"><font color="#FF0000"> *</font>您的信息</td>
								<td width="850px" bgcolor="F8FBFE" align="left">
									<input class="input" id="info" name="info" style="width: 600px">
								</td>
							</tr>
							<tr> 
								<td align="left" width="70px" bgcolor="#EEF0F7" height="25px" style="padding-left: 15px"><font color="#FF0000"> *</font>信件标题</td>
								<td bgcolor="F8FBFE" align="left">
									<input class="input" id="title" name="title" style="width: 600px">
								</td>
							</tr>
							<tr> 
								<td align="left" valign="top" width="70px" bgcolor="#EEF0F7" height="25px" style="padding-left: 15px;padding-top:5px">
									<font color="#FF0000"> *</font>信件内容
								</td>
								<td bgcolor="F8FBFE" align="left">
									<textarea name="content" id="content" cols="70" rows="8" style="width: 95%;height: 300px"></textarea>
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
									<button type="button" id="sendMail">发送</button>
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
	var $form = $("#cform");
	var $kaptcha_img = $("#kaptcha-img");
	var $kaptcha = $("#kaptcha");
	
	//点击更换图形验证码
	$kaptcha_img.click(function() {
		$(this).attr("src", "${ctx}/api/kaptcha/captcha.jpg?t=" + Math.random()); 
	});
	
	$("#sendMail").on("click", function() {
		if (cform.kaptcha.value == "") {
            alert("认证码不能为空，请重新填写！");
            cform.kaptcha.focus();
            return ;
        }

        if (cform.title.value == "") {
            alert("信件主题不能为空，请重新填写！");
            cform.title.focus();
            return;
        }

        if (cform.content.value == "") {
            alert("信件内容不能为空，请重新填写！");
            cform.content.focus();
            return;
        }

		$.ajax({
			url: "${ctx}/api/kaptcha/check",
			type: "POST",
			data: {
				kaptcha: $kaptcha.val()
			},
			success: function(result) {
				if (result.code == 0) {
					$.ajax({
						url: "${ctx}/api/mail/create",
						type: "POST",
						data: {
							info: $form.find("#info").val(),
							title: $form.find("#title").val(),
							content: $form.find("#content").val()
						},
						success: function(ret) {
							if (ret.code == 0) {
								alert("您的信件查询码为" + ret.data);
								cform.reset();
							}
						},
						error: function(err) {}
					});
				} else {
					alert("认证码错误，请重新填写！");
					$kaptcha_img.attr("src","${ctx}/api/kaptcha/captcha.jpg?t=" + Math.random()); 
					$kaptcha.val("");
				}
			},
			error: function(err) {}
		});
	});
})();
</script>
</html>
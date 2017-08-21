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
td, label {
    font-family: 微软雅黑;
    font-size: 12px;
}
</style>
</head>

<body>
	<div style="border: 1px solid #FFFF00; background-color: #FFFFFF; height: 100%; width: 1000px; margin: 0px auto 0px auto; top: 0px; bottom: 0px;">
		<%@ include file="/WEB-INF/pages/portal/report/top.jsp"%>
	   
		<div style="width: 600px; margin-right: auto; margin-left: auto">
			<div>
				<img height="59px" src="${ctx}/img/report/56pic.gif" width="191px">
			</div>
			<div align="center" style="width:100%; margin-bottom: 50px; margin-top: 20px;">
				<form id="formSearch" style="margin:0px">
					<table cellspacing="1" cellpadding="0" width="650" bgcolor="DDE5E7" border="0" align="center">
						<tbody>
							<tr> 
								<td align="right" width="200" bgcolor="EEF0F7" height="30px" valign="middle"><font color="#FF0000"> *</font>请输入查询密码：</td>
								<td bgcolor="F8FBFE" align="left">
									<input type="text" class="input" id="code" name="code" value="" maxlength="32" style="width: 250px">
								</td>
							</tr>
							<tr>
								<td align="right" bgcolor="EEF0F7" height="30px"><font color="#FF0000"> *</font>认证码：</td>
								<td bgcolor="F8FBFE" align="left" valign="middle">
									<input class="input" id="kaptcha" name="kaptcha" maxlength="20">&nbsp; 
									<img id="kaptcha-img" src="${ctx}/api/kaptcha/captcha.jpg"  height="30" title="点击更换" style="cursor: pointer;"/>
								</td>
							</tr>
							<tr>
								<td align="right" bgcolor="EEF0F7" height="30px">操作：</td>
								<td bgcolor="F8FBFE" align="left" valign="middle">&nbsp;&nbsp;
									<input type="button" id="btnSubmit" value="查询">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				
				<table id="searchResult" cellspacing="1" cellpadding="0" width="650" bgcolor="DDE5E7" border="0" align="center" style="display: none;">
					<tbody>
						<tr>
							<td align="right" width="200" bgcolor="EEF0F7" height="30px" valign="middle"><font color="#FF0000"> *</font>查询码：</td>
							<td class="code" bgcolor="F8FBFE" align="left">
							</td>
						</tr>
						<tr>
							<td align="right" width="200" bgcolor="EEF0F7" height="30px" valign="middle"><font color="#FF0000"> *</font>回复：</td>
							<td class="reply" width="450" bgcolor="F8FBFE" align="left">
							</td>
						</tr>
					</tbody>
				</table>
				
			</div>
		</div>
	
		<%@ include file="/WEB-INF/pages/portal/report/footer.jsp"%>
		
    </div>
</body>

<script>
;(function() {
	var $form = $("#formSearch");
	var $kaptcha_img = $("#kaptcha-img");
	var $kaptcha = $("#kaptcha");
	
	//点击更换图形验证码
	$("#kaptcha-img").click(function() {
		$(this).attr("src", "${ctx}/api/kaptcha/captcha.jpg?t=" + Math.random()); 
	});
	
	$("#btnSubmit").on("click", function() {
        if (formSearch.code.value == "") {
            alert("查询码不能为空，请重新填写！");
            formSearch.code.focus();
            return;
        }
        
		if (formSearch.kaptcha.value == "") {
            alert("认证码不能为空，请重新填写！");
            formSearch.kaptcha.focus();
            return ;
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
						url: "${ctx}/api/mail/getByCode",
						type: "POST",
						data: {
							code: $form.find("#code").val()
						},
						success: function(ret) {
							var $searchResult = $("#searchResult");
							$searchResult.css("display", "block");
							$form.css("display", "none");
							$searchResult.find(".code").text(ret.data.code);
							$searchResult.find(".reply").text(ret.data.reply);
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
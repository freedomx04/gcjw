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
<script type="text/javascript" src="${ctx}/local/common.js"></script>

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

<body class="body-jbbill">
	<div style="border: 1px solid #FFFF00; background-color: #FFFFFF; height: 100%; width: 1000px; margin: 0px auto 0px auto; top: 0px; bottom: 0px;">
		<%@ include file="/WEB-INF/pages/portal/report/top.jsp"%>
		
	   	<div style="width: 700px; margin-right: auto; margin-left: auto">
			<div>
				<img height="59px" src="${ctx}/img/report/03pic.gif" width="191px">
			</div>
			<div align="center" style="width:100%; margin-bottom: 50px; margin-top: 20px;">
		    	<form id="jubaoform" style="margin:0px">
					<table width="700" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="DDE5E7">
						<tbody>
							<tr>
          						<td width="5%"></td>
       							<td width="95%" height="30px" align="left"><b><font color="#990000">举报人信息</font>（注意:标有<font color="#FF0000"> * </font>的必须填写）</b></td>
        					</tr>
      					</tbody>
					</table>
      				<table cellspacing="1" cellpadding="0" class="form" width="700px" bgcolor="DDE5E7" border="0" align="center">
      					<tbody>
      						<tr> 
        						<td align="middle" width="130" bgcolor="EEF0F7" height="25">您的姓名</td>
        						<td width="220" bgcolor="F8FBFE" align="left">
        							<input id="name" name="name">
        						</td>
						        <td align="middle" bgcolor="EEF0F7" width="130"><font color="#FF0000"> *</font>认证码：</td>
						        <td bgcolor="F8FBFE" align="left">
						        	<input class="input" name="kaptcha" id="kaptcha" maxlength="6" style="width:80px">&nbsp;
						        	<img id="kaptcha-img" src="${ctx}/api/kaptcha/captcha.jpg"  height="30" title="点击更换" style="cursor: pointer;"/>
						        </td>
							</tr>
							<tr> 
						        <td align="middle" bgcolor="EEF0F7">联系方式：</td>
						        <td bgcolor="F8FBFE" align="left">
						        	<input name="telephone" id="telephone">
						        </td>
								<td align="middle" bgcolor="EEF0F7" height="25">身份证号：</td>
       							<td bgcolor="F8FBFE" align="left">
        							<input name="idCards" id="idCards">
								</td>
      						</tr>      
      						<tr> 
          						<td align="middle" bgcolor="EEF0F7">工作单位或住址：</td>
						        <td bgcolor="F8FBFE" align="left">
						        	<input name="address" id="address">
						        </td>
							</tr>         
       					</tbody>
   					</table>

					<!--被告人-->
					<table width="700" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="DDE5E7">
						<tbody><tr>
							<td width="5%"></td>
							<td width="95%" height="30" class="font14" align="left"><b><font color="#990000">被举报人（单位）信息</font>（注意:标有<font color="#FF0000"> * </font>的必须填写）</b></td>
						</tr>
      					</tbody>
      				</table>
   					<table cellspacing="1" cellpadding="0" width="700" class="form" bgcolor="DDE5E7" border="0" align="center">
           				<tbody>
           					<tr> 
        						<td align="middle" bgcolor="EEF0F7" height="25" width="130"><font color="#FF0000"> *</font>单位名称：</td>
						        <td bgcolor="F8FBFE" align="left" width="220">
						        <input name="reportUnit" id="reportUnit">
						        </td>
						        <td align="middle" width="130" bgcolor="EEF0F7" height="25">姓名：</td>
						        <td bgcolor="F8FBFE" align="left">
						        	<input name="reportName" id="reportName">
        						</td>
							</tr>     
							<tr> 
        	  					<td align="middle" bgcolor="EEF0F7">职 务：</td>
						        <td bgcolor="F8FBFE" align="left">
						        	<input type="text" name="position" id="position">
						        </td>
						        <td align="middle" bgcolor="EEF0F7" height="25">级 别：</td>
						        <td bgcolor="F8FBFE" align="left">
						            <select id="level" name="level">
						            	<option value="">==请选择==</option>
									</select>
						        </td>
							</tr>
							<tr> 
								<td align="middle" bgcolor="EEF0F7">政治面貌：</td>
        						<td bgcolor="F8FBFE" align="left">
          							<select id="politics" name="politics">
          								<option value="">==请选择==</option>
										<option value="中国共产党党员">中国共产党党员</option>
										<option value="其他">其他</option>
									</select>
						        </td>
							</tr>       
						</tbody>
					</table>
					
     				<!--主要问题-->
      				<table width="700" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="DDE5E7">
        				<tbody>
        					<tr>
          						<td width="5%"></td>
          						<td width="95%" height="30" class="font14" align="left"><b>
          							<font color="#990000">举报信正文</font>（注意:标有<font color="#FF0000"> * </font>的必须填写）</b>
          						</td>
        					</tr>
      					</tbody>
   					</table>
      				<table cellspacing="1" cellpadding="0" width="700" bgcolor="DDE5E7" border="0" align="center" class="form">
      					<tbody>
      						<tr> 
						        <td align="middle" width="130" bgcolor="EEF0F7" height="25"><font color="#FF0000"> *</font>问题类别：</td>
						        <td bgcolor="F8FBFE" colspan="3" align="left">
            						<select id="type" name="type">
            							<option value="">==请选择==</option>
									</select>
        						</td>
      						</tr>
       						<tr> 
						        <td valign="top" align="center" width="130" bgcolor="EEF0F7" height="25"><font color="#FF0000"> *</font>主要问题：<br></td>
						        <td bgcolor="F8FBFE" colspan="3" align="left">
						        	<textarea name="content" id="content" cols="70" rows="8"></textarea>
						        </td>
							</tr>
      					</tbody>
   					</table>
      				<table width="700" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="EEF0F7">
        				<tbody>
        					<tr>
								<td align="right" height="30px" width="500px">
								</td>
								<td align="right" height="30px" width="200px">
									<input id="submitBtn" type="button" value="提交" style="display: inline;">
									<input id="resetBtn" type="button" value="重新举报">
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
	var $page = $(".body-jbbill");
	var $form = $page.find("#jubaoform");
	var $kaptcha_img = $("#kaptcha-img");
	var $kaptcha = $("#kaptcha");
	
	$.each($k.constant.level, function(key, val) {
		$('<option value="'+ val.name +'">'+ val.name +'</option>')
		.appendTo($page.find("#level"));
	});
	$.each($k.constant.type, function(key, val) {
		$('<option value="'+ val.name +'">'+ val.name +'</option>')
		.appendTo($page.find("#type"));
	});
	
	$page.
	on("click", "#submitBtn", function() {
		if (jubaoform.kaptcha.value == "") {
            alert("认证码不能为空，请重新填写！");
            jubaoform.kaptcha.focus();
            return ;
        }

        if (jubaoform.reportUnit.value == "") {
            alert("被举报单位名称不能为空，请重新填写！");
            jubaoform.reportUnit.focus();
            return;
        }

        if (jubaoform.type.value == "") {
            alert("问题类别不能为空，请重新填写！");
            jubaoform.type.focus();
            return;
        }
        
        if (jubaoform.content.value == "") {
            alert("主要问题不能为空，请重新填写！");
            jubaoform.content.focus();
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
						url: "${ctx}/api/report/create",
						type: "POST",
						data: $form.serialize(),
						success: function(ret) {
							alert("举报成功！");
							jubaoform.reset();
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
	})
	.on("click", "#resetBtn", function() {
		jubaoform.reset();
	});
	
})();
</script>
</html>
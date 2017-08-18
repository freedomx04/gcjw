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
	   
		<div style="width: 600px; margin-right: auto; margin-left: auto">
 			<div>
				<img height="59px" src="${ctx}/img/report/05pic.gif" width="191px">
			</div>
			<div name="xzContext" id="xzContext" style="overflow: auto;height:auto; font-size: medium;">
				<p>
					<span class="text12"><strong>一、受理范围</strong></span>
					<br>
					<span class="t2">1、按照《中国共产党纪律检查机关控告申诉工作条例》的相关规定，应当由抚州市纪委受理的党员、党组织违反党章和党内法规，违反党的路线、方针、政策和决议，利用职权谋取私利和其他败坏党风行为的检举、控告。 
						<br>2、按照《中华人民共和国行政监察法》相关规定，应当由抚州市纪委、市监察局举报中心受理的国家行政机关及其工作人员和国家行政机关任命的其他人员违反国家法律、法规、政策和决定、命令以及违反政纪行为的检举、控告。<br>3、对不属于纪检监察业务范围之内的问题将不予受理，请向有关部门反映。 
					</span>
					<br><br>
					<span class="text12"><strong>二、办理原则</strong></span>
					<br><span class="t2">根据被检举、控告人的职务和举报内容，实行“分级负责、归口办理”的原则， 依纪依法办理举报件。有关具体规定详见本网站“相关法律法规”栏目中《中国共产党纪律检查机关控告申诉工作条例》和《中华人民共和国行政监察法》。</span> 
					<br><br><span class="text12"><strong>三、检举、控告人的义务</strong></span>
					<br><span class="t2">1、检举、控告人应当遵守法律、法规，不得损害国家、社会、集体的利益和其他公民的合法权利。 2、检举、控告的内容应当客观真实，不得捏造、歪曲事实，不得诬告、陷害他人。对借检举、控告诬告陷害他人的，依照有关规定严肃处理；涉嫌犯罪的，移送司法机关依法处理。 </span>
					<br><br><span class="text12"><strong>四、注意事项</strong></span></p>
					<p><span class="t2">1、网上举报只是反映问题的一种途径，还可以通过其他形式进行举报。 
						<br>通讯地址：抚州市纪委信访室 。 <br>邮政编码：344000<br>举报电话：
						<strong><span style="color:#ffcc66;"> <span style="color:#993300;">(0794)12388 </span></span></strong>
					</span></p>
					<span class="t2"></span>
					<p>2、提倡署实名举报，署实名举报的，请详细填写联系方式。 </p>
					<p>3、请如实填写举报表单中的各栏目。填写“举报内容”一栏时，力求详尽，对违纪违法行为发生的时间、地点、主要证据、涉及人员等要交代明确。标有“
						<span style="color:#ff0000;">*</span>”的为必填项。
					</p>
					<p>4、为了保障检举、控告人的合法权益，限制恶意的重复举报垃圾信件，提高网上举报的运行效益，本网站限定每台计算机每天最多只能提交2封举报件。</p>
					<p>
						<span class="t2"><strong>(请认真阅读网上举报须知,15秒钟后，方可点击“我接受”按钮。为保证举报信息传输的安全，系统会自动弹出“安全警报”对话框，请点击“是”，进行举报。)</strong> </span>
						<br>
					</p>
			</div>
			<form name="ruleForm" method="post" padding-top="5">
				<table border="0" cellpadding="0" cellspacing="0" align="center">
					<tbody>
						<tr>
							<td style="display:none" id="lblAgree">
								<a href="../../ForeJBBill/Index"><img src="${ctx}/img/report/js.gif" width="105" height="43" border="0" alt="填写表单"></a>
							</td>
							<td id="tblWait">
								<table border="0" cellpadding="0" cellspacing="0">
									<tbody>
										<tr>
											<td width="85"><img src="${ctx}/img/report/js1.gif" width="85" height="42"></td>
											<td background="${ctx}/img/report/js2.gif" width="32" height="42" id="lbxAgreeTime" style="display:block"></td>
											<td width="18"><img src="${ctx}/img/report/js3.gif" width="18" height="42"></td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
							<a href="${ctx}/report/index"><img src="${ctx}/img/report/njs.gif" width="105" height="43" border="0" alt="不接受则返回首页"></a>
							</td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" value="15" name="hidCnt">
			</form>
		</div>
		
		<%@ include file="/WEB-INF/pages/portal/report/footer.jsp"%>
		
    </div>
</body>

<script>
	//ruleForm.btnAgree.disabled = true;
  	var timeOutObj = null;
  	var timerRunning = true;
  	function startTime() {
		lbxAgreeTime.innerHTML = "  " + ruleForm.hidCnt.value + "秒";
		ruleForm.hidCnt.value = ruleForm.hidCnt.value - 1;
		if (ruleForm.hidCnt.value <= 0) {
		    clearTimeout(timeOutObj);
		    //ruleForm.btnAgree.disabled = false;
		    lbxAgreeTime.innerHTML = "";
		    tblWait.style.display = 'none';
		    lblAgree.style.display = '';
		    stopTime();
		} else {
		    timeOutObj = setTimeout("startTime()", 1000);
		    timerRunning = true;
		}
	}
	function stopTime() {
	    if (timerRunning) {
	        clearTimeout(timeOutObj);
	    }
	    timerRunning = false;
	}
	startTime();

</script>
</html>
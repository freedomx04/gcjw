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
				<img height="59px" src="${ctx}/img/report/03pic.gif" width="191px">
			</div>
			<div align="center" style="width:100%; margin-bottom: 50px; margin-top: 20px;">
		    	<form id="jubaoform" action="../ForeJBBill/SaveModel" style="margin:0px" method="post">
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
        						<td width="220" bgcolor="F8FBFE" align="left"><input class="input" id="JBName" name="JBName" maxlength="20">
        						</td>
						        <td align="middle" bgcolor="EEF0F7" width="130"><font color="#FF0000"> *</font>认证码：</td>
						        <td bgcolor="F8FBFE" align="left">
						        	<input class="input" name="kaptcha" id="kaptcha" maxlength="6" style="width:80px">&nbsp;
						        	<img id="kaptcha-img" src="${ctx}/api/kaptcha/captcha.jpg"  height="30" title="点击更换" style="cursor: pointer;"/>
						        </td>
							</tr>
							<tr> 
						        <td align="middle" bgcolor="EEF0F7">联系方式：</td>
						        <td bgcolor="F8FBFE" align="left"><input class="input" name="JBTel" id="JBTel" maxlength="50"></td>
								<td align="middle" bgcolor="EEF0F7" height="25">身份证号：</td>
       							<td bgcolor="F8FBFE" align="left">
        							<input class="input" name="JBIDCard" id="JBIDCard" maxlength="20">
								</td>
      						</tr>      
      						<tr> 
						        <td align="middle" bgcolor="EEF0F7">所属地区：</td>
						        <td bgcolor="F8FBFE" align="left">
       								<input class="input" name="JBArea" id="JBArea">
        						</td>
          						<td align="middle" bgcolor="EEF0F7">工作单位或住址：</td>
						        <td bgcolor="F8FBFE" align="left">
						        	<input class="input" name="JBAddress" id="JBAddress" maxlength="200">
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
						        <input class="input" name="BJBAddress" id="BJBAddress" maxlength="200">
						        </td>
          						<td align="middle" bgcolor="EEF0F7" width="130"><font color="#FF0000"> *</font>所属地区：</td>
						        <td bgcolor="F8FBFE" align="left">
									<input class="input" name="BJBArea" id="BJBArea" readonly="">
									<a id="btnSearchArea" href="#" class="easyui-linkbutton l-btn l-btn-plain" iconcls="icon-search" plain="true" onclick="SearchArea()">
										<span class="l-btn-left"><span class="l-btn-text icon-search" style="padding-left: 20px;">选择</span></span>
									</a>
						        </td>
							</tr>     
							<tr> 
						        <td align="middle" width="130" bgcolor="EEF0F7" height="25">姓名：</td>
						        <td bgcolor="F8FBFE" align="left"><input class="input" name="BJBName" id="BJBName" maxlength="20">
        						</td>
        	  					<td align="middle" bgcolor="EEF0F7">职 务：</td>
						        <td bgcolor="F8FBFE" align="left">
						        <input class="input" type="text" name="BJBTitle" id="BJBTitle" maxlength="50">
						        </td>
							</tr>
							<tr> 
						        <td align="middle" bgcolor="EEF0F7" height="25">级 别：</td>
						        <td bgcolor="F8FBFE" align="left">
						            <select id="BJBLeave" name="BJBLeave"><option value="">==请选择==</option>
						<option value="县处级">县处级</option>
						<option value="乡科级">乡科级</option>
						<option value="一般干部">一般干部</option>
						<option value="其他人员">其他人员</option>
						<option value="其他农村人员">其他农村人员</option>
						<option value="其他企业人员">其他企业人员</option>
						</select>
						        </td>
								<td align="middle" bgcolor="EEF0F7">政治面貌：</td>
        						<td bgcolor="F8FBFE" align="left">
          							<select id="BJBFace" name="BJBFace"><option value="">==请选择==</option>
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
            						<select id="QType" name="QType"><option value="">==请选择==</option>
										<option value="涉法行为—贪污贿赂行为">涉法行为—贪污贿赂行为</option>
										<option value="涉法行为—失职渎职行为">涉法行为—失职渎职行为</option>
										<option value="涉法行为—破坏社会主义市场经济秩序行为">涉法行为—破坏社会主义市场经济秩序行为</option>
										<option value="涉法行为—侵犯人身权利民主权利行为">涉法行为—侵犯人身权利民主权利行为</option>
										<option value="涉法行为—妨害社会管理秩序行为">涉法行为—妨害社会管理秩序行为</option>
										<option value="涉法行为—其他涉法行为">涉法行为—其他涉法行为</option>
										<option value="政治纪律—公开发表危害党的言论">政治纪律—公开发表危害党的言论</option>
										<option value="政治纪律—参加反对党和政府的活动或组织">政治纪律—参加反对党和政府的活动或组织</option>
										<option value="政治纪律—在党内搞团团伙伙">政治纪律—在党内搞团团伙伙</option>
										<option value="政治纪律—妨碍党和国家方针政策实施">政治纪律—妨碍党和国家方针政策实施</option>
										<option value="政治纪律—对抗组织审查">政治纪律—对抗组织审查</option>
										<option value="政治纪律—组织参加迷信活动">政治纪律—组织参加迷信活动</option>
										<option value="政治纪律—叛逃及涉外活动中损害党和国家利益">政治纪律—叛逃及涉外活动中损害党和国家利益</option>
										<option value="政治纪律—无原则一团和气和违反政治规矩">政治纪律—无原则一团和气和违反政治规矩</option>
										<option value="组织纪律—违反民主集中制原则">组织纪律—违反民主集中制原则</option>
										<option value="组织纪律—不按要求请示报告有关事项">组织纪律—不按要求请示报告有关事项</option>
										<option value="组织纪律—违规组织参加老乡会校友会战友会">组织纪律—违规组织参加老乡会校友会战友会</option>
										<option value="组织纪律—侵犯党员权利">组织纪律—侵犯党员权利</option>
										<option value="组织纪律—在投票和选举中搞非组织活动">组织纪律—在投票和选举中搞非组织活动</option>
										<option value="组织纪律—违反干部选拔任用规定">组织纪律—违反干部选拔任用规定</option>
										<option value="组织纪律—在人事劳动工作中违规谋利">组织纪律—在人事劳动工作中违规谋利</option>
										<option value="组织纪律—违规发展党员">组织纪律—违规发展党员</option>
										<option value="组织纪律—违规办理出国证件和在境外脱离组织">组织纪律—违规办理出国证件和在境外脱离组织</option>
										<option value="廉洁纪律—权权交易和纵容特定关系人以权谋利">廉洁纪律—权权交易和纵容特定关系人以权谋利</option>
										<option value="廉洁纪律—违规接受礼品礼金宴请服务">廉洁纪律—违规接受礼品礼金宴请服务</option>
										<option value="廉洁纪律—违规操办婚丧喜庆事宜">廉洁纪律—违规操办婚丧喜庆事宜</option>
										<option value="廉洁纪律—违规从事营利活动">廉洁纪律—违规从事营利活动</option>
										<option value="廉洁纪律—违反工作生活待遇规定">廉洁纪律—违反工作生活待遇规定</option>
										<option value="廉洁纪律—违规占用使用公私财物">廉洁纪律—违规占用使用公私财物</option>
										<option value="廉洁纪律—违规参与公款宴请消费">廉洁纪律—违规参与公款宴请消费</option>
										<option value="廉洁纪律—违规自定薪酬和发放津贴补贴奖金">廉洁纪律—违规自定薪酬和发放津贴补贴奖金</option>
										<option value="廉洁纪律—公款旅游">廉洁纪律—公款旅游</option>
										<option value="廉洁纪律—违反公务接待管理规定">廉洁纪律—违反公务接待管理规定</option>
										<option value="廉洁纪律—违反公务用车管理规定">廉洁纪律—违反公务用车管理规定</option>
										<option value="廉洁纪律—违反会议活动管理规定">廉洁纪律—违反会议活动管理规定</option>
										<option value="廉洁纪律—违反办公用房管理规定">廉洁纪律—违反办公用房管理规定</option>
										<option value="廉洁纪律—权色钱色交易">廉洁纪律—权色钱色交易</option>
										<option value="廉洁纪律—其他违反廉洁纪律行为">廉洁纪律—其他违反廉洁纪律行为</option>
										<option value="群众纪律—侵害群众利益">群众纪律—侵害群众利益</option>
										<option value="群众纪律—漠视群众利益">群众纪律—漠视群众利益</option>
										<option value="群众纪律—侵犯群众知情权">群众纪律—侵犯群众知情权</option>
										<option value="群众纪律—其他违反群众纪律行为">群众纪律—其他违反群众纪律行为</option>
										<option value="工作纪律—主体责任落实不力">工作纪律—主体责任落实不力</option>
										<option value="工作纪律—违规干预市场经济活动">工作纪律—违规干预市场经济活动</option>
										<option value="工作纪律—违规干预执纪执法司法活动">工作纪律—违规干预执纪执法司法活动</option>
										<option value="工作纪律—泄露扩散窃取私存党的秘密">工作纪律—泄露扩散窃取私存党的秘密</option>
										<option value="工作纪律—违反考试录取工作规定">工作纪律—违反考试录取工作规定</option>
										<option value="工作纪律—其他违反工作纪律行为">工作纪律—其他违反工作纪律行为</option>
										<option value="生活纪律—生活奢靡">生活纪律—生活奢靡</option>
										<option value="生活纪律—不正当性关系">生活纪律—不正当性关系</option>
										<option value="生活纪律—其他违反生活纪律行为">生活纪律—其他违反生活纪律行为</option>
									</select>
        </td>
      						</tr>
       						<tr> 
						        <td valign="top" align="center" width="130" bgcolor="EEF0F7" height="25"><font color="#FF0000"> *</font>主要问题：<br></td>
						        <td bgcolor="F8FBFE" colspan="3" align="left">
						        	<textarea name="QContext" id="QContext" cols="70" rows="8"></textarea>
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
									<input type="button" value="提交" style="display: inline;">
									<div class="datagrid-btn-separator" style="display: inline;"></div>
									<input type="button" value="重新举报">
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
})();
</script>
</html>
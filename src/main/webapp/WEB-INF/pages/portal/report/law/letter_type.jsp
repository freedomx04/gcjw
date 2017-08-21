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
			<div name="lawContext" id="lawContext" style="overflow: auto;height:auto;">
				<p align="center" style="font-size: 13.3333px; text-align: -webkit-center;">
					<strong><span style="font-size:32px;">举报信主要样式</span></strong>
				</p>
				<span style="font-size: 13.3333px; text-align: -webkit-center;">&nbsp;</span>
				<p align="left" style="font-size: 13.3333px;">
					<strong><span style="color:#ff0000;">主要内容填写样式一：</span></strong>
				</p>
				<p align="left" style="font-size: 13.3333px;"><strong>一、受贿</strong></p>
				<p align="left" style="font-size: 13.3333px;">1. 奥XX在担任XX县委书记期间，XX年XX月XX日晚，奥XX在自己家中收受其朋友XX房地产商劳XX贿赂XX万人民币和X张字画，答应在房地产项目规划调整、获取土地等方面提供帮助。知情人：布XX，劳XX司机，联系方式：138****1234。</p>
				<p align="left" style="font-size: 13.3333px;">2.尚XX在任XX县XX镇镇长期间，借汇报工作之机，先后于XX年X月和X月，在奥XX办公室向其行贿金条共计X根（价值XX多万元），希望到XX局担任局长，后尚XX担任XX局局长。知情人：X，XX县XX单位工作人员，联系方式：138****2345。</p>
				<p align="left" style="font-size: 13.3333px;"><strong>二、违规借用豪华汽车</strong></p>
				<p align="left" style="font-size: 13.3333px;">2014年9月，奥XX以方便到偏远乡镇调研为由，要求县委办公室向县属XX企业借用一部越野车。XX企业接到通知后专门花费XX万元，购买一辆越野车（车牌号：赣FXXXX）。奥XX还为此专门表扬XX企业。</p>
				<p align="left" style="font-size: 13.3333px;"><strong>&nbsp;</strong></p>
				<p align="left" style="font-size: 13.3333px;"><strong><span style="color:#ff0000;">主要内容填写样式二：</span></strong></p>
				<p align="left" style="font-size: 13.3333px;">XX年XX月XX日-XX日，印XX率XX人赴XX省XX市进行公务访问。出发前由工作人员蒲XX以XX公司名义与XX旅游社签订旅游合同，合同金额XX万元。在XX市期间，只有XX天安排了公务会谈和考察，其余时间到XX、XX、XX等城市和景区旅游，并在XX购物中心和XX商场购买了XX品牌手表、XX品牌皮带等奢侈品。</p>
				<p align="left" style="font-size: 13.3333px;"><strong>&nbsp;</strong></p>
				<p align="left" style="font-size: 13.3333px;"><strong><span style="color:#ff0000;">主要内容填写样式三：</span></strong></p>
				<p align="left" style="font-size: 13.3333px;">XX年XX月XX日晚，向XX、古XX、都XX等X人在XX会所接受下属单位XX企业为他们安排的公款宴请。晚餐共花费X万多元，消费X瓶高档白酒和X瓶法国进口红酒，由XX企业办公室主任冷XX公款买单。餐后分别时，向XX等人每人获赠价值X万元的XX品牌皮带。知情人：冷XX，XX企业办公室主任，电话：138****3456。</p>
			</div>
			<div style="width: 160px; margin-right: auto; margin-left: auto; margin-bottom: 20px;">
				<a href="${ctx}/report/JBXZ" style="margin-right: auto; margin-left: auto"><img height="43px" src="${ctx}/img/report/02pic.gif" width="160px" border="0"></a>
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
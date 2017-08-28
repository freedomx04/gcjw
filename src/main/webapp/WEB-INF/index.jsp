<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>广昌县纪委监察厅网站</title>
    
    <script type="text/javascript" src="${ctx}/plugins/marquee/MSClass.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/paging/paging.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/slideBox/jquery.slideBox.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/index.css">
</head>

<body class="body-index">
	<%@ include file="/WEB-INF/template/top.jsp"%>
	
	<div class="footer-container">
		<div class="footer">
			<div class="tzgg" style="font-size: 16px;">
				<div class="tztitle">通知公告：</div>
				<div id="fgyy1" style="overflow: hidden; width: 800px; height: 30px; white-space: nowrap;">
				
				<table cellspacing="0" cellpadding="0" style="border-collapse:collapse;display:inline;">
					<tbody>
						<tr>
						<td style="white-space: nowrap; word-break: keep-all;">
							<table border="0" cellpadding="0" cellspacing="0" align="center">
								<tbody>
									<tr>
										<c:forEach var="announce" items="${announceList}">
										<td>
											<a href="article/${announce.id}?type=0" target="_blank">${announce.title}</a>
										</td>
										</c:forEach>
									</tr>
								</tbody>
							</table>
						</td>
						<td style="white-space: nowrap;word-break:keep-all;">
							<table border="0" cellpadding="0" cellspacing="0" align="center">
								<tbody>
									<tr>
										<c:forEach var="announce" items="${announceList2}">
										<td>
											<a href="article/${announce.id}?type=0" target="_blank">${announce.title}</a>
										</td>
										</c:forEach>
									</tr>
								</tbody>
							</table>
						</td>
						</tr>
					</tbody>
				</table>
				</div>
				<script>new Marquee('fgyy1', 2, 1, 800, 30, 50, 0);</script>
			</div>
			
			<div class="banner-one">
				<!-- 图片新闻 -->
				<div class="sy_zwL">
					<div class="slideBox">
						<ul class="items">
							<c:forEach var="photonews" items="${photonewsList}">
							<li>
								<a href="${ctx}/article/${photonews.id}?type=1" title="${photonews.title}" target="_blank" style="width: 480px; height: 261px;">
									<img src="${ctx}${photonews.imagePath}" style="width: 100%; height: 100%;">
								</a>
							</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!-- 廉政头条 -->
				<div class="right-box">
			    	<img src="${ctx}/img/lztt.gif" style="width: 50px; padding: 10px; margin-left: 10px; margin-top: 16px;">
				    <a class="currentB" href="${ctx}/article/${headline.id}?type=2" target="_blank" title="">
				    	${headline.title}
				    </a>
				    <div style="padding-top:13px"></div>
				    <div class="js_yw">
						<p>
							<c:if test="${fn:length(headline.content) > 65}">
								${fn:substring(headline.content, 0, 65)}...
							</c:if>
							<c:if test="${fn:length(headline.content) <= 65}">
								${headline.content}
							</c:if>
						</p>
				    </div>
				    <div style="padding-top:8px"></div>
					<a href="${ctx}/article/${focusnewsList[0].id}?type=2" target="_blank" class="currentC">更多+</a> 
				</div>
			</div>
			
			<div class="banner-two">
				<!-- 廉情在线 -->
				<div class="lianzheng-box">
					<div class="lianzheng-top"> 
						<a href="column?type=3" target="_blank">廉情在线</a> 
						<a class="currentD" href="column?type=3" target="_blank">更多+</a> 
					</div>
					<div class="lianzheng-bottom">
						<ul style="border-bottom: solid 1px #969696;">
							<c:forEach var="focusnews" items="${focusnewsList}">
							<li><a href="${ctx}/article/${focusnews.id}?type=3" target="_blank" title="${focusnews.title}">
								<c:if test="${fn:length(focusnews.title) > 20}">
									${fn:substring(focusnews.title, 0, 20)}...
								</c:if>
								<c:if test="${fn:length(focusnews.title) <= 20}">
									${focusnews.title}
								</c:if>
							</a> </li>
							</c:forEach>
						</ul>
						<ul style="padding-top: 0;">
							<c:forEach var="focusnews" items="${focusnewsList2}">
							<li><a href="${ctx}/article/${focusnews.id}?type=3" target="_blank" title="${focusnews.title}">
								<c:if test="${fn:length(focusnews.title) > 20}">
									${fn:substring(focusnews.title, 0, 20)}...
								</c:if>
								<c:if test="${fn:length(focusnews.title) <= 20}">
									${focusnews.title}
								</c:if>
							</a> </li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!-- 专题集锦 -->
				<div class="zhuanti-box">
					<div class="common-box-top" style="padding-top:9px;">
						<a href="" target="_blank">专题集锦</a>
						<a class="currentD" href="column?type=7" target="_blank">更多+</a>
					</div>
					<div class="img-box">
						<c:forEach var="topic" items="${topicList}">
							<a href="column?type=7&topicId=${topic.id}" target="_blank">
								<img src="${ctx}${topic.imagePath}" class="limg" width="420" height="70">
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
			
			<div class="banner-three">
				<!-- 曝光台 -->
				<div class="puguang-box">
					<div class="common-box-top" style="padding-top:9px;">
						<a href="column?type=4" target="_blank">曝光台</a>
						<a class="currentD" href="column?type=4" target="_blank">更多+</a>
					</div>
					<div class="puguang-bottom">
						<ul>
							<c:forEach var="exposure" items="${exposureList}">
							<li><a href="${ctx}/article/${exposure.id}?type=4" target="_blank" title="${exposure.title}">
								<c:if test="${fn:length(exposure.title) > 20}">
									${fn:substring(exposure.title, 0, 20)}...
								</c:if>
								<c:if test="${fn:length(exposure.title) <= 20}">
									${exposure.title}
								</c:if>
							</a> </li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!-- 信访举报 -->
				<div class="xinfang-box">
					<div class="common-box-top" style="padding-top:9px;">
						<a href="" target="_blank">举报</a>
					</div>
					<div class="jb-box">
						<a href="${ctx}/report/guide" target="_blank"><img src="${ctx}/img/jbzn.png" style="float: left; margin-right:5px;"></a>
						<a href="${ctx}/report/JBXZ" target="_blank"><img src="${ctx}/img/wyjb.png"></a>
						<img class="jb-fs" src="${ctx}/img/jbfs.png" style="margin-top: 5px;">
						<div style="margin-top: -121px; color: #ffffff; padding: 18px; font-size: 15px;">
							<ul>
								<li><a href="${ctx}/report/index" target="_blank" style="color: #FFEB3B;">网络举报（${ctx}/report/index）</a></li>
								<li>手机信息举报：13870412388 </li>
								<li>举报电话：（0794）12388 </li>
								<li>来信请寄：江西省广昌县纪委信访室、江西省广昌县纪委007邮箱（免邮资）</li>
							</ul>
						</div>
				  </div>
				</div>
			</div>
			
			<div class="banner-four">
				<!-- 工作动态 -->
				<div class="common-box-top">
					<a href="column?ptype=dynamic&type=8" target="_blank">工作动态</a>
				</div>
				<div class="bottom-nav-container">
			        <div class="left-nav">
						<div class="banner-four-nav">
				            <div class="banner-four-leftnav">
								<a id="news1" onmouseover="news_change('left', 1)" class="currentH" href="column?ptype=dynamic&type=8" target="_blank" style="margin-right: 20px;">党风政风</a> 
								<a id="news2" onmouseover="news_change('left', 2)" href="column?ptype=dynamic&type=9" target="_blank" style="margin-right: 20px;">纪律审查</a> 
								<a id="news3" onmouseover="news_change('left', 3)" href="column?ptype=dynamic&type=10" target="_blank" style="margin-right: 20px;" class="">巡查工作</a>
								<a class="currentI" href="" target="_blank"></a> 
							</div>
							<!-- 党风政风 -->
							<div id="newscon1" style="display: block;">
								<a class="currentJ" href="${ctx}/article/${dynamicParty.id}?type=8" target="_blank">
									<c:if test="${fn:length(dynamicParty.title) > 20}">
										${fn:substring(dynamicParty.title, 0, 20)}...
									</c:if>
									<c:if test="${fn:length(dynamicParty.title) <= 20}">
										${dynamicParty.title}
									</c:if>
								</a>
								<ul>
									<c:forEach var="i" begin="1" end="${fn:length(dynamicPartyList)}">
									<li><a href="${ctx}/article/${dynamicPartyList[i].id}?type=8" target="_blank" title="${dynamicPartyList[i + 1].title}">
										<c:if test="${fn:length(dynamicPartyList[i].title) > 20}">
											${fn:substring(dynamicPartyList[i].title, 0, 20)}...
										</c:if>
										<c:if test="${fn:length(dynamicPartyList[i].title) <= 20}">
											${dynamicPartyList[i].title}
										</c:if>
									</a> </li>
									</c:forEach>
								</ul>
								<span class="js_more"><a class="currentD" href="column?ptype=dynamic&type=8" target="_blank" style="color:black">更多&gt;&gt;</a></span>
							</div>
							<!-- 纪律审查 -->
				      		<div id="newscon2" style="display: none;">
								<a class="currentJ" href="${ctx}/article/${dynamicExamine.id}?type=9" target="_blank">
									<c:if test="${fn:length(dynamicExamine.title) > 20}">
										${fn:substring(dynamicExamine.title, 0, 20)}...
									</c:if>
									<c:if test="${fn:length(dynamicExamine.title) <= 20}">
										${dynamicExamine.title}
									</c:if>
								</a>
								<ul>
									<c:forEach var="i" begin="1" end="${fn:length(dynamicExamineList)}">
									<li><a href="${ctx}/article/${dynamicExamineList[i].id}?type=9" target="_blank" title="${dynamicExamineList[i].title}">
										<c:if test="${fn:length(dynamicExamineList[i].title) > 20}">
											${fn:substring(dynamicExamineList[i].title, 0, 20)}...
										</c:if>
										<c:if test="${fn:length(dynamicExamineList[i].title) <= 20}">
											${dynamicExamineList[i].title}
										</c:if>
									</a> </li>
									</c:forEach>
								</ul>
								<span class="js_more"><a class="currentD" href="column?ptype=dynamic&type=9" target="_blank" style="color:black">更多&gt;&gt;</a></span>
				      		</div>
				      		<!-- 巡查工作 -->
				      		<div id="newscon3" style="display: none;">
								<a class="currentJ" href="${ctx}/article/${dynamicExamine.id}?type=9" target="_blank">
									<c:if test="${fn:length(dynamicExamine.title) > 20}">
										${fn:substring(dynamicExamine.title, 0, 20)}...
									</c:if>
									<c:if test="${fn:length(dynamicExamine.title) <= 20}">
										${dynamicExamine.title}
									</c:if>
								</a>
								<ul>
									<c:forEach var="i" begin="1" end="${fn:length(dynamicPatrolList)}">
									<li><a href="${ctx}/article/${dynamicPatrolList[i].id}?type=10" target="_blank" title="${dynamicPatrolList[i].title}">
										<c:if test="${fn:length(dynamicPatrolList[i].title) > 20}">
											${fn:substring(dynamicPatrolList[i].title, 0, 20)}...
										</c:if>
										<c:if test="${fn:length(dynamicPatrolList[i].title) <= 20}">
											${dynamicPatrolList[i].title}
										</c:if>
									</a> </li>
									</c:forEach>
								</ul>
								<span class="js_more"><a class="currentD" href="column?ptype=dynamic&type=10" target="_blank" style="color:black">更多&gt;&gt;</a></span>
				      		</div>
						</div>
			        </div>
			        <div class="right-nav">
						<div class="banner-four-nav">
				            <div class="banner-four-leftnav"> 
				            	<a id="news1" onmouseover="news_change('right', 1)" href="column?ptype=dynamic&type=13" target="_blank" style="margin-right: 40px;" class="">信息公开</a>
								<a id="news2" onmouseover="news_change('right', 2)" class="currentH" href="column?ptype=dynamic&type=11" target="_blank" style="margin-right: 40px;">宣传工作</a> 
								<a id="news3" onmouseover="news_change('right', 3)" href="column?ptype=dynamic&type=12" target="_blank" style="margin-right: 40px;" class="">队伍建设</a> 
								<a class="currentI" href="" target="_blank"></a> 
							</div>
							<!-- 信息公开 -->
							<div id="newscon1" style="display: none;">
								<a class="currentJ" href="${ctx}/article/${dynamiInfo.id}?type=13" target="_blank">
								<c:if test="${fn:length(dynamiInfo.title) > 20}">
									${fn:substring(dynamiInfo.title, 0, 20)}...
								</c:if>
								<c:if test="${fn:length(dynamiInfo.title) <= 20}">
									${dynamiInfo.title}
								</c:if>
								</a>
								<ul>
									<c:forEach var="i" begin="1" end="${fn:length(dynamiInfoList)}">
									<li><a href="${ctx}/article/${dynamiInfoList[i].id}?type=13" target="_blank" title="${dynamiInfoList[i].title}">
										<c:if test="${fn:length(dynamiInfoList[i].title) > 20}">
											${fn:substring(dynamiInfoList[i].title, 0, 20)}...
										</c:if>
										<c:if test="${fn:length(dynamiInfoList[i].title) <= 20}">
											${dynamiInfoList[i].title}
										</c:if>
									</a> </li>
									</c:forEach>
								</ul>
								<span class="js_more"><a class="currentD" href="column?ptype=dynamic&type=11" target="_blank" style="color:black">更多&gt;&gt;</a></span>
							</div>
							<!-- 宣传工作 -->
							<div id="newscon2" style="display: block;">
								<a class="currentJ" href="${ctx}/article/${dynamicPublic.id}?type=11" target="_blank">
								<c:if test="${fn:length(dynamicPublic.title) > 20}">
									${fn:substring(dynamicPublic.title, 0, 20)}...
								</c:if>
								<c:if test="${fn:length(dynamicPublic.title) <= 20}">
									${dynamicPublic.title}
								</c:if>
								</a>
								<ul>
									<c:forEach var="i" begin="1" end="${fn:length(dynamicPublicList)}">
									<li><a href="${ctx}/article/${dynamicPublicList[i].id}?type=11" target="_blank" title="${dynamicPublicList[i].title}">
										<c:if test="${fn:length(dynamicPublicList[i].title) > 20}">
											${fn:substring(dynamicPublicList[i].title, 0, 20)}...
										</c:if>
										<c:if test="${fn:length(dynamicPublicList[i].title) <= 20}">
											${dynamicPublicList[i].title}
										</c:if>
									</a> </li>
									</c:forEach>
								</ul>
								<span class="js_more"><a class="currentD" href="column?ptype=dynamic&type=11" target="_blank" style="color:black">更多&gt;&gt;</a></span>
							</div>
							<!-- 队伍建设 -->
							<div id="newscon3" style="display: none;">
								<a class="currentJ" href="${ctx}/article/${dynamicTeam.id}?type=11" target="_blank">
								<c:if test="${fn:length(dynamicTeam.title) > 20}">
									${fn:substring(dynamicTeam.title, 0, 20)}...
								</c:if>
								<c:if test="${fn:length(dynamicTeam.title) <= 20}">
									${dynamicTeam.title}
								</c:if>
								</a>
								<ul>
									<c:forEach var="i" begin="1" end="${fn:length(dynamicTeamList)}">
									<li><a href="${ctx}/article/${dynamicTeamList[i].id}?type=11" target="_blank" title="${dynamicTeamList[i].title}">
										<c:if test="${fn:length(dynamicTeamList[i].title) > 20}">
											${fn:substring(dynamicTeamList[i].title, 0, 20)}...
										</c:if>
										<c:if test="${fn:length(dynamicTeamList[i].title) <= 20}">
											${dynamicTeamList[i].title}
										</c:if>
									</a> </li>
									</c:forEach>
								</ul>
								<span class="js_more"><a class="currentD" href="column?ptype=dynamic&type=11" target="_blank" style="color:black">更多&gt;&gt;</a></span>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="banner-h">
				<img class="rimg" src="${ctx}/img/hf.gif">
			</div>
			
			<div class="banner-five">
				<!-- 党纪法规 -->
				<div class="dangji-box">
					<div class="common-box-top" style="padding-top:9px;">
						<a href="column?type=5" target="_blank">党纪法规</a>
						<a class="currentD" href="column?type=5" target="_blank">更多+</a>
					</div>
					<div class="dangji-bottom">
						<ul>
							<c:forEach var="policy" items="${policyList}">
							<li><a href="${ctx}/article/${policy.id}?type=5" target="_blank" title="${policy.title}">
								<c:if test="${fn:length(policy.title) > 20}">
									${fn:substring(policy.title, 0, 20)}...
								</c:if>
								<c:if test="${fn:length(policy.title) <= 20}">
									${policy.title}
								</c:if>
							</a> </li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!-- 莲廉文化 -->
				<div class="lianlian-box">
					<div class="common-box-top" style="padding-top:9px;">
						<a href="column?type=6" target="_blank">莲廉文化</a>
						<a class="currentD" href="column?type=6" target="_blank">更多+</a>
					</div>
					<div class="lianlian-bottom">
						<ul>
							<c:forEach var="culture" items="${cultureList}">
							<li><a href="${ctx}/article/${culture.id}?type=6" target="_blank" title="${culture.title}">
								<c:if test="${fn:length(culture.title) > 20}">
									${fn:substring(culture.title, 0, 20)}...
								</c:if>
								<c:if test="${fn:length(culture.title) <= 20}">
									${culture.title}
								</c:if>
							</a> </li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="banner-link">
				<div class="common-box-top"> 
					<a href="" target="_blank">网站链接</a> 
				</div>
				<div class="lianjie-nav">
					<a id="ch_0" class="currentP" href="javascript:void(0);" target="_blank">全国各省市纪委网站</a>
					<a id="ch_1" href="javascript:void(0);" target="_blank" class="">全省各设区市纪委网站</a>
					<a id="ch_2" href="javascript:void(0);" target="_blank" class="">全市各县区纪委网站</a>
					<a id="ch_3" href="javascript:void(0);" target="_blank" class="">市直各部门官方网站</a>
				</div>
				<div class="city">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" style="display: none;">
						<tbody>
							<tr>
								<td>  
									<span><a href="http://www.bjsupervision.gov.cn/" target="_blank">北京市</a></span>
									<span><a href="http://www.shjcw.gov.cn/" target="_blank">上海市</a></span>
									<span><a href="http://www.gdjct.gd.gov.cn/" target="_blank">广东省</a></span>
									<span><a href="http://www.zjsjw.gov.cn/" target="_blank">浙江省</a></span>
									<span><a href="http://www.jssjw.gov.cn/" target="_blank">江苏省</a></span>
									<span><a href="http://www.sxdi.gov.cn/" target="_blank">山西省</a></span>
									<span><a href="http://www.qlgov.org/pd/sanxi/" target="_blank">陕西省</a></span>
									<span><a href="http://www.hebcdi.gov.cn/" target="_blank">河北省</a></span>
									<span><a href="http://www.hnsjct.gov.cn/" target="_blank">河南省</a></span>
									<span><a href="http://www.hbjwjc.gov.cn/" target="_blank">湖北省</a></span>
									<span><a href="http://www.sxfj.gov.cn/" target="_blank">湖南省</a></span>
									<span><a href="http://www.lnsjjjc.gov.cn/" target="_blank">辽宁省</a></span>
									<span><a href="http://www.mirror.gov.cn/" target="_blank">山东省</a></span>
									<span><a href="http://www.fjjc.gov.cn/" target="_blank">福建省</a></span>
									<span><a href="http://www.scjc.gov.cn/" target="_blank">四川省</a></span>
									<span><a href="http://www.cnfxj.org/" target="_blank">中国反邪教网</a></span>
									<span><a href="http://www.kaiwind.com/" target="_blank">凯风网</a></span>
								</td>
							</tr>
						</tbody>
					</table>
					
					<table width="100%" border="0" cellpadding="0" cellspacing="0" style="display: block;">
						<tbody>
							<tr>
								<td>
									<span><a href="http://nclz.nc.gov.cn/" target="_blank">南昌市</a></span>
									<span><a href="http://www.jjlx.gov.cn/" target="_blank">九江市</a></span>
									<span><a href="http://www.pxql.gov.cn/" target="_blank">萍乡市</a></span>
									<span><a href="http://www.xylz.gov.cn/" target="_blank">新余市</a></span>
									<span><a href="http://www.ytlz.gov.cn/" target="_blank">鹰潭市</a></span>
									<span><a href="http://www.gzjj.gov.cn/" target="_blank">赣州市</a></span>
									<span><a href="http://www.ycjjjc.gov.cn/" target="_blank">宜春市</a></span>
									<span><a href="http://www.srlz.gov.cn/" target="_blank">上饶市</a></span>
									<span><a href="http://www.jadi.gov.cn/" target="_blank">吉安市</a></span>
									<span><a href="http://www.jdzdi.gov.cn/" target="_blank">景德镇市</a></span>
									<span><a href="http://www.ganyunwang.com/" target="_blank">赣韵网</a></span>
								</td>
							</tr>
						</tbody>
					</table>
					
					<table width="100%" border="0" cellpadding="0" cellspacing="0" style="display: none;">
						<tbody>
							<tr>
								<td>
									<span><a href="http://www.lcqlzw.com/" target="_blank">临川区</a></span>
									<span><a href="http://www.dxlzw.com/" target="_blank">东乡区</a></span>
									<span><a href="http://jxnclzw.gov.cn/" target="_blank">南城县</a></span>
									<span><a href="http://www.jdlzw.cn/" target="_blank">南丰县</a></span>
									<span><a href="http://www.jxgc.gov.cn/gcjj/" target="_blank">广昌县</a></span>
									<span><a href="http://www.jxxlzw.com/" target="_blank">金溪县</a></span>
									<span><a href="http://www.zxxlzw.com/" target="_blank">资溪县</a></span>
									<span><a href="http://www.lcxlz.gov.cn/index.html" target="_blank">黎川县</a></span>
									<span><a href="http://jw.jxcr.gov.cn/" target="_blank">崇仁县</a></span>
									<span><a href="http://yhlzw.jxyh.gov.cn/index.html" target="_blank">宜黄县</a></span>
									<span><a href="http://www.jxlean.gov.cn/lzw/" target="_blank">乐安县</a></span>
								</td>
							</tr>
						</tbody>
					</table>
					
					<table width="100%" border="0" cellpadding="0" cellspacing="0" style="display: none;">
						<tbody>
							<tr>
								<td>
									<span><a href="http://www.fzdj.gov.cn/" target="_blank">市委组织部</a></span>
									<span><a href="http://www.zgfznews.com/" target="_blank">市委宣传部</a></span>
									<span><a href="http://www.jxfzgaj.gov.cn" target="_blank">市公安局</a></span>
									<span><a href="http://fzzy.chinacourt.org/index.shtml" target="_blank">市法院</a></span>
									<span><a href="http://www.jxfuzhou.jcy.gov.cn" target="_blank">市检察院</a></span>
									<span><a href="http://sjj.jxfz.gov.cn/" target="_blank">市审计局</a></span>
									<span><a href="http://czj.jxfz.gov.cn/" target="_blank">市财政局</a></span>
									<span><a href="http://www.fzjsj.gov.cn/" target="_blank">市建设局</a></span>
									<span><a href="http://www.fzdpc.gov.cn/" target="_blank">市发改委</a></span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="lianjie-img" style="height: 40px;">
					<img src="${ctx}/img/zhengfu-2.png" style="cursor:pointer;width: 405px;" onclick="window.open('http://www.ccdi.gov.cn/')">
					<a href="http://www.jxlz.gov.cn/" target="_blank" style=" width: 400px;float: right;"><img src="${ctx}/img/jxlz.jpg" style="cursor:pointer;width: 400px;"></a>
				</div>
			</div>
			
			<%@ include file="/WEB-INF/template/footer.jsp"%>
			
		</div>
	</div>
	
	<div style="position: fixed;right: 2px;bottom: 222px;">
		<img src="${ctx}/img/qrcode.png" alt="无" width="100" height="100"/>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/slideBox/jquery.slideBox.js"></script>
	
	<script>
	;(function() {
		var $page = $('.body-index');
		// 图片新闻
		$page.find('.slideBox').slideBox({
			duration: 1,		//滚动持续时间，单位：秒
			easing: 'linear',	//swing,linear滚动特效
			delay: 3,			//滚动延迟时间，单位：秒
			clickBarRadius: 1
		});
		$page
		.on('mouseover', '.lianjie-nav a', function() {
			var $this = $(this);
			$page.find('.lianjie-nav a').removeClass('currentP');
			$this.addClass('currentP');
			$page.find('.city').find('table').css('display', 'none');
			$page.find('.city').find('table').eq($this.attr("id").split("_")[1]).css('display', 'block');
		})
		
	})();
	
	function  news_change(side, k){
	   for(var i=0;i<10;i++){
		   if($('.'+side+'-nav #newscon'+i).length != 0){
			   $('.'+side+'-nav #newscon'+i).css('display', 'none');
		   }
		   if($('.'+side+'-nav #news'+i).length != 0){
			   $('.'+side+'-nav #news'+i).removeClass('currentH');
		   }
	   }
	   $('.'+side+'-nav #newscon'+k).css('display', 'block');
	   $('.'+side+'-nav #news'+k).addClass('currentH');
	}
	</script>
	
</body>
</html>
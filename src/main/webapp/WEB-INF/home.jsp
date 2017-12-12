<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	
	<title>广昌县纪委监察局  | 后台管理</title>
	<meta name="keywords" content="">
    <meta name="description" content="">

	<link rel="shortcut icon" href="favicon.ico">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">

</head>

<body class="fixed-sidebar full-height-layout gray-bg body-home" style="overflow: hidden">
	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse">
				<ul class="nav" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element">
							<span><img alt="image" class="img-circle" src="${ctx}/img/home-avatar.png" width="64" height="64"/></span>
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<span class="clear">
									<span class="block m-t-xs"><strong class="font-bold user-name">${user.username}</strong></span>
									<span class="block text-muted text-xs">管理员<b class="caret"></b></span>
								</span>
							</a>
							<ul class="dropdown-menu animated fadeInRight m-t-xs">
								<li><a class="J_menuItem" href="modifyPassword">修改密码</a></li>
								<li class="divider"></li>
								<li><a class="btn-logout" href="javascript:;">退出</a></li>
							</ul>
						</div>
					</li> 
					<li>
						<a class="J_menuItem" href="overview">
							<i class="fa fa-home fa-fw"></i><span class="nav-label">网站概况</span>
						</a>
					</li>
					<li>
						<a class="J_menuItem" href="userList">
							<i class="fa fa-users fa-fw"></i><span class="nav-label">用户管理</span>
						</a>
					</li>
					<li>
						<a class="J_menuItem" href="setting">
							<i class="fa fa-cog fa-fw"></i><span class="nav-label">系统设置</span>
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-globe fa-fw"></i><span class="nav-label">网站管理</span><span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="articleList?type=0">通知公告</a></li>
							<li><a class="J_menuItem" href="articleList?type=1">图片新闻</a></li>
							<li><a class="J_menuItem" href="articleList?type=3">廉情在线</a></li>
							<li><a class="J_menuItem" href="topicList">专题集锦</a></li>
							<li><a class="J_menuItem" href="articleList?type=4">曝光台</a></li>
							<li><a class="J_menuItem" href="dynamicList">工作动态</a></li>
							<li><a class="J_menuItem" href="articleList?type=5">党纪法规</a></li>
							<li><a class="J_menuItem" href="articleList?type=6">莲廉文化</a></li>
						</ul>
					</li>
				<!-- <li>
						<a href="#">
							<i class="fa fa-edit fa-fw"></i><span class="nav-label">举报管理</span><span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="reportList">网络举报</a></li>
							<li><a class="J_menuItem" href="mailList">书记信箱</a></li>
						</ul>
					</li> -->
					<li>
						<a href="#">
							<i class="fa fa-user-circle-o fa-fw"></i><span class="nav-label">个人中心</span><span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="modifyPassword">修改密码</a></li>
						</ul>
					</li>					
				</ul>
			</div>
		</nav>
		<!--左侧导航结束-->
		
		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0;">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i></a>
                        <div style="padding: 16px; font-size: 18px; font-weight: 400;">广昌县纪委监察局后台管理页面</div>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                    	<li><a href="index" target="_blank"><i class="fa fa-home fa-fw"></i>网站首页</a></li>
                    </ul>
				</nav>
			</div>
			
			<div class="row content-tabs">
				<!-- tab往左 -->
				<button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward fa-fw"></i></button>
				<!-- tab列表 -->
				<nav class="page-tabs J_menuTabs">
					<div class="page-tabs-content">
						<a href="javascript:;" class="active J_menuTab" data-id="overview">网站概况</a>
					</div>
				</nav>
				<!-- tab往右 -->
				<button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward fa-fw"></i></button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span></button>
					<ul class="dropdown-menu dropdown-menu-right" role="menu">
						<li class="J_tabShowActive"><a>定位当前选项卡</a>
						</li>
						<li class="divider"></li>
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a>
						</li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a>
						</li>
					</ul>
				</div>
				 <a href="javascript:;" class="roll-nav roll-right J_tabExit btn-logout"><i class="fa fa-sign-out fa-fw"></i>退出</a>
			</div>
			
			<!-- 主窗口 -->
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="overview" frameborder="0" data-id="overview" seamless></iframe>
			</div>
			
			<!-- footer -->
			<div class="footer">
				<div class="pull-left">中共广昌县纪律检查委员会</div>
				<div class="pull-right"></div>
			</div>
		</div>
		<!--右侧部分结束-->
		
	</div>

	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/metisMenu/metisMenu.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/layer/layer.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/hplus.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/contabs.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/pace/pace.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/jquery.session.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript">
	
	var $page = $('.body-home');
	var userId = '${user.id}';
	
	$page
	.on('click', '.btn-logout', function() {
		$.ajax({
			url: '${ctx}/api/user/logout',
			success: function() {
				window.location.href = "./login";
			},
			error: function() {}
		});
	});
	
	function open(menu) {
		$page.find('a[href="' + menu + '"]').trigger('click');
	}
	
	</script>
	
</body>
</html>
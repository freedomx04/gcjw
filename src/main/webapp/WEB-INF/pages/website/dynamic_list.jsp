<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${enterprise.name}</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-dynamic-list">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="tabs-container">
					<ul class="nav nav-tabs nav-tabs-line">
						<li class="active">
							<a data-toggle="tab" href="#dynamic-party" data-tab="party" aria-expanded="true">党风政风</a>
						</li>
						<li>
							<a data-toggle="tab" href="#dynamic-examine" data-tab="examine" aria-expanded="true">纪律审查</a>
						</li>
						<li>
							<a data-toggle="tab" href="#dynamic-patrol" data-tab="patrol" aria-expanded="true">巡查工作</a>
						</li>
						<li>
							<a data-toggle="tab" href="#dynamic-public" data-tab="public" aria-expanded="true">宣传工作</a>
						</li>
						<li>
							<a data-toggle="tab" href="#dynamic-team" data-tab="team" aria-expanded="true">队伍建设</a>
						</li>
						<li>
							<a data-toggle="tab" href="#dynamic-basic" data-tab="basic" aria-expanded="true">基层风采</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="dynamic-party" class="tab-pane active">
							<div class="panel-body">
								<div class="btn-group hidden-xs" id="toolbar-dynamic-party" role="group">
				 					<button type="button" class="btn btn-white btn-article-add"><i class="fa fa-plus fa-fw"></i>新增</button>
				 					<button type="button" class="btn btn-white btn-article-delete-batch" disabled='disabled'><i class="fa fa-trash-o fa-fw"></i>批量删除</button>
				 				</div>
				 				<table id="table-dynamic-party" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="dynamic-examine" class="tab-pane">2</div>
						
						<div id="dynamic-patrol" class="tab-pane">4</div>
						
						<div id="dynamic-public" class="tab-pane">5</div>
						
						<div id="dynamic-team" class="tab-pane">6</div>
						
						<div id="dynamic-basic" class="tab-pane">7</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
     
    <script type="text/javascript">
    
    	var $page = $('.body-dynamic-list');
    	var tab = Url.queryString('tab');
    	if (!tab) {
    		tab = 'dynamic-party';
    	}
    	$page.find('a[data-tab="' + tab + '"]').tab('show');
    	
    	
    
    </script>
    
</body>
</html>
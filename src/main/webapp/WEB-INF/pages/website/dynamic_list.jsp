<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>工作动态</title>
	
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
							<a data-toggle="tab" href="#dynamic-patrol" data-tab="patrol" aria-expanded="true">巡察工作</a>
						</li>
						<li>
							<a data-toggle="tab" href="#dynamic-info" data-tab="info" aria-expanded="true">信息公开</a>
						</li>
						<li>
							<a data-toggle="tab" href="#dynamic-public" data-tab="public" aria-expanded="true">宣传工作</a>
						</li>
						<li>
							<a data-toggle="tab" href="#dynamic-team" data-tab="team" aria-expanded="true">队伍建设</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="dynamic-party" class="tab-pane active">
							<div class="panel-body">
								<div class="btn-group" id="toolbar-dynamic-party" role="group">
				 					<button type="button" class="btn btn-white btn-article-add"><i class="fa fa-plus fa-fw"></i>新增</button>
				 					<button type="button" class="btn btn-white btn-article-delete-batch" disabled='disabled'><i class="fa fa-trash-o fa-fw"></i>批量删除</button>
				 				</div>
				 				<table id="table-dynamic-party" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="dynamic-examine" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group" id="toolbar-dynamic-examine" role="group">
				 					<button type="button" class="btn btn-white btn-article-add"><i class="fa fa-plus fa-fw"></i>新增</button>
				 					<button type="button" class="btn btn-white btn-article-delete-batch" disabled='disabled'><i class="fa fa-trash-o fa-fw"></i>批量删除</button>
				 				</div>
				 				<table id="table-dynamic-examine" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="dynamic-patrol" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group" id="toolbar-dynamic-patrol" role="group">
				 					<button type="button" class="btn btn-white btn-article-add"><i class="fa fa-plus fa-fw"></i>新增</button>
				 					<button type="button" class="btn btn-white btn-article-delete-batch" disabled='disabled'><i class="fa fa-trash-o fa-fw"></i>批量删除</button>
				 				</div>
				 				<table id="table-dynamic-patrol" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="dynamic-info" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group" id="toolbar-dynamic-info" role="group">
				 					<button type="button" class="btn btn-white btn-article-add"><i class="fa fa-plus fa-fw"></i>新增</button>
				 					<button type="button" class="btn btn-white btn-article-delete-batch" disabled='disabled'><i class="fa fa-trash-o fa-fw"></i>批量删除</button>
				 				</div>
				 				<table id="table-dynamic-info" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="dynamic-public" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group" id="toolbar-dynamic-public" role="group">
				 					<button type="button" class="btn btn-white btn-article-add"><i class="fa fa-plus fa-fw"></i>新增</button>
				 					<button type="button" class="btn btn-white btn-article-delete-batch" disabled='disabled'><i class="fa fa-trash-o fa-fw"></i>批量删除</button>
				 				</div>
				 				<table id="table-dynamic-public" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="dynamic-team" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group" id="toolbar-dynamic-team" role="group">
				 					<button type="button" class="btn btn-white btn-article-add"><i class="fa fa-plus fa-fw"></i>新增</button>
				 					<button type="button" class="btn btn-white btn-article-delete-batch" disabled='disabled'><i class="fa fa-trash-o fa-fw"></i>批量删除</button>
				 				</div>
				 				<table id="table-dynamic-team" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
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
    	var $party = $page.find('#dynamic-party');
    	var $examine = $page.find('#dynamic-examine');
    	var $patrol = $page.find('#dynamic-patrol');
    	var $public = $page.find('#dynamic-public');
    	var $team = $page.find('#dynamic-team');
    	
    	var tab = Url.queryString('tab');
    	if (!tab) {
    		tab = 'party';
    	}
    	$page.find('a[data-tab="' + tab + '"]').tab('show');
    	initTable(tab);
    	
    	var $table, $toolbar, type, $bsTable;
    	function initTable(tab) {
    		switch (tab) {
    		case 'party':	
    			type = '8';	
    			$table = $page.find('#table-dynamic-party');
    			$toolbar = $page.find('#toolbar-dynamic-party');
    			break;
    		case 'examine':	
    			type = '9';
    			$table = $page.find('#table-dynamic-examine');
    			$toolbar = $page.find('#toolbar-dynamic-examine');
    			break;
    		case 'patrol':	
    			type = '10';	
    			$table = $page.find('#table-dynamic-patrol');
    			$toolbar = $page.find('#toolbar-dynamic-patrol');
    			break;
    		case 'public':	
    			type = '11';
    			$table = $page.find('#table-dynamic-public');
    			$toolbar = $page.find('#toolbar-dynamic-public');
    			break;
    		case 'team':
    			type = '12';
    			$table = $page.find('#table-dynamic-team');
    			$toolbar = $page.find('#toolbar-dynamic-team');
    			break;
    		case 'info':
    			type = '13';
    			$table = $page.find('#table-dynamic-info');
    			$toolbar = $page.find('#toolbar-dynamic-info');
    		default:		
    			break;
    		}
    		
    		$bsTable = $k.util.bsTable($table, {
    			url: '${ctx}/api/article/list?type=' + type,
    			toolbar: $toolbar,
    			idField: 'id',
    			responseHandler: function(res) {
    				return res.data;
    			},
    			columns: [{
    				field: 'state',
    				checkbox: true
    			}, {
    				field: 'title',
    				title: '标题',
    				align: 'center'
    			}, {
    				field: 'updateTime',
    				title: '修改时间',
    				align: 'center',
    				formatter: formatDate2
    			}, {
    				title: '操作',
    				align: 'center',
    				formatter: function(value, row,  index) {
    					var $detail = '<a class="btn-article-detail a-operate">详情</a>';
    					var $edit = '<a class="btn-article-edit a-operate">编辑</a>';
    					var $delete = '<a class="btn-article-delete a-operate">删除</a>';
    					return $detail + $edit + $delete;
    				},
    				events: window.operateEvents = {
    					'click .btn-article-detail': function(e, value, row, index) {
    						e.stopPropagation();
    						window.location.href = './articleGet?articleId=' + row.id;
    					},
    					'click .btn-article-edit': function(e, value, row, index) {
    						e.stopPropagation();
    						window.location.href = './articleAdd?type=' + type + '&method=edit&articleId=' + row.id;
    					},
    					'click .btn-article-delete': function(e, value, row, index) {
    						e.stopPropagation();
    						swal({
    							title: '',
    							text: '确定删除选中记录',
    							type: 'warning',
    							showCancelButton: true,
    							cancelButtonText: '取消',
    							confirmButtonColor: '#DD6B55',
    							confirmButtonText: '确定',
    							closeOnConfirm: false
    						}, function() {
    							var articleId = row.id;
    							$.ajax({
    								url: '${ctx}/api/article/delete',
    								data: { 
    									articleId: articleId
    								},
    								success: function(ret) {
    									if (ret.code == '0') {
    										swal('', '删除成功!', 'success');
    									} else {
    										swal('', ret.msg, 'error');
    									}
    									$bsTable.bootstrapTable('refresh'); 
    								},
    								error: function(err) {}
    							});
    						});
    					}
    				}
    			}]
    		});
    		
    		$bsTable.on('all.bs.table', function(e, row) {
    			var selNum = $table.bootstrapTable('getSelections').length;
    			selNum > 0 ? $page.find('.btn-article-delete-batch').removeAttr('disabled') : $page.find('.btn-article-delete-batch').attr('disabled', 'disabled');
    		});
    	}
    	
    	$page
    	.on('click', 'a[data-toggle="tab"]', function() {
    		var tab = $(this).data('tab');
    		Url.updateSearchParam('tab', tab);
    		initTable(tab);
    	})
    	.on('click', '.btn-article-add', function() {
    		window.location.href = '${ctx}/articleAdd?method=add&type=' + type;
    	})
    	.on('click', '.btn-article-delete-batch', function() {
			swal({
				title: '',
				text: '确定批量删除选中记录',
				type: 'warning',
				showCancelButton: true,
				cancelButtonText: '取消',
				confirmButtonColor: '#DD6B55',
				confirmButtonText: '确定',
				closeOnConfirm: false
			}, function() {
				var rows = $table.bootstrapTable('getSelections');
				$.ajax({
					url: '${ctx}/api/article/batchDelete',
					data: {
						articleIdList: $k.util.getIdList(rows) 
					},
					success: function(ret) {
						if (ret.code == '0') {
							swal('', '删除成功!', 'success');
						} else {
							swal('', ret.msg, 'error');
						}
						$bsTable.bootstrapTable('refresh');
					},
					error: function(err) {}
				});
			});
		});
    
    </script>
    
</body>
</html>
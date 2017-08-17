<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>专题集锦</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-topic-list">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
	 		<div class="ibox-title">
	 			<h5>专题集锦</h5>
	 		</div>
	 		<div class="ibox-content">
 				<div class="btn-group hidden-xs" id="topic-list-table-toolbar" role="group">
 					<button type="button" class="btn btn-white btn-topic-add"><i class="fa fa-plus fa-fw"></i>新增</button>
 					<button type="button" class="btn btn-white btn-topic-delete-batch" disabled='disabled'><i class="fa fa-trash-o fa-fw"></i>批量删除</button>
 				</div>
 				<table id="topic-list-table" class="table-hm" data-mobile-responsive="true"></table>
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
    
    	var $page = $('.body-topic-list');
    	
    	var $table = $k.util.bsTable($page.find('#topic-list-table'), {
    		url: '${ctx}/api/topic/list',
    		toolbar: '#topic-list-table-toolbar',
    		idField: 'id',
			responseHandler: function(res) {
				return res.data;
			},
			columns: [{
				field: 'state',
				checkbox: true
			}, {
				field: 'imagePath',
				title: '专题图片',
				align: 'center',
				formatter: function(value, row, index) {
					return '<img src="${ctx}' + value + '" style="width: 420px; height: 70px;">';
				}
			}, {
				field: 'title',
				title: '专题名称',
				align: 'center'
			}, {
				title: '操作',
				align: 'center',
				formatter: function(value, row, index) {
					var $detail = '<a class="btn-topic-detail a-operate">专题文章</a>';
					var $edit = '<a class="btn-topic-edit a-operate">编辑</a>';
					var $delete = '<a class="btn-topic-delete a-operate">删除</a>';
					return $detail + $edit + $delete;
				},
				events: window.operateEvents = {
					'click .btn-topic-detail': function(e, value, row, index) {
						e.stopPropagation();
						window.location.href = './topicGet?topicId=' + row.id;
					},
					'click .btn-topic-edit': function(e, value, row, index) {
						e.stopPropagation();
						window.location.href = './topicAdd?method=edit&topicId=' + row.id;
					},
					'click .btn-topic-delete': function(e, value, row, index) {
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
							var topicId = row.id;
							$.ajax({
								url: '${ctx}/api/topic/delete',
								data: { 
									topicId: topicId
								},
								success: function(ret) {
									if (ret.code == '0') {
										swal('', '删除成功!', 'success');
									} else {
										swal('', ret.msg, 'error');
									}
									$table.bootstrapTable('refresh'); 
								},
								error: function(err) {}
							});
						});
					}
				}
			}]
    	});
    	
    	$table.on('all.bs.table', function(e, row) {
			var selNum = $table.bootstrapTable('getSelections').length;
			selNum > 0 ? $page.find('.btn-topic-delete-batch').removeAttr('disabled') : $page.find('.btn-topic-delete-batch').attr('disabled', 'disabled');
		});
    
    	$page
    	.on('click', '.btn-topic-add', function() {
    		window.location.href = '${ctx}/topicAdd?method=add';
    	})
    	.on('click', '.btn-topic-delete-batch', function() {
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
					url: '${ctx}/api/topic/batchDelete',
					data: {
						topicIdList: $k.util.getIdList(rows) 
					},
					success: function(ret) {
						if (ret.code == '0') {
							swal('', '删除成功!', 'success');
						} else {
							swal('', ret.msg, 'error');
						}
						$table.bootstrapTable('refresh');
					},
					error: function(err) {}
				});
			});
		});
    
    </script>
    
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>专题文章</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-topic-detail">
	<div class="wrapper wrapper-content animated fadeInRight">
	 	<div class="ibox float-e-margins">
	 		<div class="ibox-title">
	 			<button type="button" class="btn btn-white btn-topic-back btn-sm"><i class="fa fa-chevron-left fa-fw"></i>专题集锦</button>
	 			<span style="padding-left: 15px; font-size: 16px;">${topic.title}</span>
	 		</div>
	 		
	 		<div class="ibox-content">
 				<div class="btn-group" id="topic-list-table-toolbar" role="group">
 					<button type="button" class="btn btn-white btn-article-add"><i class="fa fa-plus fa-fw"></i>新增</button>
 					<button type="button" class="btn btn-white btn-article-delete-batch" disabled='disabled'><i class="fa fa-trash-o fa-fw"></i>批量删除</button>
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
	
	<script type="text/javascript">
	
		var $page = $('.body-topic-detail');
		var topicId = '${topic.id}'; 
		
		var $table = $k.util.bsTable($page.find('#topic-list-table'), {
			url: '${ctx}/api/article/listByTopicId?topicId=' + topicId,
			toolbar: '#topic-list-table-toolbar',
			idField: 'id',
			responseHandler: function(res) {
				return res.data;
			},
			columns:[{
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
				formatter: function(value, row, index) {
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
						window.location.href = './articleAdd?type=7&method=edit&articleId=' + row.id;
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
			selNum > 0 ? $page.find('.btn-article-delete-batch').removeAttr('disabled') : $page.find('.btn-article-delete-batch').attr('disabled', 'disabled');
		});
		
		$page
		.on('click', '.btn-topic-back', function() {
			window.location.href = '${ctx}/topicList';
		})
		.on('click', '.btn-article-add', function() {
			window.location.href = '${ctx}/articleAdd?method=add&type=7&topicId=' + topicId;
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
						$table.bootstrapTable('refresh');
					},
					error: function(err) {}
				});
			});
		});
		
	</script>
	
</body>
</html>
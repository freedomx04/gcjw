<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${title}</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/iCheck/custom.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">

</head>

<body class="gray-bg body-article-list">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
	 		<div class="ibox-title">
	 			<h5>${title}</h5>
	 		</div>
	 		<div class="ibox-content">
 				<div class="btn-group hidden-xs" id="article-list-table-toolbar" role="group">
 					<button type="button" class="btn btn-white btn-article-add"><i class="fa fa-plus fa-fw"></i>新增</button>
 					<button type="button" class="btn btn-danger btn-article-delete-batch" disabled='disabled'><i class="fa fa-trash-o fa-fw"></i>删除</button>
 				</div>
 				<table id="article-list-table" class="table-hm" data-mobile-responsive="true"></table>
	 		</div>
	 	</div>	
	</div>
	
	<div class="modal" id="modal-topic-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title"><strong>请选择专题</strong></h4>
				</div>
				<div class="modal-body" style="max-height: 400px; overflow: auto;">
					<form class="form-horizontal" role="form" autocomplete="off">
						<div class="form-group">
							<div class="topic-list col-sm-12"></div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
                    <button type="button" class="btn btn-fw btn-white" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-fw btn-primary btn-confirm">确定</button>
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
	<script type="text/javascript" src="${ctx}/plugins/iCheck/icheck.min.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-article-list');
		var type = ${type};
		var $dialog = $page.find('#modal-topic-dialog');
		var $topicList = $dialog.find('.topic-list');
		
		var $table = $k.util.bsTable($page.find('#article-list-table'), {
			url: '${ctx}/api/article/list?type=${type}',
			toolbar: '#article-list-table-toolbar',
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
				align: 'center',
				formatter: function(value, row, index) {
					return '<a class="btn-article-detail">' + value + '</a>';
				},
				events: window.operateEvents = {
					'click .btn-article-detail': function(e, value, row, index) {
						e.stopPropagation();
						window.location.href = './articleGet?articleId=' + row.id;
					}
				}
			}, {
				field: 'updateTime',
				title: '修改时间',
				align: 'center',
				formatter: formatDate2
			}, {
				title: '操作',
				align: 'center',
				formatter: function(value, row, index) {
					var $edit = '<a class="btn-article-edit a-operate">编辑</a>';
					var $delete = '<a class="btn-article-delete a-operate">删除</a>';
					
					var $topic;
					var topicId = row.topicId;
					if (topicId == null) {
						$topic = '<a class="btn-article-topic-add a-operate">加入专题</a>';
					} else {
						$topic = '<a class="btn-article-topic-edit a-operate">变更专题</a>';
					}
					
					return $edit + $topic + $delete;
				},
				events: window.operateEvents = {
					'click .btn-article-edit': function(e, value, row, index) {
						e.stopPropagation();
						window.location.href = './articleAdd?type=${type}&method=edit&articleId=' + row.id;
					},
					'click .btn-article-topic-add': function(e, value, row, index) {
						e.stopPropagation();
						$.ajax({
							url: '${ctx}/api/topic/list',
							success: function(ret) {
								$topicList.empty();
								$topicList.append('<div class="radio i-checks"><label><input type="radio" value="0" name="topicList">&nbsp;无专题</label></div>');
								$.each(ret.data, function(k, val) {
									var option = '<div class="radio i-checks">' + 
													'<label>' + 
														'<input type="radio" value="' + val.id +'" name="topicList">&nbsp;' + val.title + 
													'</label>' +
												'</div>';
									$topicList.append(option);
								});
								$dialog.data('articleId', row.id);
								$page.find(".i-checks").iCheck({
						        	checkboxClass: "icheckbox_square-green", 
						        	radioClass: "iradio_square-green"
						        });
								$dialog.modal('show');
							},
							error: function(err) {}
						});
					},
					'click .btn-article-topic-edit': function(e, value, row, index) {
						e.stopPropagation();
						$.ajax({
							url: '${ctx}/api/topic/list',
							success: function(ret) {
								$topicList.empty();
								$topicList.append('<div class="radio i-checks"><label><input type="radio" value="0" name="topicList">&nbsp;无专题</label></div>');
								$.each(ret.data, function(k, val) {
									var option = '<div class="radio i-checks">' + 
													'<label>' + 
														'<input type="radio" value="' + val.id +'" name="topicList">&nbsp;' + val.title + 
													'</label>' +
												'</div>';
									$topicList.append(option);
								});
								var $radio = $dialog.find('input[value=' + row.topicId + ']');
								$radio.iCheck('check');
								
								$dialog.data('articleId', row.id);
								$page.find(".i-checks").iCheck({
						        	checkboxClass: "icheckbox_square-green", 
						        	radioClass: "iradio_square-green"
						        });
								$dialog.modal('show');
							},
							error: function(err) {}
						});
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
		
		$dialog.on('click', '.btn-confirm', function() {
			var articleId = $dialog.data('articleId');
			var topicId = 0;
			$dialog.find('.i-checks input').each(function() {
				if (true == $(this).is(':checked')) {
					topicId = $(this).attr('value');
				}
			});
			
			$.ajax({
				url: '${ctx}/api/article/topic',
				data: {
					articleId: articleId,
					topicId: topicId
				},
				success: function(ret) {
					if (ret.code == 0) {
         				$dialog.modal('hide');
             			swal('', '加入专题成功!', 'success');
             			$table.bootstrapTable('refresh');
         			} else {
         				swal('', ret.msg, 'error');
         			}
				},
				error: function(err) {}
			});
		});
		
		$page
		.on('click', '.btn-article-add', function() {
			window.location.href = './articleAdd?method=add&type=${type}';
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
		
	})( jQuery );
	</script>
	
</body>
</html>
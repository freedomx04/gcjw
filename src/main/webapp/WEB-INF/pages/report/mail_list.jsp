<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>书记信箱</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">

</head>

<body class="gray-bg body-mail-list">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
	 		<div class="ibox-title">
	 			<h5>书记信箱</h5>
	 		</div>
	 		<div class="ibox-content">
 				<table id="mail-list-table" class="table-hm" data-mobile-responsive="true"></table>
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
	;(function( $ ) {
		
		var $page = $('.body-mail-list');
		
		var $table = $k.util.bsTable($page.find('#mail-list-table'), {
			url: '${ctx}/api/mail/list',
			idField: 'id',
			responseHandler: function(res) {
				return res.data;
			},
			columns:[{
				field: 'code',
				title: '信件查询码',
				align: 'center'
			}, {
				field: 'title',
				title: '信件标题',
				align: 'center'
			}, {
				field: 'updateTime',
				title: '时间',
				align: 'center',
				formatter: formatDate2
			}, {
				field: 'reply',
				title: '回复状态',
				align: 'center',
				formatter: function(value, row, index) {
					if (value == null) {
            			return '<span class="label label-warning">未回复</span>';
            		} else {
            			return '<span class="label label-primary">已回复</span>';
            		}
				}
			}, {
				title: '操作',
				align: 'center',
				formatter: function(value, row, index) {
					var $detail = '<a class="btn-mail-detail a-operate">详情</a>';
					var $reply = '';
					if (row.reply == null) {
						$reply = '<a class="btn-mail-reply a-operate">回复</a>';
					}
					var $delete = '<a class="btn-mail-delete a-operate">删除</a>';
					return $detail + $reply + $delete;
				},
				events: window.operateEvents = {
					'click .btn-mail-detail': function(e, value, row, index) {
						e.stopPropagation();
						window.location.href = '${ctx}/mailGet?mailId=' + row.id;
					},
					'click .btn-mail-reply': function(e, value, row, index) {
						e.stopPropagation();
						window.location.href = '${ctx}/mailReply?mailId=' + row.id;
					},
					'click .btn-mail-delete': function(e, value, row, index) {
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
							var mailId = row.id;
							$.ajax({
								url: '${ctx}/api/mail/delete',
								data: { 
									mailId: mailId
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
			selNum > 0 ? $page.find('.btn-mail-delete-batch').removeAttr('disabled') : $page.find('.btn-mail-delete-batch').attr('disabled', 'disabled');
		});
		
	})( jQuery );
	</script>
	
</body>
</html>
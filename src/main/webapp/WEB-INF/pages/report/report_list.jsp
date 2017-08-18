<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>网络举报</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">

</head>

<body class="gray-bg body-report-list">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
	 		<div class="ibox-title">
	 			<h5>网络举报</h5>
	 		</div>
	 		<div class="ibox-content">
 				<table id="report-list-table" class="table-hm" data-mobile-responsive="true"></table>
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
		
		var $page = $('.body-report-list');
		
		var $table = $k.util.bsTable($page.find('#report-list-table'), {
			url: '${ctx}/api/report/list',
			idField: 'id',
			responseHandler: function(res) {
				return res.data;
			},
			columns:[{
				field: 'code',
				title: '举报查询码',
				align: 'center'
			}, {
				field: 'reportUnit',
				title: '单位名称',
				align: 'center'
			}, {
				field: 'reportName',
				title: '举报人姓名',
				align: 'center'
			}, {
				field: 'type',
				title: '举报类别',
				align: 'center'
			}, {
				field: 'updateTime',
				title: '时间',
				align: 'center',
				formatter: formatDate2
			}, {
				title: '操作',
				align: 'center',
				formatter: function(value, row, index) {
					var $detail = '<a class="btn-report-detail a-operate">详情</a>';
					var $delete = '<a class="btn-report-delete a-operate">删除</a>';
					return $detail + $delete;
				},
				events: window.operateEvents = {
					'click .btn-report-detail': function(e, value, row, index) {
						e.stopPropagation();
						window.location.href = '${ctx}/reportGet?reportId=' + row.id;
					},
					'click .btn-report-delete': function(e, value, row, index) {
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
							var reportId = row.id;
							$.ajax({
								url: '${ctx}/api/report/delete',
								data: { 
									reportId: reportId
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
		
	})( jQuery );
	</script>
	
</body>
</html>
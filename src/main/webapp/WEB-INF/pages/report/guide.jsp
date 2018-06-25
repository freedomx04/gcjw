<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>举报指南</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote-bs3.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-guide">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
	 			<h5>举报指南</h5>
	 		</div>
	 		
	 		<div class="ibox-content">
	 			<form class="form-horizontal" role="form" autocomplete="off">
	 				<div class="form-group" >
						<label for="content" class="col-sm-1 control-label">正文</label>
						<div class="col-sm-10">
							<div id="summernote"></div>
						</div>
					</div>
					
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						<div class="col-sm-4 col-sm-offset-1">
							<button type="button" class="btn btn-fw btn-primary btn-confirm">保存</button>
						</div>
					</div>
	 			</form>
	 		</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/summernote/summernote.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/summernote/lang/summernote-zh-CN.min.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-guide');
		
		$k.util.summernote($page.find('#summernote'), {
			ctx: '${ctx}'
		});
		$('#summernote').summernote('code', '${guide}');
		
		$page
		.on('click', '.btn-confirm', function() {
			var content = $('#summernote').summernote('code');
			
			$.ajax({
				url: '${ctx}/api/config/guide',
				type: 'post',
				data: {
					content, content
				},
				success: function(ret) {
					if (ret.code == 0) {
						swal('', '保存成功', 'success');
					}
				},
				error: function(err) {}
			});
			
		});
		
	})( jQuery );
	</script>
	
</body>
</html>
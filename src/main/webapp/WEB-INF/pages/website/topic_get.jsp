<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>
<%@ include file="/WEB-INF/include/topic_image.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>新增专题</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/cropper/cropper.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sitelogo/sitelogo.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-topic-add">
	<div class="wrapper wrapper-content animated fadeInRight">
	 	<div class="ibox float-e-margins">
	 		<div class="ibox-title">
	 			<h5>新增专题</h5>
	 		</div>
	 		
	 		<div class="ibox-content">
 				<form class="form-horizontal" role="form" autocomplete="off" id="form-topic">
					<div class="form-group">
						<label for="title" class="col-sm-2 control-label"><i class="form-required">*</i>专题名称</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="title" value="${topic.title}" required>
						</div>
					</div>	
					<div class="form-group">
						<label for="source" class="col-sm-2 control-label"><i class="form-required">*</i>专题图片</label>
						<div id="crop-avatar" class="col-md-8">
							<div class="avatar-view" title="点击修改专题图片" style="width: 420px; height: 70px;">
								<c:if test="${method=='add'}">
									<img src="${ctx}/img/default_topic_img.png" alt="默认图片">
								</c:if>
								<c:if test="${method=='edit' || method=='detail'}">
									<img src="${ctx}${topic.imagePath}" alt="默认图片">
								</c:if>
						    </div>
						</div>
					</div>
					
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						<div class="col-sm-4 col-sm-offset-2">
							<c:if test="${method == 'add'}">
							<button type="button" class="btn btn-primary btn-topic-add">
		                        <i class="fa fa-check fa-fw"></i>确定
		                    </button>
		                    </c:if>
		                    <c:if test="${method == 'edit'}">
		                    <button type="button" class="btn btn-primary btn-topic-edit">
		                        <i class="fa fa-check fa-fw"></i>确定
		                    </button>
		                    </c:if>
							<button type="button" class="btn btn-white btn-topic-cancel">
		                        <i class="fa fa-close fa-fw"></i>取消
		                    </button>
						</div>
					</div>
 				</form>
	 		</div>
	 	</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/cropper/cropper.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/sitelogo/sitelogo.js"></script>
	
	<script type="text/javascript">
	
		var $page = $('.body-topic-add');
		var $form = $page.find('#form-topic');
		var method = '${method}';
		
		$k.util.bsValidator($form);
		
		$page
		.on('click', '.btn-topic-add', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			var imagePath = $form.find('.avatar-view > img').attr('src');
			imagePath = imagePath.substring(imagePath.indexOf('/image'));
			if (validator.isValid()) {
				$.ajax({
					url: '${ctx}/api/topic/create',
					type: 'POST',
					data: {
						title: $form.find('input[name="title"]').val(),
						imagePath: imagePath
					},
					success: function(ret) {
						if (ret.code == 0) {
							swal({
								title: '',
								text: '操作成功',
								type: 'success'
							}, function() {
								window.location.href = '${ctx}/topicList';
							});
						} else {
							swal('', '操作失败', 'error');
						}
					},
					error: function(err) {}
				});
			}
		})
		.on('click', '.btn-topic-edit', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			var imagePath = $form.find('.avatar-view > img').attr('src');
			imagePath = imagePath.substring(imagePath.indexOf('/image'));
			if (validator.isValid()) {
				$.ajax({
					url: '${ctx}/api/topic/update',
					type: 'POST',
					data: {
						topicId: '${topic.id}',
						title: $form.find('input[name="title"]').val(),
						imagePath: imagePath
					},
					success: function(ret) {
						if (ret.code == 0) {
							swal({
								title: '',
								text: '操作成功',
								type: 'success'
							}, function() {
								window.location.href = '${ctx}/topicList';
							});
						} else {
							swal('', '操作失败', 'error');
						}
					}
					
				});
			}
		})
		.on('click', '.btn-topic-cancel', function() {
			window.history.back();
		});
		
	</script>
	
</body>
</html>
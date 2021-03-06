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
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote-bs3.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput-rtl.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-datepicker/css/bootstrap-datetimepicker.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	img {
		max-width: 100%;
	}
	</style>
</head>

<body class="gray-bg body-article-add">
	<div class="wrapper wrapper-content animated fadeInRight">
	 	<div class="ibox float-e-margins">
	 		<div class="ibox-title">
	 			<h5>${title}</h5>
	 		</div>
	 		
	 		<div class="ibox-content">
 				<form class="form-horizontal" role="form" autocomplete="off" id="form-article">
					<div class="form-group">
						<label for="title" class="col-sm-1 control-label"><i class="form-required">*</i>标题</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="title" value="${article.title}" required>
						</div>
					</div>	
					<div class="form-group">
						<label for="source" class="col-sm-1 control-label">来源</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="source" value="${article.source}">
						</div>
					</div>
					<div class="form-group">
						<label for="updateTime" class="col-sm-1 control-label"><i class="form-required">*</i>时间</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="updateTime" id="updateTime" 
								value="<fmt:formatDate value="${article.updateTime}" pattern='yyyy-MM-dd HH:mm'/>" required>
						</div>
					</div>
					<c:if test="${type==1}">
					<div class="form-group">
						<label for="uploadImage" class="col-sm-1 control-label"><i class="form-required">*</i>图片</label>
						<div class="col-sm-10">
							<input id="uploadImage" type="file" class="file-loading" name="uploadImage" required>
						</div>
					</div>
					</c:if>
					<div class="form-group" >
						<label for="content" class="col-sm-1 control-label">正文</label>
						<div class="col-sm-10">
							<div id="summernote"></div>
						</div>
					</div>	
					
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						<div class="col-sm-4 col-sm-offset-1">
							<c:if test="${method == 'add'}">
							<button type="button" class="btn btn-fw btn-primary btn-article-add">确定</button>
		                    </c:if>
		                    <c:if test="${method == 'edit'}">
		                    <button type="button" class="btn btn-fw btn-primary btn-article-edit">确定</button>
		                    </c:if>
							<button type="button" class="btn btn-fw btn-white btn-article-cancel">取消</button>
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
	<script type="text/javascript" src="${ctx}/plugins/summernote/summernote.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/summernote/lang/summernote-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/fileinput.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-datepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrap-datepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	
	<script type="text/javascript">
	
		var $page = $('.body-article-add');
		var $form = $page.find('#form-article');
		
		var type = '${type}';
		var method = '${method}';
		var topicId = '${topicId}';
		
		$k.util.bsValidator($form);
		$k.util.summernote($page.find('#summernote'), {
			ctx: '${ctx}'
		});
		$('#updateTime').datetimepicker({
			format: 'yyyy-mm-dd hh:ii',
			language: 'zh-CN',
			autoclose: true,
			startDate: "2017-01-01",
		});
		
		if (method == 'add') {
			if (type == 1) {
				$k.util.fileinput($page.find('#uploadImage'));
			}
			$('#updateTime').val(formatDate2(new Date()));
		} else {
			$('#summernote').summernote('code', '${article.content}');
			if (type == 1) {
				$k.util.fileinput($page.find('#uploadImage'), {
					initialPreview:	'<img src="${ctx}${article.imagePath}" class="file-preview-image" style="max-width: auto; max-height: 200px;">',
				    initialCaption: '${article.imagePath}',
				});
			}
		}
		
		$page
		.on('click', '.btn-article-add', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var formData = new FormData($form[0]); 
				formData.append('topicId', topicId);
				formData.append('type', type);
				formData.append('content', $('#summernote').summernote('code'));
				
				$.ajax({
					url: '${ctx}/api/article/create',
					type: 'POST',
					data: formData,
					processData: false,
					contentType: false,
					cache: false, 
					success: function(ret) {
						if (ret.code == 0) {
							swal({
								title: '',
								text: '操作成功',
								type: 'success'
							}, function() {
								window.history.back();
							});
						} else {
							swal('', '操作失败', 'error');
						}
					},
					error: function(err) {}
				});
			}
		})
		.on('click', '.btn-article-edit', function() {
			var validator = $form.data('bootstrapValidator');
			validator.removeField('uploadImage');
			validator.validate();
			
			if (validator.isValid()) {
				var formData = new FormData($form[0]); 
				formData.append('articleId', '${article.id}');
				formData.append('content', $('#summernote').summernote('code'));
				
				$.ajax({
					url: '${ctx}/api/article/update',
					type: 'POST',
					data: formData,
					processData: false,
					contentType: false,
					cache: false, 
					success: function(ret) {
						if (ret.code == 0) {
							swal({
								title: '',
								text: '操作成功',
								type: 'success'
							}, function() {
								window.history.back();
							});
						} else {
							swal('', '操作失败', 'error');
						}
					}
					
				});
			}
		})
		.on('click', '.btn-article-cancel', function() {
			window.history.back();
		});
		
	</script>
	
</body>
</html>
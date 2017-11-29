<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>新增试题</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	.body-setting img {
		max-width: 100%;
	}
	.body-setting img:HOVER {
		cursor: pointer;
	}
	</style>
</head>
<body class="gray-bg body-setting">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>系统设置</h5>
			</div>
		
			<div class="ibox-content">
				<form class="form-horizontal" role="form" autocomplete="off">
					<div class="form-group">
						<label for="qrcode" class="col-sm-3 control-label">二维码</label>
						<div class="col-sm-7">
							<input class="input-qrcode" type="file" style="display:none" 
								accept="image/jpg, image/jpeg, image/webp, image/bmp, image/png, image/svg, image/gif">
							<c:if test="${empty config.qrcode}">
								<button type="button" class="btn btn-white btn-qrcode" data-toggle="tooltip" data-placement="top" title="插入二维码">
									<i class="fa fa-file-image-o"></i>
								</button>
								<img class="image-qrcode hide" data-toggle="tooltip" title="点击修改图片">
							</c:if>
							<c:if test="${not empty config.qrcode}">
								<img class="image-qrcode" src="${ctx}${config.qrcode}" data-image-path="${config.qrcode}" 
									data-toggle="tooltip" title="点击修改图片">
							</c:if>
							<span>(最佳尺寸258 * 258)</span>
						</div>
					</div>
					
					<div class="form-group">
						<label for="picture" class="col-sm-3 control-label">动态图片</label>
						<div class="col-sm-7">
							<input class="input-picture" type="file" style="display:none" 
								accept="image/jpg, image/jpeg, image/webp, image/bmp, image/png, image/svg, image/gif">
							<c:if test="${empty config.picture}">
								<button type="button" class="btn btn-white btn-picture" data-toggle="tooltip" data-placement="top" title="插入动态图片">
									<i class="fa fa-file-image-o"></i>
								</button>
								<img class="image-picture hide" data-toggle="tooltip" title="点击修改图片">
							</c:if>
							<c:if test="${not empty config.picture}">
								<img class="image-picture" src="${ctx}${config.picture}" data-image-path="${config.picture}" 
									data-toggle="tooltip" title="点击修改图片">
							</c:if>
							<span>(最佳尺寸980 * 80)</span>
						</div>
					</div>
					
					<div class="form-group">
						<label for="suspension" class="col-sm-3 control-label">悬浮图片</label>
						<div class="col-sm-7">
							<input class="input-suspension" type="file" style="display:none" 
								accept="image/jpg, image/jpeg, image/webp, image/bmp, image/png, image/svg, image/gif">
							<c:if test="${empty config.suspension}">
								<button type="button" class="btn btn-white btn-suspension" data-toggle="tooltip" data-placement="top" title="插入悬浮图片">
									<i class="fa fa-file-image-o"></i>
								</button>
								<img class="image-suspension hide" data-toggle="tooltip" title="点击修改图片">
							</c:if>
							<c:if test="${not empty config.suspension}">
								<img class="image-suspension" src="${ctx}${config.suspension}" data-image-path="${config.suspension}" 
									data-toggle="tooltip" title="点击修改图片">
							</c:if>
							<span>(最佳尺寸520 * 270)</span>
						</div>
					</div>
					
					<div class="hr-line-dashed"></div>
					<div class="form-group">
                        <div class="col-sm-10 col-sm-offset-3">
                           	<button type="button" class="btn btn-primary btn-fw btn-setting-save">保存</button>
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
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-setting');
		var $form = $page.find('form');
		
		// tooltip
		$page.find('[data-toggle="tooltip"]').tooltip();
		
		$page
		.on('click', '.btn-qrcode', function() {
			$page.find('.input-qrcode').click();
		})
		.on('click', '.image-qrcode', function() {
			$page.find('.input-qrcode').click();
		})
		.on('change', '.input-qrcode', function() {
			var formData = new FormData();
			formData.append('imageFile', this.files[0]);
			
			$.ajax({
				url: '${ctx}/api/uploadImage',
				type: 'post',
				data: formData,
				enctype : 'multipart/form-data',
                processData: false,
                contentType: false,
                cache: false,
                success: function(ret) {
                	if (ret.code == 0) {
                		var imagePath = ret.data;
                		$page.find('.btn-qrcode').addClass('hide');
                		$page.find('.image-qrcode')
                			.removeClass('hide')
                			.attr('src', '${ctx}' + imagePath)
                			.data('imagePath', imagePath);
                	}
                },
                error: function(err) {}
			});
		})
		.on('click', '.btn-picture', function() {
			$page.find('.input-picture').click();
		})
		.on('click', '.image-picture', function() {
			$page.find('.input-picture').click();
		})
		.on('change', '.input-picture', function() {
			var formData = new FormData();
			formData.append('imageFile', this.files[0]);
			
			$.ajax({
				url: '${ctx}/api/uploadImage',
				type: 'post',
				data: formData,
				enctype : 'multipart/form-data',
                processData: false,
                contentType: false,
                cache: false,
                success: function(ret) {
                	if (ret.code == 0) {
                		var imagePath = ret.data;
                		$page.find('.btn-picture').addClass('hide');
                		$page.find('.image-picture')
                			.removeClass('hide')
                			.attr('src', '${ctx}' + imagePath)
                			.data('imagePath', imagePath);
                	}
                },
                error: function(err) {}
			});
		})
		.on('click', '.btn-suspension', function() {
			$page.find('.input-suspension').click();
		})
		.on('click', '.image-suspension', function() {
			$page.find('.input-suspension').click();
		})
		.on('change', '.input-suspension', function() {
			var formData = new FormData();
			formData.append('imageFile', this.files[0]);
			
			$.ajax({
				url: '${ctx}/api/uploadImage',
				type: 'post',
				data: formData,
				enctype : 'multipart/form-data',
                processData: false,
                contentType: false,
                cache: false,
                success: function(ret) {
                	if (ret.code == 0) {
                		var imagePath = ret.data;
                		$page.find('.btn-suspension').addClass('hide');
                		$page.find('.image-suspension')
                			.removeClass('hide')
                			.attr('src', '${ctx}' + imagePath)
                			.data('imagePath', imagePath);
                	}
                },
                error: function(err) {}
			});
		})
		.on('click', '.btn-setting-save', function() {
			$.ajax({
				url: '${ctx}/api/config/save',
				type: 'post',
				data: {
					qrcode: $page.find('.image-qrcode').data('imagePath'),
					picture: $page.find('.image-picture').data('imagePath'),
					suspension: $page.find('.image-suspension').data('imagePath')
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
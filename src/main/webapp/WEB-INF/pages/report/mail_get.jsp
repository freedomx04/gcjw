<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>信件详情</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
</head>

<body class="gray-bg body-mail-detail">
	<div class="wrapper wrapper-content animated fadeInRight">
	 	<div class="ibox float-e-margins">
	 		<div class="ibox-title">
	 			<h5>信件详情</h5>
	 		</div>
	 		
	 		<div class="ibox-content">
 				<form class="form-horizontal" role="form" autocomplete="off" id="form-mail">
 					<div class="form-group">
 						<label for="code" class="col-sm-2 control-label">信件查询码</label>
 						<div class="col-sm-8">
							<input type="text" class="form-control" name="code" value="${mail.code}" disabled>
						</div>
 					</div>
 					
					<div class="form-group">
						<label for="title" class="col-sm-2 control-label">信件标题</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="title" value="${mail.title}" disabled>
						</div>
					</div>	
					
					<div class="form-group">
						<label for="content" class="col-sm-2 control-label">信件内容</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" name="content" style="resize:none; height: 250px;" disabled>${mail.content}</textarea>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="updateTime" class="col-sm-2 control-label">时间</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="updateTime" value="<fmt:formatDate value="${mail.updateTime}" pattern="yyyy-MM-dd HH:mm"/>" disabled>
						</div>
					</div>	
					
					<div class="form-group">
						<label for="reply" class="col-sm-2 control-label">回复内容</label>
                        <div class="col-sm-8">
                            <textarea class="form-control textarea-mail-reply" name="content" style="resize:none; height: 150px;" disabled>${mail.reply}</textarea>
                        </div>
					</div>
					
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						<div class="col-sm-4 col-sm-offset-2">
							<c:if test="${empty mail.reply}">
								<button type="button" class="btn btn-primary btn-mail-reply">
			                        <i class="fa fa-edit fa-fw"></i>回复
			                    </button>
			                    <button type="button" class="btn btn-primary btn-mail-confirm hide">
	                                <i class="fa fa-check fa-fw"></i>确定
	                            </button>
							</c:if>
							<button type="button" class="btn btn-white btn-mail-cancel">
		                        <i class="fa fa-reply fa-fw"></i>返回
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
	<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
	
	<script type="text/javascript">
	
		var $page = $('.body-mail-detail');
		var $form = $page.find('#form-mail');
		
		$page
		.on('click', '.btn-mail-reply', function() {
			$form.find('.textarea-mail-reply').removeAttr('disabled');
			$form.find('.btn-mail-reply').addClass('hide');
			$form.find('.btn-mail-confirm').removeClass('hide');
		})
		.on('click', '.btn-mail-confirm', function() {
			var reply = $form.find('.textarea-mail-reply').val();
			if (reply == '') {
				toastr['error']('请填写回复内容');
				return;
			}
			
			$.ajax({
				url: '${ctx}/api/mail/reply',
				type: 'post',
				data: {
					mailId: '${mail.id}',
					reply: reply
				},
				success: function(ret) {
					if (ret.code == 0) {
						swal({
							title: '',
							text: '回复成功',
							type: 'success'
						}, function() {
							window.location.href = '${ctx}/mailList';
						});
					} else {
						swal('', ret.msg, 'error');
					}
				},
				error: function(err) {}
			});
		})
		.on('click', '.btn-mail-cancel', function() {
			window.history.back();
		});
		
	</script>
	
</body>
</html>
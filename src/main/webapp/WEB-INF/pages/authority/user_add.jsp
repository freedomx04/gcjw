<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>
<%@ include file="/WEB-INF/include/password.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>新增用户</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-user-add">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>新增用户</h5>
			</div>
			
			<div class="ibox-content">
				<form class="form-horizontal" role="form" autocomplete="off" id="form-user">
					<div class="form-group">
						<label for="username" class="col-sm-3 control-label"><i class="form-required">*</i>用户名</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="username" placeholder="只能包含英文、数字、下划线等字符" value="${user.username}" required>
                        </div>
					</div>
					
					<div class="form-group form-hide">
						<label for="password" class="col-sm-3 control-label"><i class="form-required">*</i>密码</label>
						<div class="col-sm-5">
							<input type="password" id="password" class="form-control" name="password" placeholder="6-16个字符,请使用字母加数字或者符号" required>
						</div>
					</div>
					<div class="form-group form-hide">
						<label for="" class="col-sm-3 control-label" style="font-weight: normal; color: #999;">密码强度</label>
						<div class="col-sm-5">
							<div id="level" class="pw-strength">
								<div class="pw-bar"></div>
								<div class="pw-bar-on"></div>
								<div class="pw-txt">
									<span>弱</span><span>中</span><span>强</span>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group form-hide">
						<label for="confirm-password" class="col-sm-3 control-label"><i class="form-required">*</i>确认密码</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" name="confirmPassword" required>
						</div>
					</div>
					
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
                        <div class="col-sm-4 col-sm-offset-3">
                            <button type="button" class="btn btn-primary btn-user-add">
                                <i class="fa fa-check fa-fw"></i>确定
                            </button>
                            <button type="button" class="btn btn-white btn-user-cancel">
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

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-user-add');
		var $form = $page.find('#form-user');
		var method = '${method}';
		
		// password
		strength($page.find('#password'), $page.find('#level'));
		
		$k.util.bsValidator($form, {
			fields: {
				mobile: {
	                 validators: {
	                     regexp: {
	                         regexp: /^1[3|5|8]{1}[0-9]{9}$/,
	                         message: '请输入正确的手机号码'
	                     }
	                 }
	             },
	             username: {
	            	 validators: {
	           	 		regexp: {
	           	 			regexp: /^[a-zA-Z0-9_\.]+$/,
	     	                message: '用户名只能包含英文、数字、下划线等字符'
   	                    }
   	                 }
   	             },
  	             password: {
  	                 validators: {
  	                     identical: {
  	                         field: 'confirmPassword',
  	                         message: '两次输入密码不一致'
  	                     },
  	                 	 stringLength: {
  	                         min: 6,
  	                         max: 16,
  	                         message: '密码长度必须在6到16之间'
  	                     }
  	                 }
  	             },
  	             confirmPassword: {
  	             	validators: {
  	                	identical: {
  	                    	field: 'password',
  	                        message: '两次输入密码不一致'
  	                    },
  	                  	stringLength: {
							min: 6,
							max: 16,
							message: '密码长度必须在6到16之间'
						}
  	                }
  	            }
			}
		});
		
		$page
		.on('click', '.btn-user-add', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				$.ajax({
					url :'${ctx}/api/user/create',
					type: 'POST',
					data: {
						username: $form.find('input[name="username"]').val(),
						password: $form.find('input[name="password"]').val()
					},
					success: function(ret) {
						if (ret.code == 0) {
                    		swal({
                                title: '',
                                text: '操作成功',
                                type: 'success'
                            }, function() {
                                window.location.href = '${ctx}/userList';
                            });
                    	} else {
                    		swal('', ret.msg, 'error');
                    	}
					},
					error: function(err) {}
				});
			}
		})
		.on('click', '.btn-user-cancel', function() {
			window.location.href = '${ctx}/userList';
		});
		
	})( jQuery );
	</script>
	
</body>

</html>
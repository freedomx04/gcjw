<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>举报详情</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
</head>

<body class="gray-bg body-report-detail">
	<div class="wrapper wrapper-content animated fadeInRight">
	 	<div class="ibox float-e-margins">
	 		<div class="ibox-title">
	 			<button type="button" class="btn btn-white btn-report-back btn-sm"><i class="fa fa-chevron-left fa-fw"></i>网络举报</button>
	 			<span style="padding-left: 15px; font-size: 16px;">举报详情</span>
	 		</div>
	 		
	 		<div class="ibox-content">
 				<form class="form-horizontal" role="form" autocomplete="off" id="form-report">
 					<div class="form-group">
 						<label for="code" class="col-sm-3 control-label">举报查询码</label>
 						<div class="col-sm-6">
							<input type="text" class="form-control disabled" name="code" value="${report.code}">
						</div>
 					</div>
 					
 					<div class="form-group">
						<label for="updateTime" class="col-sm-3 control-label">时间</label>
						<div class="col-sm-6">
							<input type="text" class="form-control disabled" name="updateTime" value="<fmt:formatDate value="${report.updateTime}" pattern="yyyy-MM-dd HH:mm"/>">
						</div>
					</div>
 					
 					<div class="hr-line-dashed"></div>
 					<div class="form-group">
 						<label for="" class="col-sm-3 control-label" style="color: #990000;">举报人信息</label>
 					</div>
 					
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">姓名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control disabled" name="name" value="${report.name}">
						</div>
					</div>	
					
					<div class="form-group">
						<label for="telephone" class="col-sm-3 control-label">联系方式</label>
						<div class="col-sm-6">
							<input type="text" class="form-control disabled" name="telephone" value="${report.telephone}">
						</div>
					</div>	
					
					<div class="form-group">
						<label for="idCards" class="col-sm-3 control-label">身份证号</label>
						<div class="col-sm-6">
							<input type="text" class="form-control disabled" name="idCards" value="${report.idCards}">
						</div>
					</div>	
					
					<div class="form-group">
						<label for="address" class="col-sm-3 control-label">工作单位或地址</label>
						<div class="col-sm-6">
							<input type="text" class="form-control disabled" name="address" value="${report.address}">
						</div>
					</div>
					
					<div class="hr-line-dashed"></div>
					<div class="form-group">
 						<label for="" class="col-sm-3 control-label" style="color: #990000;">被举报人（单位）信息</label>
 					</div>
 					
 					<div class="form-group">
						<label for="reportUnit" class="col-sm-3 control-label">单位名称</label>
						<div class="col-sm-6">
							<input type="text" class="form-control disabled" name="reportUnit" value="${report.reportUnit}">
						</div>
					</div>
 					
 					<div class="form-group">
						<label for="reportName" class="col-sm-3 control-label">姓名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control disabled" name="reportName" value="${report.reportName}">
						</div>
					</div>
 					
 					<div class="form-group">
						<label for="position" class="col-sm-3 control-label">职务</label>
						<div class="col-sm-6">
							<input type="text" class="form-control disabled" name="position" value="${report.position}">
						</div>
					</div>
 					
 					<div class="form-group">
						<label for="level" class="col-sm-3 control-label">级 别</label>
						<div class="col-sm-6">
							<input type="text" class="form-control disabled" name="level" value="${report.level}">
						</div>
					</div>
 					
 					<div class="form-group">
						<label for="politics" class="col-sm-3 control-label">政治面貌</label>
						<div class="col-sm-6">
							<input type="text" class="form-control disabled" name="politics" value="${report.politics}">
						</div>
					</div>
 					
 					<div class="hr-line-dashed"></div>
 					<div class="form-group">
 						<label for="" class="col-sm-3 control-label" style="color: #990000;">举报信正文</label>
 					</div>
 					
 					<div class="form-group">
						<label for="type" class="col-sm-3 control-label">问题类别</label>
						<div class="col-sm-6">
							<input type="text" class="form-control disabled" name="type" value="${report.type}">
						</div>
					</div>
					
					<div class="form-group">
						<label for="content" class="col-sm-3 control-label">主要问题</label>
                        <div class="col-sm-6">
                            <textarea class="form-control disabled" name="content" style="resize:none; height: 250px;">${report.content}</textarea>
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
	
		var $page = $('.body-report-detail');
		var $form = $page.find('#form-report');
		
		$page.on('click', '.btn-report-back', function() {
			window.history.back();
		});
		
	</script>
	
</body>
</html>
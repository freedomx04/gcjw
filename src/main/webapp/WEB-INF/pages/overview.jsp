<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>网站概况</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">

</head>

<body class="gray-bg body-overview">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>网站分析</h5>
					</div>
					
					<div class="ibox-content">
						<div class="row">
							<div class="col-sm-4">
								<table class="table-article-count table-hm table text-center" data-mobile-responsive="true" style="margin-bottom: 0;">
									<thead>
										<tr>
											<td>类别</td>
											<td>数量</td>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
							
							<div class="col-sm-8">
								<div class="chart-article-count" style="width: 100%; height: 500px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content">
						<div class="chart-dynamic" style="width: 100%; height: 500px;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/echarts/echarts.common.min.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-overview');
		
		// 网站分析
		$.ajax({
			url: '${ctx}/api/article/listCountByType',
			success: function(ret) {
				var seriesData = [];
				var xAxisData = [];
				
				// table
				$.each(ret.data, function(k, val) {
					xAxisData.push(val.title);
					seriesData.push(val.count);
					
					var $tr = '<tr><td>' + val.title + '</td><td>' + val.count + '</td></tr>';
					$page.find('.table-article-count tbody').append($tr);
				});
				
				
				// chart
				var chart = echarts.init($page.find('.chart-article-count')[0]);
				option = {
					title: {
						text: '网站类别数量柱状图',
						x: 'center'
					},
					color: ['#3b8cff'],
					tooltip: {
						trigger: 'axis',
						axisPointer: {
							type: 'line'
						}
					},
					xAxis: [{
						type: 'category',
						data: xAxisData,
						axisTick: {
							alignWithLabel: true
						},
						axisLabel: {
							interval: 0,
							rotate: 45,
							margin: 2,
						}
					}],
					yAxis: [{
						type: 'value',
						minInterval: 1
					}],
					calculable : true,
					series: [{
						name: '数量',
						type: 'bar',
						barWith: '60%',
						data: seriesData
					}]
				}
				chart.setOption(option);
				
				window.addEventListener("resize", function(){
					chart.resize();
		        });
			},
			error: function(err) {}
		});
		
		// 工作动态分析
		$.ajax({
			url: '${ctx}/api/article/listDynamicCountByType',
			success: function(ret) {
				var legendData = [];
				var seriesData = [];
				
				$.each(ret.data, function(k, val) {
					legendData.push(val.title);
					seriesData.push({
						value: val.count,
						name: val.title
					});
				});
				
				var chart = echarts.init($page.find('.chart-dynamic')[0]);
				option = {
					title: {
						text: '工作动态分析',
						x: 'center'
					},
					tooltip: {
						trigger: 'item',
						formatter: '{b} : {c} ({d}%)'
					},
					legend: {
						orient: 'vertical',
						x: 'left',
						data: legendData
					},
					series: [{
						type: 'pie',
						raduis: '55%',
						center: ['50%', '60%'],
						data: seriesData
					}],
					itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            },
		            animationType: 'scale'
				},
				chart.setOption(option);
				
				window.addEventListener("resize", function(){
					chart.resize();
		        });
			},
			error: function(err) {}
		});
		
	})( jQuery );
	</script>

</body>
</html>
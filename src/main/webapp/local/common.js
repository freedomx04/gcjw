;(function() {
	
	/**
	 * 通用对象
	 */
	$k = {
		page: {},
		proto: {},
		util: {},
		user: {},
		constant: {
			level: [{	value: 1,	name: "县处级"	}, 
		            {	value: 2,	name: "乡科级"	}, 
		            {	value: 3,	name: "一般干部"	}, 
		            {	value: 4,	name: "其他人员"	}, 
		            {	value: 5,	name: "其他农村人员"}, 
		            {	value: 8,	name: "其他企业人员"}],
		            
            type: [{	value: 0,	name: "涉法行为—贪污贿赂行为"	},
			        {	value: 1,	name: "涉法行为—失职渎职行为"	},
					{	value: 2,	name: "涉法行为—破坏社会主义市场经济秩序行为"	},
					{	value: 3,	name: "涉法行为—侵犯人身权利民主权利行为"},
					{	value: 4,	name: "涉法行为—妨害社会管理秩序行为"	},
					{	value: 5,	name: "涉法行为—其他涉法行为"	},
					{	value: 6,	name: "政治纪律—公开发表危害党的言论"	},
					{	value: 7,	name: "政治纪律—参加反对党和政府的活动或组织"	},
					{	value: 8,	name: "政治纪律—在党内搞团团伙伙"	},
					{	value: 9,	name: "政治纪律—妨碍党和国家方针政策实施"	},
					{	value: 10,	name: "政治纪律—对抗组织审查"		},
					{	value: 11,	name: "政治纪律—组织参加迷信活动"	},
					{	value: 12,	name: "政治纪律—叛逃及涉外活动中损害党和国家利益"	},
					{	value: 13,	name: "政治纪律—无原则一团和气和违反政治规矩"		},
					{	value: 14,	name: "组织纪律—违反民主集中制原则"		},
					{	value: 15,	name: "组织纪律—不按要求请示报告有关事项"		},
					{	value: 16,	name: "组织纪律—违规组织参加老乡会校友会战友会"		},
					{	value: 17,	name: "组织纪律—在投票和选举中搞非组织活动"		},
					{	value: 18,	name: "组织纪律—违反干部选拔任用规定"		},
					{	value: 19,	name: "组织纪律—在人事劳动工作中违规谋利"		},
					{	value: 20,	name: "组织纪律—违规发展党员"		},
					{	value: 21,	name: "组织纪律—违规办理出国证件和在境外脱离组织"		},
					{	value: 22,	name: "廉洁纪律—权权交易和纵容特定关系人以权谋利"		},
					{	value: 23,	name: "廉洁纪律—违规接受礼品礼金宴请服务"		},
					{	value: 24,	name: "廉洁纪律—违规操办婚丧喜庆事宜"		},
					{	value: 25,	name: "廉洁纪律—违规从事营利活动"		},
					{	value: 26,	name: "廉洁纪律—违反工作生活待遇规定"		},
					{	value: 27,	name: "廉洁纪律—违规占用使用公私财物"		},
					{	value: 28,	name: "廉洁纪律—违规参与公款宴请消费"		},
					{	value: 29,	name: "廉洁纪律—违规自定薪酬和发放津贴补贴奖金"		},
					{	value: 30,	name: "廉洁纪律—公款旅游"		},
					{	value: 31,	name: "廉洁纪律—违反公务接待管理规定"		},
					{	value: 32,	name: "廉洁纪律—违反公务用车管理规定"		},
					{	value: 33,	name: "廉洁纪律—违反会议活动管理规定"		},
					{	value: 34,	name: "廉洁纪律—违反办公用房管理规定"		},
					{	value: 35,	name: "廉洁纪律—权色钱色交易"		},
					{	value: 36,	name: "廉洁纪律—其他违反廉洁纪律行为"		},
					{	value: 37,	name: "群众纪律—侵害群众利益"		},
					{	value: 38,	name: "群众纪律—漠视群众利益"		},
					{	value: 39,	name: "群众纪律—侵犯群众知情权"		},
					{	value: 40,	name: "群众纪律—其他违反群众纪律行为"		},
					{	value: 41,	name: "工作纪律—主体责任落实不力"		},
					{	value: 42,	name: "工作纪律—违规干预市场经济活动"		},
					{	value: 43,	name: "工作纪律—违规干预执纪执法司法活动"		},
					{	value: 44,	name: "工作纪律—泄露扩散窃取私存党的秘密"		},
					{	value: 45,	name: "工作纪律—违反考试录取工作规定"		},
					{	value: 46,	name: "工作纪律—其他违反工作纪律行为"		},
					{	value: 47,	name: "生活纪律—生活奢靡"		},
					{	value: 48,	name: "生活纪律—不正当性关系"		},
					{	value: 49,	name: "生活纪律—其他违反生活纪律行为"		}],
		}
	}
	
	/**
	 * bootstrap table中的数据获取id
	 */
	$k.util.getIds = function(arr) {
		var ids = new Array();
		$.each(arr, function(k, v) {
			ids.push(v.id);
		});
		return ids.join(',');
	}
	
	$k.util.getIdList = function(arr) {
		var ids = new Array();
		$.each(arr, function(k, v) {
			ids.push(v.id);
		});
		return ids;
	}
	
	/**
	 * 初始化bootstrap table
	 */
	$k.util.bsTable = function($table, param) {
		var defaultParam = $.extend(jQuery.fn.bootstrapTable.defaults, {
			cache: false,					// 是否禁用ajax数据缓存, 默认为true
			//height: 500,					// 定义表格的高度
			//undefinedText: '-',			// 当数据为 undefined 时显示的字符, 默认为 '-'
			striped: false,					// 设置为 true 会有隔行变色效果, 默认为false
			
			// 分页设置
			pagination: true,				// 是否显示分页条, 默认为false
			//pageNumber: 1, 				// 初始化加载第一页， 默认为1
			pageSize: 25, 					// 每页的记录行数, 默认为10
			//pageList: [10, 25, 50, 100], 	// 可供选择的每页的行数, 默认为[10, 25, 50, 100, All]
			paginationPreText: '上一页',	
			paginationNextText: '下一页',
			paginationFirstText: '首页',
			paginationLastText: '尾页',
			
			// 搜索设置
			search: true, 					// 是否显示表格搜索, 默认为false
			searchOnEnterKey: true,			// 设置为 true时，按回车触发搜索方法，否则自动触发搜索方法, 默认为false
			//strictSearch: true,			// 设置为 true启用 全匹配搜索，否则为模糊搜索, 默认为false
			//searchText: '',				// 初始化搜索文字, 默认为''
			
			// 显示设置
			iconSize: 'outline',			// btn样式
			showColumns: true,				// 是否显示 内容列下拉框, 默认为false
			showRefresh: true,				// 是否显示 刷新按钮, 默认为false
			showToggle: false,				// 是否显示 切换试图（table/card）按钮, 默认为false
			
			// 点击
			clickToSelect: true,			// 设置true 将在点击行时，自动选择rediobox 和 checkbox, 默认为false
			//singleSelect: true			// 设置True 将禁止多选, 默认为false
			
		}, param); 
		
		var ret = $table.bootstrapTable(defaultParam);
		return ret;
	}
	
	/**
	 * 验证器
	 */
	$k.util.bsValidator = function($form, param) {
		var defaultParam = $.extend({
			message: 'This value is not valid',
/*            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },*/
            excluded: [':disabled']
		}, param);
		
		$form.bootstrapValidator(defaultParam);
	}
	
	/**
	 * 图片选择器
	 */
	$k.util.fileinput = function($input, param) {
		var defaultParam = $.extend({
			language: 'zh', 
            showUpload: false, 
            showRemove: false,
            allowedFileExtensions: [ 'jpg', 'png', 'gif' ],
            browseClass: "btn btn-primary",
            browseIcon: "<i class=\"glyphicon glyphicon-picture\"></i>"
		}, param);
		
		$input.fileinput(defaultParam);
	}
	
	/**
	 * 文本编辑器
	 */
	$k.util.summernote = function($obj, param) {
		var defaultParam = $.extend({
			minHeight: 360,
			lang: 'zh-CN',
			focus: true,
			dialogsFade: true,
			placeholder: '正文内容'
		}, param);
		
		$obj.summernote(defaultParam);
	}
	
	/**
	 * 截取字符串
	 */
	$k.util.subText = function($paragraph, maxParagraphLength) {
		var paragraphText = $paragraph.text();
		if (paragraphText == null) {
			return;
		}
		
		var paragraphLength = paragraphText.length;
		if (paragraphLength > maxParagraphLength) {
			$paragraph.html(paragraphText.substring(0, maxParagraphLength) + '...');
		}
	}
	
	/**
	 * 其他方法
	 */
	Date.prototype.Format = function (fmt) { 
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
	
})();

function formatDate(val) {
	if (val) {
		return new Date(val).Format("yyyy-MM-dd");
	}
	return undefined;
}

function formatDate2(val) {
	if (val) {
		return new Date(val).Format("yyyy-MM-dd hh:mm");
	}
	return undefined;
}

function formatDate3(val) {
	if (val) {
		return new Date(val).Format("yyyy年MM月dd日  hh:mm");
	}
	return undefined;
}

function formatDate4(val) {
	if (val) {
		return new Date(val).Format("yyyy/MM/dd hh:mm");
	}
	return undefined;
}
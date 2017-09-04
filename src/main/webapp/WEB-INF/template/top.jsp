<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<body>
	<div class="t_title">
		<div class="t_word">
			<div class="tl_word">
				<span style="color: #000;">广昌县纪委监察局网站</span>
			</div>
			<div class="date">
				<script language="JavaScript">
					var day="";
					var month="";
					var ampm="";
					var ampmhour="";
					var myweekday="";
					var year="";
					mydate=new Date();
					myweekday=mydate.getDay();
					mymonth=mydate.getMonth()+1;
					myday= mydate.getDate();
					myyear= mydate.getYear();
					year=(myyear > 200) ? myyear : 1900 + myyear;
					if(myweekday == 0)
						weekday=" 星期日 ";
					else if(myweekday == 1)
						weekday=" 星期一 ";
					else if(myweekday == 2)
						weekday=" 星期二 ";
					else if(myweekday == 3)
						weekday=" 星期三 ";
					else if(myweekday == 4)
						weekday=" 星期四 ";
					else if(myweekday == 5)
						weekday=" 星期五 ";
					else if(myweekday == 6)
						weekday=" 星期六 ";
					document.write(year+"年"+mymonth+"月"+myday+"日 "+weekday); 
				  </script>
			</div>
			<div class="weahter">
				<iframe allowtransparency="true" frameborder="0" width="317" height="28" scrolling="no" src="//tianqi.2345.com/plugin/widget/index.htm?s=3&z=1&t=1&v=0&d=1&bd=0&k=&f=&q=1&e=1&a=0&c=60501&w=317&h=28&align=center"></iframe>
			</div>
			<div class="tr_word">
				<a href="javascript:void(0)" onclick="SetHome(this, window.location)" style="display: block; float: left;">设为首页</a> <span
					style="margin: 0 6px; float: left; display: block;">&nbsp;|&nbsp;</span>
				<a href="javascript:void(0)" onclick="shoucang(document.title, window.location)" style="display: block; float: left;">加入收藏</a>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="header-container">
		<div class="yetou">
			<div class="search">
				<input ttype="text" name="input" id="input" value="输入关键字"
					onfocus="if(this.value=='输入关键字'){this.value=''}"
					onblur="if(this.value==''){this.value='输入关键字'}" class="search_key">
				<input type="button" id="but_search" class="but_search"
					value="&nbsp;">
			</div>
		</div>
	</div>
	<div class="nav-container">
		<div class="nav"> 
			<a href="${ctx}" target="_blank">网站首页</a> 
			<a href="${ctx}/column?type=0" target="_blank">通知公告</a> 
			<a href="${ctx}/column?type=3" target="_blank">廉情在线</a> 
			<a href="${ctx}/column?type=5" target="_blank">党纪法规</a> 
			<a href="${ctx}/column?ptype=dynamic&type=9" target="_blank">纪律审查</a> 
			<a href="${ctx}/column?type=1" target="_blank">图片新闻</a> 
			<a href="${ctx}/column?type=7" target="_blank" style="background-image: none;">专题文章</a> 
		</div>
	</div>

	<script language="JavaScript">
		window.onload=function(){ 
			var $but_search = document.getElementById('but_search');
			
			$but_search.onclick = function() {
				var input = document.getElementById("input").value;
				window.location = '${ctx}/result?input=' +　input;
			};
			
			 document.onkeydown=function(event){
	            var e = event || window.event || arguments.callee.caller.arguments[0];
	             if(e && e.keyCode==13){ // enter 键
	            	 e.preventDefault(); 
	            	 $but_search.click();
	            }
	        }; 
		}
		
		function SetHome(obj,vrl) { // 设置为主页 
			try{ 
				obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl); 
			} catch(e){ 
				if (window.netscape) { 
					try { 
						netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
					} catch (e) { 
						alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。"); 
					} 
					var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch); 
					prefs.setCharPref('browser.startup.homepage',vrl); 
				} else { 
					alert("您的浏览器不支持，请按照下面步骤操作：1.打开浏览器设置。2.点击设置网页。3.输入："+vrl+"点击确定。"); 
				} 
			} 
		} 
		
		function shoucang(sTitle,sURL) { // 加入收藏 兼容360和IE6 
			try { 
				window.external.addFavorite(sURL, sTitle); 
			} catch (e) { 
				try { 
					window.sidebar.addPanel(sTitle, sURL, ""); 
				} catch (e) { 
					alert("加入收藏失败，请使用Ctrl+D进行添加"); 
				} 
			} 
		}
	</script>

</body>

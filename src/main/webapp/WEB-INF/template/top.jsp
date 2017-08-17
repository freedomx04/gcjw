<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<body>
	<div class="t_title">
		<div class="t_word">
		  <div class="tl_word">
			<a href="javascript:void(0);" style="color: #000;">广昌县纪委监察局网站</a></div>
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
			<iframe allowtransparency="true" frameborder="0" width="317" height="30" scrolling="no" src="http://tianqi.2345.com/plugin/widget/index.htm?s=3&amp;z=1&amp;t=0&amp;v=0&amp;d=1&amp;bd=0&amp;k=&amp;f=&amp;q=1&amp;e=1&amp;a=1&amp;c=58617&amp;w=317&amp;h=28&amp;align=center"></iframe>
		  </div>
		  <div class="tr_word">
		  <a style=" display: block; float: left;">设为首页</a> <span style=" margin: 0 6px; float: left; display: block;">&nbsp;|&nbsp;</span> <a style=" display: block; float: left;">加入收藏</a>
		  <div class="clear"></div>
		  </div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="header-container">
		<div class="yetou">
			<div class="search">
				<input ttype="text" name="keyword" id="keyword" value="输入关键字" onfocus="if(this.value=='输入关键字'){this.value=''}" onblur="if(this.value==''){this.value='输入关键字'}" class="search_key">
				<input type="submit" class="but_search" value="&nbsp;">
			</div>
		</div>
	</div>
	<div class="nav-container">
		<div class="nav"> 
			<a href="${ctx}" target="_blank">网站首页</a> 
			<a href="column?type=0" target="_blank">通知公告</a> 
			<a href="column?type=3" target="_blank">廉情在线</a> 
			<a href="column?ptype=dynamic&type=9" target="_blank">纪律审查</a> 
			<a href="column?type=1" target="_blank">图片新闻</a> 
			<a href="column?type=7" target="_blank" style="background-image: none;">专题文章</a> 
		</div>
	</div>
</body>

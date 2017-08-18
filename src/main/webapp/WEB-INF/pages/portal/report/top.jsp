<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
function MM_swapImgRestore() {
    var i, x, a = document.MM_sr; for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
}

function MM_findObj(n, d) {
    var p, i, x; if (!d) d = document; if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
        d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p);
    }
    if (!(x = d[n]) && d.all) x = d.all[n]; for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
    for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
    if (!x && document.getElementById) x = document.getElementById(n); return x;
}

function MM_swapImage() {
    var i, j = 0, x, a = MM_swapImage.arguments; document.MM_sr = new Array; for (i = 0; i < (a.length - 2); i += 3)
        if ((x = MM_findObj(a[i])) != null) { document.MM_sr[j++] = x; if (!x.oSrc) x.oSrc = x.src; x.src = a[i + 2]; }
}

function y2k(number) { return (number < 1000) ? number + 1900 : number; }

function dispdate() {
    var now = new Date();
    var dd = now.getDate(), mt = now.getMonth() + 1, yy = y2k(now.getYear()), weekVal = now.getDay();

    if (weekVal == 0)
        msg1 = "星期日";
    else if (weekVal == 1)
        msg1 = "星期一";
    else if (weekVal == 2)
        msg1 = "星期二";
    else if (weekVal == 3)
        msg1 = "星期三";
    else if (weekVal == 4)
        msg1 = "星期四";
    else if (weekVal == 5)
        msg1 = "星期五";
    else if (weekVal == 6)
        msg1 = "星期六";

    document.write(yy + "年" + mt + "月" + dd + "日 " + msg1);
}
var flasher = false;
function updateTime() {
    var now = new Date();
    var theHour = now.getHours();
    var theMin = now.getMinutes();
    var theSec = now.getSeconds();
    if (theHour < 10) {
        theHour = "0" + theHour
    }
    if (theMin < 10) {
        theMin = "0" + theMin
    }
    if (theSec < 10) {
        theSec = "0" + theSec
    }
    var theTime = theHour + ":" + theMin + ":" + theSec;
    flasher = !flasher;
    lblTime.innerHTML = theTime;
    // recursively call this function every second to keep timer going 
    timerID = setTimeout("updateTime()", 1000)
}
</script>

<body>
	<div style="background-image: url('${ctx}/img/report/banner5.jpg'); background-repeat: no-repeat; width: 1000px; height: 131px">
    </div>
	<table width="1000" border="0" align="center" cellspacing="0" cellpadding="0">
	    <tbody><tr> 
			<td width="98"><a href="${ctx}/report/index" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image18','','${ctx}/img/report/lan-022.gif',1)"><img name="Image18" border="0" src="${ctx}/img/report/lan-02.gif" width="98" height="27"></a></td>
			<td width="98"><a href="${ctx}/report/law" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image16','','${ctx}/img/report/lan-044.gif',1)"><img name="Image16" border="0" src="${ctx}/img/report/lan-04.gif" width="98" height="27"></a></td>
			<td width="98"><a href="${ctx}/report/JBXZ" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image17','','${ctx}/img/report//lan-088.gif',1)"><img name="Image17" border="0" src="${ctx}/img/report/lan-08.gif" width="98" height="27"></a></td>
			<td width="98"><a href="${ctx}/report/SJMail" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image21','','${ctx}/img/report//lan-077.gif',1)"><img name="Image21" border="0" src="${ctx}/img/report/lan-07.gif" width="98" height="27"></a></td>
			<td width="98"><a href="${ctx}/report/MailCX" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image22','','${ctx}/img/report//lan-066.gif',1)"><img name="Image22" border="0" src="${ctx}/img/report/lan-06.gif" width="98" height="27"></a></td>
			<td width="500" height="27" align="right"><script language="JavaScript"> dispdate();</script><span id="lblTime"></span>&nbsp;&nbsp;</td>
	    </tr>
	  	</tbody>
	</table>
	<table width="1000" border="0" align="center" cellspacing="0" cellpadding="0">
	    <tbody><tr> 
	      <td><img src="${ctx}/img/report/lan-00.gif" width="1000" height="34"></td>
	    </tr></tbody>
	</table>
   
	<script language=javascript>
		updateTime();
	</script>
</body>

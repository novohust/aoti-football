<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="today"/>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
	<%@ include file="/common/head-inner.jsp"%>

    <style type="text/css">
    #date-choose-wrapper input,#date-choose-wrapper select{
        margin-bottom: 0;
    }
    iframe{
      width:100%;
    }
    .container{width:1000px!important;}
    </style>
  </head>
  <body>

    <div class="container">

	<%@ include file="/common/header.jsp"%>


       <ul id="myTab" class="nav nav-tabs">
              <li class=""><a href="#body-info" data-toggle="tab">体能</a></li>
              <li class=""><a href="#skill" data-toggle="tab">技战术</a></li>
              <li class="">
                <a href="#collect" class="dropdown-toggle" data-toggle="tab">设备采集</a>
              </li>
              <li id="date-choose-wrapper" style="float:right;">
                  <button class="btn">打印</button>
                  <input id="date" type="text" placeholder="请选择日期"  value="${today}" class="datepicker-dropdown-year-month input-medium" onchange="refresh();">
                  <select name="" id="period" class="input-small" onchange="refresh();">
                    <option value="Morning">上午</option>
                    <option value="Afternoon">下午</option>
                  </select>
              </li>
            </ul>

            <div id="myTabContent" class="tab-content">
              <div class="tab-pane fade" id="body-info">
                <iframe base="${ctx}/data/player/body-info" src="${ctx}/data/player/body-info?playerId=${playerId}&date=${today}&period=Morning" frameborder="0" scrolling=no></iframe>
              </div>
              <div class="tab-pane fade" id="skill">
                <iframe base="${ctx}/data/player/skills" src="${ctx}/data/player/skills?playerId=${playerId}&date=${today}&period=Morning" frameborder="0" scrolling=no></iframe>
              </div>
              <div class="tab-pane fade" id="collect">
                <iframe src="data-collect-admin.html" frameborder="0" scrolling=no></iframe>
              </div>
            </div>
    </div> <!-- /container -->

    <%@ include file="/common/import-js.jsp"%>

    <script type="text/javascript">
    function reinitIframe(){
    var iframes = $("iframe");
    iframes.each(function(i,e){
        var iframe = e;
            try{
            var bHeight = iframe.contentWindow.document.body.scrollHeight;
            var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
             var height = Math.max(bHeight, dHeight);
             iframe.height =  height;
           }catch (ex){}
    });
  }

    window.setInterval("reinitIframe()", 200);

	var playerId = ${playerId};
    function refresh(){
    	$('iframe').each(function(i,e){
    		var date = $("#date").val();
    		var period = $('#period option:selected').val();
    		if(date && period)
    			$(e).attr('src',$(e).attr('base')+"?playerId="+playerId+"&date="+date+"&period="+period);
    		//$('.ui-datepicker').hide();
    	});
    }

</script>

  </body>
</html>

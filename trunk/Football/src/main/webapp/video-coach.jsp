<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="today"/>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
<%@ include file="/common/head-inner.jsp"%>
  </head>

  <body>

    <div class="container">
      <%@ include file="/common/header.jsp"%>

        <input id="date" type="text" placeholder="请选择日期"  value="${today}" class="datepicker-dropdown-year-month input-medium" onchange="refresh();">
        <select name="" id="period" class="input-small" onchange="refresh();">
          <option value="Morning">上午</option>
          <option value="Afternoon">下午</option>
        </select>


	<div id="list">
	</div>

    </div> <!-- /container -->
    <script type="text/html" id="tmp">
		<@ $.each(types,function(type,des){ @>
			<div class="video-type-wrapper">
				<div class="video-type <@=data[type]==0?'video-disabled':''@>" href='<@= href + "&type=" + type @>'>
					<span class="type-name"><@=des@><span>
					<span class="label <@=data[type]>0?'label-success':'label-important'@>"><@=data[type]@></span>
				</div>
			</div>
		<@ }); @>
    </script>

    <%@ include file="/common/import-js.jsp"%>
	<script type="text/javascript">
		var coachId = ${coachId};
		var teamId = ${coach.team.id};
		var types;
		function refresh(){
			var date = $("#date").val();
			var period = $("#period option:selected").val();
			$.get($.appCtx+"/video/coach-video-list",{
				"coachId":coachId,
				"date":date,
				"period":period
			},function(data){
				var href = $.appCtx + "/video/watch?teamId="+teamId+"&date="+date+"&period="+period;
				$('#list').html(template.render("tmp",{"types":types,"$":$,"data":data,"href":href}));
				$(".video-type").click(function(){
					if($(this).is('.video-disabled'))return;
					window.open($(this).attr('href'),"_blank");
				});
			});
		}
		$(function(){
			$.get($.appCtx+"/video/allTypes",function(data){
				types = data;
				refresh();
			});
		});
	</script>

  </body>
</html>

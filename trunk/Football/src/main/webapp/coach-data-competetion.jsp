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
      height:2000px;
    }
    .container{width:1000px!important;}
    .datectrl{border-bottom: 0px solid #ddd;}
    </style>

  </head>

   <body >

    <div class="container">
     	<%@ include file="/common/header.jsp"%>
            <form>
     	      <ul id="myTab" class="nav nav-tabs datectrl">
              <li class="itemtitle">2013年5月12日上午比赛-卓尔vs鲁能</li>
              <li id="date-choose-wrapper" style="float:right;">
                  <input id="date" type="text" placeholder="请选择日期"  value="${today}" class="datepicker-dropdown-year-month input-medium" onchange="refresh();">
                  <select name="" id="period" class="input-small" onchange="refresh();">
                    <option value="Morning">上午</option>
                    <option value="Afternoon">下午</option>
                  </select>
              </li>
             </ul>
            </form>

         <iframe id="competetiondetail" base="${ctx}/data/player/competetion" src="${ctx}/data/player/competetion?playerId=${teamId}&date=${today}&period=Morning" frameborder="0" scrolling=no></iframe>

    	<!--<div id="competetiondetail"></div> -->
    </div> <!-- /container -->
  </body>
   <%@ include file="/common/import-js.jsp"%>
   <script type="text/javascript">
   function init(){
	   var link = "${ctx}/data/player/competetion?playerId="+${teamId}+"&date="+$('#date').val()+"&period=Morning";
	   $('#competetiondetail').load(link);
   }
      function refresh(){

    	  //球队id，时间，上下午参数
    	  var teamId = ${teamId};
          var date   = $('#date').val();
          var period = $('#period option:selected').val();
          var link   ="${ctx}/data/player/competetion?playerId="+teamId+"&date="+date+"&period="+period;
          $('#competetiondetail').attr('src',link);
      }
   </script>


</html>

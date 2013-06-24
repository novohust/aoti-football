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
    .brief{margin-top: 56px}
    .inli{
        list-style: none;
        display:block;
      }
      .techtable{
        position: absolute;
        padding-top: 50px;
      }
    </style>
  </head>

   <body>

    <div class="container">
     	<%@ include file="/common/header.jsp"%>

     	<ul id="myTab" class="nav nav-tabs datectrl">
         <li><span class="itemtitle" >球员技术统计-上传</span></li>
      </ul>

       <ul id="myTab" class="nav nav-tabs datectrl" style="float:left">
              <li id="date-choose-wrapper" >
                  <select name="" id="playerlist" class="input-small" onchange="refresh()" >
                   <c:forEach items="${players}" var="item">
	                    <option value="${item.id}">${item.number}-${item.name}</option>
                    </c:forEach>
                  </select>
              </li>

              <li id="date-choose-wrapper" >
                  <input id="datefrom" type="text" placeholder="请选择日期"  value="${today}" class="datepicker-dropdown-year-month input-medium" onchange="refresh()" >
                  <select name="" id="period" class="input-small" onchange="refresh()" >
                    <option value="">上午</option>
                    <option value="">下午</option>
                  </select>
              </li>
        </ul>



    </div> <!-- /container --><!-- 默认加载全队当天上午的数据 -->
           <iframe id="playercompetetiondetail" base="${ctx}/data/player/adminPlyaeruploadGet" src="${ctx}/data/player/adminPlyaeruploadGet?playerId=1&date=${today}&period=Morning" frameborder="0" scrolling=no></iframe>
   </body>

  <%@ include file="/common/import-js.jsp"%>
  		<script type="text/javascript">
	        function fresh(){
	        	 var playerId = ${teamId};
	             var date   = $('#date').val();
	             var period = $('#period').val();
	             var playerId = $('#playerlist option:selected').val();//获取选中的队员id
	             $('#playercompetetiondetail').attr('src',link);
	   		}
        </script>
</html>

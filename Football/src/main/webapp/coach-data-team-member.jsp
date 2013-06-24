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
         <li><span class="itemtitle" >球员技术统计-浏览&nbsp;&nbsp;&nbsp;<a href="${ctx}/data/player/adminPlyaerupload?teamId=${teamId}" >管理员上传</a></span></li>
      </ul>

       <ul id="myTab" class="nav nav-tabs datectrl" style="float:left">
              <li><span class="itemtitle itemsubtitle">筛选条件：</span><li>
              <li id="date-choose-wrapper" >
                  <select name="" id="playerlist" class="input-small">
                    <option value="0">全球队</option> <!-- 注意，全球队的playerId号用0特别指代 -->
                   <c:forEach items="${players}" var="item">
	                    <option value="${item.id}">${item.number}-${item.name}</option>
                    </c:forEach>
                  </select>
              </li>

              <li id="date-choose-wrapper" >
                  <input id="datefrom" type="text" placeholder="请选择日期"  value="${today}" class="datepicker-dropdown-year-month input-medium" >
                  <select name="" id="periodfrom" class="input-small">
                    <option value="Morning">上午</option>
                    <option value="Afternoon">下午</option>
                  </select>
              </li>
              <li id="date-choose-wrapper">至</li>
              <li id="date-choose-wrapper" >
                  <input  id="dateto" type="text" placeholder="请选择日期"  value="${today}" class="datepicker-dropdown-year-month input-medium" >
                  <select name="" id="periodto" class="input-small">
                    <option value="Morning">上午</option>
                    <option value="Afternoon">下午</option>
                  </select>
              </li>
              <li><button class="btn" onclick="search()">查询</button></li>
        </ul>



    </div> <!-- /container --><!-- 默认加载全队当天上午的数据 ,0代表权球队-->
           <iframe id="playercompetetiondetail" base="${ctx}/data/player/sumDetail" src="${ctx}/data/player/sumDetail?teamId=${teamId}&playerId=0&datefrom=${today}&periodfrom=Morning&dateto=${today}&periodto=Morning" frameborder="0" scrolling=no></iframe>
   </body>

  <%@ include file="/common/import-js.jsp"%>
  		<script type="text/javascript">
	        function search(){
	        	 var teamId = ${teamId};
	             var datefrom   = $('#datefrom').val();
	             var dateto     = $('#dateto').val();
	             var periodfrom = $('#periodfrom option:selected').val();
	             var periodto = $('#periodto option:selected').val();
	             var playerId = $('#playerlist option:selected').val();//获取选中的队员id
	             var link   ="${ctx}/data/player/sumDetail?teamId="+teamId+"&playerId="+playerId+"&datefrom="+datefrom+"&periodfrom="+periodfrom+"&dateto="+dateto+"&periodto="+periodto;

	             $('#playercompetetiondetail').attr('src',link);
	   		}
        </script>
</html>

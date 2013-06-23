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
         <li><span class="itemtitle" >球员技术统计</span></li>
      </ul>

       <ul id="myTab" class="nav nav-tabs datectrl" style="float:left">
              <li><span class="itemtitle itemsubtitle">筛选条件：</span><li>
              <li id="date-choose-wrapper" >
                  <select name="" id="" class="input-small">
                    <option value="">全球队</option>
                    <option value="">张猛</option>
                    <option value="">张三</option>
                    <option value="">李四</option>
                    <option value="">王五</option>
                  </select>
              </li>

              <li id="date-choose-wrapper" >
                  <input id="date" type="text" placeholder="请选择日期"  value="${today}" class="datepicker-dropdown-year-month input-medium" onchange="refresh();">
                  <select name="" id="" class="input-small">
                    <option value="">上午</option>
                    <option value="">下午</option>
                  </select>
              </li>
              <li id="date-choose-wrapper" >
                  <input type="text" placeholder="请选择截止日期" class="datepicker-dropdown-year-month input-medium">
                  <select name="" id="" class="input-small">
                    <option value="">上午</option>
                    <option value="">下午</option>
                  </select>
              </li>
              <li><button class="btn" onclick="search()">查询</button></li>
              <li><button class="btn">导入</button> </li>
        </ul>



    </div> <!-- /container -->
           <iframe id="playercompetetiondetail" base="${ctx}/data/player/sumDetail" src="${ctx}/data/player/sumDetail?playerId=${teamId}&date=${today}&period=Morning" frameborder="0" scrolling=no></iframe>
   </body>

  <%@ include file="/common/import-js.jsp"%>
  		<script type="text/javascript">
	        function search(){

	   		}
        </script>
</html>

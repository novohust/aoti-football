<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<%@ include file="/common/head-inner.jsp"%>
	<style type="text/css">
		      .club-wrapper{
        margin: 0;
        width: 50%;
        float: left;
      }
      .club{
        margin: 16px;
        height: 70px;
        font-size: 25px;
        font-weight: bold;
        display: block;
        line-height: 70px;
        text-align: center;
        color: #777;
              background-image: -moz-linear-gradient(top, #FFF, #F4F4F4);
      background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#FFF), to(#F4F4F4));
      background-image: -webkit-linear-gradient(top, #FFF, #F4F4F4);
      background-image: -o-linear-gradient(top, #FFF, #F4F4F4);
      background-image: linear-gradient(to bottom, #FFF, #F4F4F4);
        text-shadow: 0 1px 0 #FFF;
        border: solid 1px #DDD;
        border-radius: 4px;
        box-shadow: 0px 1px 4px #DDD;
      }
	</style>
</head>


  <body onload="load()">

    <div class="container">
    	<%@ include file="/common/head-inner.jsp"%>

      <div class="club-wrapper"><a href="team.jsp" class="club">中超俱乐部</a></div>
      <div class="club-wrapper"><a href="team.html" class="club">中甲俱乐部</a></div>
      <div class="club-wrapper"><a href="#" class="club">中乙俱乐部</a></div>
      <div class="club-wrapper"><a href="#" class="club">中乙俱乐部</a></div>
      <div class="club-wrapper"><a href="#" class="club">省级运动队</a></div>
      <div class="club-wrapper"><a href="#" class="club">市级运动队</a></div>

      <c:if test="${!empty clubMap}">
		<c:forEach items="${clubMap}" var="item">
		  <div class="club-wrapper"><a href="${ctx}/club?club.id="+${item.value.id}  class="club">${item.value.name}</a></div>
		</c:forEach>
	  </c:if>

    </div> <!-- /container -->

    <%@ include file="/common/import-js.jsp"%>

  </body>
</html>

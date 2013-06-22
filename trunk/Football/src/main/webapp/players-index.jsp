<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <%@ include file="/common/head-inner.jsp"%>
  </head>

   <body>

    <div class="container">

     <%@ include file="/common/header.jsp"%>

      <h5>队员</h5>
      <div class="shadowed-box">
        <ul class="nav nav-pills">
        	<c:forEach items="${playersMap}" var="item">
        		<li>
	         		<c:if test="${sessionScope.ACCOUNT.role == 'Coach'}">
	          	   		<a href="#"
	              		data-toggle="popover" data-content='<a href="${ctx}/data/player/introduction?playerId=${item.id}">简介</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${ctx}/data/player/index?playerId=${item.account.id}">数据</a>'
	                    data-html="true"
	              		data-placement="top"
	             		style="font-weight:bold;">${item.name}</a>
	         		</c:if>
	         		<c:if test="${sessionScope.ACCOUNT.role != 'Coach'}">
	         			<c:if test="${sessionScope.ACCOUNT.id != item.account.id}">
	         				<span>${item.name}</span>
	         			</c:if>
	         			<c:if test="${sessionScope.ACCOUNT.id == item.account.id}">
	         				<a href="#"
	              				data-toggle="popover" data-content='<a href="${ctx}/data/player/introduction?playerId=${item.id}">简介</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${ctx}/data/player/index?playerId=${item.account.id}">数据</a>'
	                    		data-html="true"
	              				data-placement="top"
	             				style="font-weight:bold;">${item.name}</a>
	         			</c:if>
	         		</c:if>
         		</li>
         	</c:forEach>
        </ul>
      </div>

      <h5>教练</h5>
      <div class="shadowed-box">
        <ul class="nav nav-pills">
          <li class="block">
             <c:forEach items="${coachesMap}" var="item">
            	<span>${item.name}&nbsp;&nbsp;&nbsp;${item.description}&nbsp;&nbsp;&nbsp;
            	     <fmt:formatDate value="${item.startTime}" pattern="yyyy-MM-dd"/>
            	     - <fmt:formatDate value="${item.endTime}" pattern="yyyy-MM-dd"/>
            	    </span>
            </c:forEach>
          </li>
        </ul>
      </div>
    </div> <!-- /container -->
  </body>

  <%@ include file="/common/import-js.jsp"%>
</html>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <%@ include file="/common/head-inner.jsp"%>
  </head>

   <body>

    <div class="container">

      <div class="masthead">

        <ul class="nav nav-pills pull-right">
          <li class="active"><a href="#">数据</a></li>
          <li><a href="#">视频</a></li>
        </ul>

        <div class="user-info pull-right">
              <span class="user-name">
                  <i class="icon-user"></i>
                   <label for="">欢迎回来!<strong>
                    <c:if test="${sessionScope.ACCOUNT.role == 'Player'}">
                  	 	<c:out value="${sessionScope.PLAYER.name}"/>
                  	</c:if>
                  	<c:if test="${sessionScope.ACCOUNT.role == 'Coach'}">
                  	 	<c:out value="${sessionScope.COACH.name}"/>
                  	</c:if>
                  </strong></label>
              </span>
              <c:if  test="${sessionScope.ACCOUNT != null}">
              <a href="${ctx}/logout">退出</a>
              </c:if>
            </div>
        <h3 class="muted">中国足球数据服务中心
              <ul class="breadcrumb">
                <li><a href="#">卓尔</a> <span class="divider">/</span></li>
                <li>俱乐部信息 </li>
              </ul>
        </h3>
      </div>

      <hr>

      <h5>队员</h5>
      <div class="shadowed-box">
        <ul class="nav nav-pills">
        	<c:if test="${sessionScope.ACCOUNT.role == 'Player'}">
             	<c:out value="${sessionScope.PLAYER.name}"/>
        	</c:if>

        	<c:forEach items="${playersMap}" var="item">
        		<li>
	         		<c:if test="${sessionScope.ACCOUNT.role == 'Coach'}">
	          	   		<a href="#"
	              		data-toggle="popover" data-content='<a href="${ctx}/player/introduction/${item.id}">简介</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${ctx}/player/data/${item.account_id}">数据</a>'
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
	              				data-toggle="popover" data-content='<a href="${ctx}/player/introduction/${item.id}">简介</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${ctx}/player/data/${item.account_id}">数据</a>'
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
            <li class="block"><span>张三&nbsp;&nbsp;&nbsp;主教练&nbsp;&nbsp;&nbsp;现任</span></li>
            <li class="block"><span>李四&nbsp;&nbsp;&nbsp;主教练&nbsp;&nbsp;&nbsp;10-12赛季</span></li>
            <li class="block"><span>王五&nbsp;&nbsp;&nbsp;助理教练&nbsp;&nbsp;&nbsp;09年11月--13年02月</span></li>
          </ul>
      </div>


    </div> <!-- /container -->
  </body>

  <%@ include file="/common/import-js.jsp"%>
</html>

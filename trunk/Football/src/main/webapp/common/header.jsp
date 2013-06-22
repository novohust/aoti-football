<%@ page contentType="text/html;charset=UTF-8"%>
<div class="masthead">
<a style="display:none" href="${ctx}" id="app-ctx"></a>
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
              	<a id="logflag" href="${ctx}/logout">退出</a>
              </c:if>
        </div>
        <h3 class="muted">中国足球数据服务中心
              <ul class="breadcrumb">
                 <c:if test="${sessionScope.ACCOUNT.role == 'Coach'}">
                	<li>
                	<a href="${ctx}/index.jsp">test

                	  </a><span class="divider">/</span></li>
                	<li><c:out value="${sessionScope.COACH.name}"/></li>
				</c:if>
                <c:if test="${sessionScope.ACCOUNT.role == 'Player'}">
                	<li>
                	<a href="${ctx}/index.jsp">test
                	 </a> <span class="divider">/</span></li>
                	<li><c:out value="${sessionScope.PLAYER.name}" /> </li>
                </c:if>
              </ul>
        </h3>
      </div>
      <hr>
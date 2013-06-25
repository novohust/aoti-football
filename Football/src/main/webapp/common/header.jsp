<%@ page contentType="text/html;charset=UTF-8"%>
<div class="masthead">
<a style="display:none" href="${ctx}" id="app-ctx"></a>
	<c:if  test="${sessionScope.ACCOUNT != null}">

        <!-- 视频 数据 导航条 -->
        <ul class="nav nav-pills pull-right">
          <li class='${curTab eq null?"active":""}'>
          	<a <c:if test="${sessionScope.ACCOUNT.role == 'Player'}">
                  	 	href="${ctx}/data/player/index?playerId=${sessionScope.PLAYER.id}"
               </c:if>
               <c:if test="${sessionScope.ACCOUNT.role == 'Coach'}">
                  	 	href="${ctx}/data/player/getTeam?teamId=${sessionScope.COACH.team.id}"
               </c:if>
               <c:if test="${sessionScope.ACCOUNT.role == 'Admin'}">
                  	 	href="${ctx}/data/player/getTeam?teamId=${sessionScope.TEAM.id}"
               </c:if>
                  >数据</a>
          </li>
          <li class='${curTab=="video"?"active":""}'><a
				<c:if test="${sessionScope.ACCOUNT.role == 'Player'}">
                  	 	href="${ctx}/video/player?playerId=${sessionScope.PLAYER.id}"
               </c:if>
				<c:if test="${sessionScope.ACCOUNT.role == 'Coach'}">
                  	 	href="${ctx}/video/coach?coachId=${sessionScope.COACH.id}"
               </c:if>
				<c:if test="${sessionScope.ACCOUNT.role == 'Admin'}">
                  	 	href="${ctx}/video/admin?teamId=${sessionScope.TEAM.id}"
               </c:if>
           >视频</a></li>
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
                  	<c:if test="${sessionScope.ACCOUNT.role == 'Admin'}">
	               	 	<c:out value="${sessionScope.ACCOUNT.username}"/>
                  	</c:if>
                  </strong></label>
              </span>
              <a id="logflag" href="${ctx}/logout">退出</a>
        </div>
       </c:if>

        <h3 class="muted">中国足球数据服务中心
              <ul class="breadcrumb">
                 <c:if test="${sessionScope.ACCOUNT.role == 'Coach'}">
                	<li>
                	<a href="${ctx}/data/player/getTeam?teamId=${sessionScope.COACH.team.id}">
                	    <c:if test="${!empty sessionScope.COACH.team  }">
                	 	  <c:out value="${sessionScope.COACH.team.name}" />
                	    </c:if>

                	</a></li>
	                 <c:if test="${player!=null}">
						<span class="divider">/</span>
                		<li>${player.name}</li>
                	</c:if>
				</c:if>

                <c:if test="${sessionScope.ACCOUNT.role == 'Player'}">
                	<li>
                	<a href="${ctx}/data/player/getTeam?teamId=${sessionScope.PLAYER.team.id}">
                	   <c:if test="${!empty sessionScope.PLAYER.team }">
                	 	 <c:out value="${sessionScope.PLAYER.team.name}"/>
                	   </c:if>
                	 </a></li>

					<% // 有可能球员在查看球队信息，此时不应该在面包屑上显示到球员的层级 %>
	                 <c:if test="${player!=null}">
	                 	<span class="divider">/</span>
                		<li>${player.name}</li>
                	</c:if>
                </c:if>

                <c:if test="${sessionScope.ACCOUNT.role == 'Admin'}">
                	<li>
                	<%// team在admin登录查看某个球队信息时被保存在session中 -- team.jsp %>
                	<a href="${ctx}/data/player/getTeam?teamId=${sessionScope.TEAM.id}">
                		${sessionScope.TEAM.name}
                	 </a></li>

	                 <c:if test="${player!=null}">
	                 	<span class="divider">/</span>
                		<li>${player.name}</li>
                	</c:if>
                </c:if>
              </ul>
        </h3>
      </div>
      <hr>
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
                  <i class="icon-user"></i><label for="">欢迎回来!<strong><c:out value="${sessionScope.ACCOUNT.username}"/></strong></label>
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
            <li><span>李四</span></li>
            <li><a href="#"
              data-toggle="popover" data-content='<a href="${ctx}/player/introduction">简介</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${ctx}/player/data">数据</a>'
              data-html="true"
              data-placement="top"
              style="font-weight:bold;">张猛</a></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
            <li><span>李四</span></li>
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

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


  <body>

    <div class="container">

      <div class="masthead">

        <ul class="nav nav-pills pull-right">
          <li class="active"><a href="#">数据</a></li>
          <li><a href="#">视频</a></li>
        </ul>

        <div class="user-info pull-right">
              <span class="user-name">
                  <i class="icon-user"></i><label for="">欢迎回来，<strong>admin</strong></label>
              </span>
              <a href="">退出</a>
            </div>
        <h3 class="muted">中国足球数据服务中心
              <ul class="breadcrumb">
                <li><a href="#">卓尔</a> <span class="divider">/</span></li>
                <li>张猛 </li>
              </ul>
        </h3>
      </div>

      <hr>

      <div class="club-wrapper"><a href="team.jsp" class="club">中超俱乐部</a></div>
      <div class="club-wrapper"><a href="team.html" class="club">中甲俱乐部</a></div>
      <div class="club-wrapper"><a href="#" class="club">中乙俱乐部</a></div>
      <div class="club-wrapper"><a href="#" class="club">中乙俱乐部</a></div>
      <div class="club-wrapper"><a href="#" class="club">省级运动队</a></div>
      <div class="club-wrapper"><a href="#" class="club">市级运动队</a></div>



    </div> <!-- /container -->

    <%@ include file="/common/import-js.jsp"%>

  </body>
</html>

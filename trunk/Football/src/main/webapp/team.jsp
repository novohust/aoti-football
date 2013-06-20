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

      .login{
        width: 300px;
        height: 300px;

      }
      .logindialog{
         list-style: none;
      }

      .team{
        padding: 0;
        margin: 0;
        list-style: none;
        display:inline;
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
                  <i class="icon-user"></i><label for="">欢迎回来!<strong><c:out value="${sessionScope.ACCOUNT.username}"/></strong></label>
              </span>
              <c:if  test="${sessionScope.ACCOUNT != null}">
              	<a href="${ctx}/logout">退出</a>
              </c:if>
            </div>
        <h3 class="muted">中国足球数据服务中心
              <ul class="breadcrumb">
                <li><a href="#">卓尔</a> <span class="divider">/</span></li>
                <li>张猛 </li>
              </ul>
        </h3>
      </div>
      <hr>

      <!-- start 俱乐部球队列表-->
      <ul  >
        <li class="team">
            <a href="#loginModal" role="button" class="btn" data-toggle="modal">
            <img height="50"  src="${ctx}/upload/images/1.png" alt="武汉卓尔">
            <span display:="" block="" style=" display: block;">武汉卓尔</span>
          </a>

        </li>
        <li class="team">
          <a href="#loginModal" role="button" class="btn" data-toggle="modal">
            <img height="50"  src="${ctx}/upload/images/2.png" alt="武汉卓尔">
            <span display:="" block="" style=" display: block;">上海申鑫</span>
            </a>
        </li >
        <li class="team">
          <a href="#loginModal" role="button" class="btn" data-toggle="modal">
            <img height="50"  src="${ctx}/upload/images/1.png" alt="武汉卓尔">
            <span display:="" block="" style=" display: block;">大连实德</span>
            </a>
        </li>
        <li class="team">
          <a href="#loginModal" role="button" class="btn" data-toggle="modal">
            <img height="50"  src="${ctx}/upload/images/2.png" alt="武汉卓尔">
            <span display:="" block="" style=" display: block;">武汉卓尔</span>
            </a>
        </li>
         <li class="team">
          <a href="#loginModal" role="button" class="btn" data-toggle="modal">
            <img height="50"  src="${ctx}/upload/images/3.png" alt="武汉卓尔">
            <span display:="" block="" style=" display: block;">武汉卓尔</span>
            </a>
        </li>
        </ul>
       <ul >
        <li class="team">
          <a href="#loginModal" role="button" class="btn" data-toggle="modal">
            <img height="50"  src="${ctx}/upload/images/1.png" alt="武汉卓尔">
            <span display:="" block="" style=" display: block;">武汉卓尔</span>
            </a>
        </li>

        <li class="team">
          <a href="#loginModal" role="button" class="btn" data-toggle="modal">
            <img height="50" src="${ctx}/upload/images/2.png" alt="武汉卓尔">
            <span display:="" block="" style=" display: block;">武汉卓尔</span>
            </a>
        </li>
        <li class="team">
          <a href="#loginModal" role="button" class="btn" data-toggle="modal">
            <img height="50"  src="${ctx}/upload/images/3.png" alt="武汉卓尔">
            <span display:="" block="" style=" display: block;">武汉卓尔</span>
            </a>
        </li>
         <li class="team">
          <a href="#loginModal" role="button" class="btn" data-toggle="modal">
            <img height="50"  src="${ctx}/upload/images/2.png" alt="武汉卓尔">
            <span display:="" block="" style=" display: block;">武汉卓尔</span>
            </a>
        </li>
         <li class="team">
          <a href="#loginModal" role="button" class="btn" data-toggle="modal">
            <img height="50"  src="${ctx}/upload/images/1.png" alt="武汉卓尔">
            <span display:="" block="" style=" display: block;">武汉卓尔</span>
            </a>
        </li>
      </ul>

       <!--end俱乐部球队列表 -->


    </div> <!-- /container -->


    <!-- Modal -->
    <div id="loginModal" class="modal hide fade login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel" >登录</h3>
      </div>
      <div class="modal-body logindialog">
      <form  id="login-form" action="${ctx}/login" method="post">
         <fieldset>
         <div class="error">
         <font color="red"><p id="msg"> </p></font>
         </div>
         <li >登录名：</li>
         <input id="username" name="username" type="text"/>
         <li>登录密码：</li>
         <input id="password" name="password" type="password" />
         <li><font color="red"><span id="msg"></span><font><li>
      </fieldset>
      </form>
      </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        <button class="btn btn-primary" onclick="postLogin();">登录</button>
      </div>
    </div>


   <%@ include file="/common/import-js.jsp"%>

    <script type="text/javascript">
      function teamClick(){
        $("#loginModal").modal();
      }
      function postLogin(){
    	  var account = $("#account").val();

    	  if(account != null)
    	  {
    		  location.href ="players-index.jsp";
    	  }else
    	  {
    	  	checklogin();
    	  	}
      }

      //检查账号密码为空
      function checklogin(){
    	  var uname = document.getElementById('username');
    	  var pwd   = document.getElementById('password');
    	  var msg   = document.getElementById('msg');
    	  msg.innerHTML ='';

    	  if((uname.value.length == 0) || (uname.value == null))
    	  {
			 msg.innerHTML="登录名不能为空"
    		 uname.focus();
    	  }
    	  else if((pwd.value.length == 0) || (pwd.value == null))
    	  {
			 msg.innerHTML="登录密码不能为空"
    		 pwd.focus();
    	  }else {
			$('#login-form').ajaxSubmit({
			resetForm:true,
			beforeSubmit:function(){},
			success:function(data){
				 var account = $("#account").val();
				var messsage  = eval(data).errorMsg;
				if(messsage == "wrong")
				{
					 msg.innerHTML="登录名或密码错误";
					 uname.focus();
				}else
				{
					location.href ="players-index.jsp";
				}
			}
			});
    	  }

      }

    </script>
  </body>
</html>

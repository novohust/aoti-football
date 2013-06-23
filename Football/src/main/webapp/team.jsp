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
        width: 248px;
        margin-left: -124px;
      }
      .logindialog{
         list-style: none;
      }

    .team-wrapper{
        float: left;
      }
      .team{
        padding: 0;
        margin: 10px 15px;
        list-style: none;
        display:inline;
      }
      .team img{
      	width:85px;
      	height:85px;
      }
    </style>
  </head>

  <body>

    <div class="container">

     <%@ include file="/common/header.jsp"%>

      <!-- start 俱乐部球队列表-->
       <c:if test="${!empty teamMap}">
		<c:forEach items="${teamMap}" var="item">
		  <div class="team-wrapper team">
		       <a href="javascript:" onclick="teamClick(${item.id});" role="button" class="btn" data-toggle="modal">
		       	<img  src="${ctx}${item.flagpath}" alt=${item.name}>
		       	<span display:="" block="" style=" display: block;">${item.name}</span>
		       </a>
		  </div>
		</c:forEach>
	  </c:if>
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
         <font color="red"><p id="msg" class="alert alert-error" style="display:none"> </p></font>
         </div>
         <li >登录名：</li>
         <input id="username" name="username" type="text"/>
         <li>登录密码：</li>
         <input id="password" name="password" type="password" style="margin-bottom:0;"/>
         <li><font color="red"><span id="msg"></span><font><li>
      </fieldset>
      </form>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" onclick="postLogin();">登录</button>
      </div>
    </div>


   <%@ include file="/common/import-js.jsp"%>

    <script type="text/javascript">
      var clickedTeamId;
      function teamClick(teamId){
    	  clickedTeamId = teamId;
    	  var logflag = document.getElementById("logflag");
    	    if (logflag == null)
        	{
    		  $("#loginModal").modal();
        	}
    	  	else
        	{
        		location.href ="${ctx}/data/player/getTeam?teamId="+teamId;
        	}
      }

      //检查账号密码为空
      function postLogin(){
    	  var uname = document.getElementById('username');
    	  var pwd   = document.getElementById('password');
    	  var msg   = document.getElementById('msg');
    	  msg.innerHTML ='';

    	  if((uname.value.length == 0) || (uname.value == null))
    	  {
			 msg.innerHTML="登录名不能为空"
			 $(msg).show();
    		 uname.focus();
    	  }
    	  else if((pwd.value.length == 0) || (pwd.value == null))
    	  {
			 msg.innerHTML="登录密码不能为空"
			 $(msg).show();
    		 pwd.focus();
    	  }else {
    		$(msg).hide();
			$('#login-form').ajaxSubmit({
			resetForm:true,
			beforeSubmit:function(){},
			success:function(data){
				var messsage  = eval(data).errorMsg;
				if(messsage == "wrong")
				{
					 msg.innerHTML="登录名或密码错误";
					 $(msg).show();
					 uname.focus();
				}else
				{
					location.href ="${ctx}/data/player/getTeam?teamId="+clickedTeamId;
				}
			}
			});
    	  }
      }

    </script>
  </body>
</html>

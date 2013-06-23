<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <%@ include file="/common/head-inner.jsp"%>
    <style type="text/css">
		#listWrap{
			float:left;
			margin-left: 10px;
			width:240px;
		}
		#listWrap a{
			line-height:17px;
		}
		#myplayer_wrapper{
			float:left;
		}
    </style>
  </head>

  <body>

    <div class="container">

      <%@ include file="/common/header.jsp"%>

    <div >
      <h3>${date}${period.description}&nbsp;${team ne null ? team.name:""}${player ne null ? player.name:""}&nbsp;${type.description}</h3>
      <!-- start 播放器-->
    <div id="myplayer"></div>
    <!-- end播放器-->

    <ul id="listWrap" class="nav nav-pills nav-stacked" data-temp="0">
    	<c:forEach var="video" items="${videos}">
	      <li class="s-l">
	        <a href="#" onclick="itemClick(event,'${ctx}${video.videoPath}','${video.name}')"  class="listitem"  >
	        	${video.name}
	        </a>
	      </li>
    	</c:forEach>
    </ul>
    <!--
    <input type="button" class="player-play" value="播放" />
    <input type="button" class="player-stop" value="停止" />
    <input type="button" class="player-status" value="取得状态" />
    <input type="button" class="player-current" value="当前播放秒数" />-->
    </div>

    </div> <!-- /container -->

	<%@ include file="/common/import-js.jsp"%>

        <script type="text/javascript">
        var thePlayer;  //保存当前播放器以便操作
        $(function() {
                thePlayer = jwplayer('myplayer').setup({
                flashplayer: $.appCtx + '/static/swf/jwplayer.flash.swf',
                file:"${videos[0].videoPath}",
                title:"${videos[0].name}",
                width: 750,
                height: 500,
                dock: false
            });

            //播放 暂停
            $('.player-play').click(function() {
                if (thePlayer.getState() != 'PLAYING') {
                    thePlayer.play(true);
                    this.value = '暂停';
                } else {
                    thePlayer.play(false);
                    this.value = '播放';
                }
            });

            //停止
            $('.player-stop').click(function() { thePlayer.stop(); });

            //获取状态
            $('.player-status').click(function() {
                var state = thePlayer.getState();
                var msg;
                switch (state) {
                    case 'BUFFERING':
                        msg = '加载中';
                        break;
                    case 'PLAYING':
                        msg = '正在播放';
                        break;
                    case 'PAUSED':
                        msg = '暂停';
                        break;
                    case 'IDLE':
                        msg = '停止';
                        break;
                }
                alert(msg);
            });

            //获取播放进度
            $('.player-current').click(function() { alert(thePlayer.getPosition()); });

            //跳转到指定位置播放
            $('.player-goto').click(function() {
                if (thePlayer.getState() != 'PLAYING') {    //若当前未播放，先启动播放器
                    thePlayer.play();
                }
                thePlayer.seek(30); //从指定位置开始播放(单位：秒)
            });

            //获取视频长度
            $('.player-length').click(function() { alert(thePlayer.getDuration()); });

        });


      function itemClick(event,itemFile,title){
    	  $(event.target).closest('ul').find('.active').removeClass('active');
    	  $(event.target).closest('li').addClass('active');
    	  console.log(itemFile);
            jwplayer().load([{
              "file": itemFile,
              "title":title
            }]);
            jwplayer().play();
  		};
</script>
      }

    </script>
  </body>
</html>

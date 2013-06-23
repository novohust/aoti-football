<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <%@ include file="/common/head-inner.jsp"%>


    <style type="text/css">
        .thumbnail{margin-bottom: 20px}
        .colomn-1,.colomn-2,.colomn-3{float:left;}
        .colomn-1{
          width:200px;
        }
        .colomn-2{width:100px;margin:0 16px;}
        .colomn-2 .thumbnail{height:100px}
        .colomn-3{width:130px;}
        .colomn-3 .thumbnail{height:380px;}
        .area-1,.area-2,.area-3{float:left;}
        .area-2{margin: 0px 10px 0 2px;}
        .area-2 .thumbnail{height:166px;}
        .area-2 table{margin-bottom:148px;}
        table{font-size:11px!important;}
        .area-3 .thumbnail{height:334px;}
        .larger-margin{margin-bottom:110px;}
        .big-name{height: 180px;
			font-size: 40px;
			line-height: 140px;
			padding-left: 100px;
			font-weight: bold;
			color: #BBB;}
		.table-title{width:115px;}
		.thumbnail > img{width:100%;height:100%;}
		.pic-title{min-height:40px;}
    </style>
  </head>
  <a style="display:none" href="${ctx}" id="app-ctx"></a>
  <c:set var="nullTip" value="<em class='no-data-tip'>未上传</em>" scope="page"></c:set>
  <c:set var="entity" value="Skills"></c:set>
  <body>
      <!-- //area 1-->
      <div style="width:470px" class="area-1">
          <div>
              <div class="big-name">
                  ${player.name}
              </div>
            <!-- //col 1 -->
            <div class="colomn-1">
            	<c:if test="${(s eq null || s.goalAndAssist eq null) && ACCOUNT.role == 'Admin'}" >
                    <form action="${ctx}/data/player/import-excel" class="upload-form import-excel">
			          	<input type="file" name="excel" class="uploadify"/>
			          	<input type="hidden" name="entity" value="${entity}"/>
			          	<input type="hidden" name="playerId" value="${playerId}"/>
			          	<input type="hidden" name="period" value="${period}"/>
			          	<input type="hidden" name="date" value="${date}"/>

						<input type='hidden' name='attr' value='goalAndAssist'/>
						<input type='hidden' name='attr' value='shoot'/>
						<input type='hidden' name='attr' value='foul'/>
						<input type='hidden' name='attr' value='card'/>
						<input type='hidden' name='attr' value='offside'/>
						<input type='hidden' name='attr' value='moveTimes'/>
						<input type='hidden' name='attr' value='moveSuccessRate'/>
						<input type='hidden' name='attr' value='defence'/>
						<input type='hidden' name='attr' value='attack'/>
						<input type='hidden' name='attr' value='moveInOwnSide'/>
						<input type='hidden' name='attr' value='moveInMiddleArea'/>
						<input type='hidden' name='attr' value='moveInOtherSide'/>
			         </form>
					</c:if>
                    <table class="table  table-striped">
                        <tbody>
                        <tr>
                          <td class="table-title">进球/助攻</td>
                          <td>${s eq null || s.goalAndAssist eq null ? nullTip : s.goalAndAssist}</td>
                        </tr>
                        <tr>
                          <td class="table-title">射门/中目标</td>
                          <td>${s eq null || s.shoot eq null ? nullTip : s.shoot}</td>

                        </tr>
                        <tr>
                          <td class="table-title">犯规/受到犯规</td>
                          <td>${s eq null || s.foul eq null ? nullTip : s.foul}</td>
                        </tr>
                        <tr>
                          <td class="table-title">黄/红牌</td>
                          <td>${s eq null || s.card eq null ? nullTip : s.card}</td>
                        </tr>
                        <tr>
                          <td class="table-title">越位</td>
                          <td>${s eq null || s.offside eq null ? nullTip : s.offside}</td>
                        </tr>
                        <tr>
                          <td class="table-title">动作次数/成功次数</td>
                          <td>${s eq null || s.moveTimes eq null ? nullTip : s.moveTimes}</td>
                        </tr>
                        <tr>
                          <td class="table-title">动作次数/成功次数,%</td>
                          <td>${s eq null || s.moveSuccessRate eq null ? nullTip : s.moveSuccessRate}</td>
                        </tr>
                        <tr>
                          <td class="table-title">防守动作/成功</td>
                          <td>${s eq null || s.defence eq null ? nullTip : s.defence}</td>
                        </tr>
                        <tr>
                          <td class="table-title">进攻动作/成功</td>
                          <td>${s eq null || s.attack eq null ? nullTip : s.attack}</td>
                        </tr>
                        <tr>
                          <td class="table-title">在己方三分之一球场的动作次数</td>
                          <td>${s eq null || s.moveInOwnSide eq null ? nullTip : s.moveInOwnSide}</td>
                        </tr>
                        <tr>
                          <td class="table-title">在中场的动作次数</td>
                          <td>${s eq null || s.moveInMiddleArea eq null ? nullTip : s.moveInMiddleArea}</td>
                        </tr>
                        <tr>
                          <td class="table-title">在对方三分之一球场的动作次数</td>
                          <td>${s eq null || s.moveInOtherSide eq null ? nullTip : s.moveInOtherSide}</td>
                        </tr>
                        </tbody>
                    </table>
            </div>
            <!-- \\col 1 -->

            <!-- //col 2-->
            <div class="colomn-2">
              	<h5 class="pic-title">比赛中的动作
              		<c:if test="${(s eq null || s.moveImg eq null) && ACCOUNT.role == 'Admin'}" >
		        	<form action="${ctx}/data/player/import-img" class="upload-form import-img">
		        		<input type="file" name="img" class="uploadify"/>
			          	<input type="hidden" name="entity" value="${entity}"/>
			          	<input type="hidden" name="playerId" value="${playerId}"/>
			          	<input type="hidden" name="period" value="${period}"/>
			          	<input type="hidden" name="date" value="${date}"/>
			          	<input type='hidden' name='attr' value='moveImg'/>
		        	</form>
		        	</c:if>
				</h5>
              <div class="thumbnail larger-margin">
             	 <img src="${ctx}${(s eq null || s.moveImg eq null) ? '/static/img/placeholder_2.gif' : s.moveImg}">
              </div>
              <h5 class="pic-title">比赛中的动作成功
              		<c:if test="${(s eq null || s.moveRateImg eq null) && ACCOUNT.role == 'Admin'}" >
		        	<form action="${ctx}/data/player/import-img" class="upload-form import-img">
		        		<input type="file" name="img" class="uploadify"/>
			          	<input type="hidden" name="entity" value="${entity}"/>
			          	<input type="hidden" name="playerId" value="${playerId}"/>
			          	<input type="hidden" name="period" value="${period}"/>
			          	<input type="hidden" name="date" value="${date}"/>
			          	<input type='hidden' name='attr' value='moveRateImg'/>
		        	</form>
		        	</c:if>
              </h5>
              <div class="thumbnail">
              	<img src="${ctx}${(s eq null || s.moveRateImg eq null) ? '/static/img/placeholder_2.gif' : s.moveRateImg}">
              </div>
            </div>
            <!-- \\col 2-->

            <!-- //col 3-->
            <div class="colomn-3">
              <h5 class="pic-title">所有动作的地点
              		<c:if test="${(s eq null || s.movePlaceImg eq null) && ACCOUNT.role == 'Admin'}" >
		        	<form action="${ctx}/data/player/import-img" class="upload-form import-img">
		        		<input type="file" name="img" class="uploadify"/>
			          	<input type="hidden" name="entity" value="${entity}"/>
			          	<input type="hidden" name="playerId" value="${playerId}"/>
			          	<input type="hidden" name="period" value="${period}"/>
			          	<input type="hidden" name="date" value="${date}"/>
			          	<input type='hidden' name='attr' value='movePlaceImg'/>
		        	</form>
		        	</c:if>
              </h5>
              <div class="thumbnail">
              	<img src="${ctx}${(s eq null || s.movePlaceImg eq null) ? '/static/img/placeholder_2.gif' : s.movePlaceImg}">
              </div>
            </div>
            <!-- \\col 3-->

          </div>

  <div class="clearfix"></div>

          <div style="margin-top:20px">

            <!-- //col 1 -->
            <div class="colomn-1">
                    <c:if test="${(s eq null || s.battle eq null) && ACCOUNT.role == 'Admin'}" >
                    <form action="${ctx}/data/player/import-excel" class="upload-form import-excel">
			          	<input type="file" name="excel" class="uploadify"/>
			          	<input type="hidden" name="entity" value="${entity}"/>
			          	<input type="hidden" name="playerId" value="${playerId}"/>
			          	<input type="hidden" name="period" value="${period}"/>
			          	<input type="hidden" name="date" value="${date}"/>

						<input type='hidden' name='attr' value='battle'/>
						<input type='hidden' name='attr' value='striveWinRate'/>
						<input type='hidden' name='attr' value='defenceStrive'/>
						<input type='hidden' name='attr' value='attackStrive'/>
						<input type='hidden' name='attr' value='groudStrive'/>
						<input type='hidden' name='attr' value='airStrive'/>
						<input type='hidden' name='attr' value='dribble'/>
						<input type='hidden' name='attr' value='tackle'/>
						<input type='hidden' name='attr' value='getBall'/>
						<input type='hidden' name='attr' value='interception'/>
						<input type='hidden' name='attr' value='badBallControl'/>
						<input type='hidden' name='attr' value='regetBall'/>
						<input type='hidden' name='attr' value='loseBall'/>
			         </form>
					</c:if>
                    <table class="table  table-striped">
                        <tbody>
                        <tr>
                          <td class="table-title">对决/成功次数</td>
                          <td>${s eq null || s.battle eq null ? nullTip : s.battle}</td>
                        </tr>
                        <tr>
                          <td class="table-title">赢得拼抢%</td>
                          <td>${s eq null || s.striveWinRate eq null ? nullTip : s.striveWinRate}</td>
                        </tr>
                        <tr>
                          <td class="table-title">防守拼抢/成功</td>
                          <td>${s eq null || s.defenceStrive eq null ? nullTip : s.defenceStrive}</td>
                        </tr>
                        <tr>
                          <td class="table-title">进攻拼抢/成功</td>
                          <td>${s eq null || s.attackStrive eq null ? nullTip : s.attackStrive}</td>
                        </tr>
                        <tr>
                          <td class="table-title">地面拼抢/成功</td>
                          <td>${s eq null || s.groudStrive eq null ? nullTip : s.groudStrive}</td>
                        </tr>
                        <tr>
                          <td class="table-title">空中拼抢/成功</td>
                          <td>${s eq null || s.airStrive eq null ? nullTip : s.airStrive}</td>
                        </tr>
                        <tr>
                          <td class="table-title">运球/成功</td>
                          <td>${s eq null || s.dribble eq null ? nullTip : s.dribble}</td>
                        </tr>
                        <tr>
                          <td class="table-title">铲球/成功</td>
                          <td>${s eq null || s.tackle eq null ? nullTip : s.tackle}</td>
                        </tr>
                        <tr>
                          <td class="table-title">非受迫情况下得球/在对方半场</td>
                          <td>${s eq null || s.getBall eq null ? nullTip : s.getBall}</td>
                        </tr>
                        <tr>
                          <td class="table-title">拦截/在对方半场</td>
                          <td>${s eq null || s.interception eq null ? nullTip : s.interception}</td>
                        </tr>
                        <tr>
                          <td class="table-title">不好的控球</td>
                          <td>${s eq null || s.badBallControl eq null ? nullTip : s.badBallControl}</td>
                        </tr>
                        <tr>
                          <td class="table-title">重夺控球次数/在对方半场</td>
                          <td>${s eq null || s.regetBall eq null ? nullTip : s.regetBall}</td>
                        </tr>
                        <tr>
                          <td class="table-title">失球次数/在己方半场</td>
                          <td>${s eq null || s.loseBall eq null ? nullTip : s.loseBall}</td>
                        </tr>
                        </tbody>
                    </table>
            </div>
            <!-- \\col 1 -->

            <!-- //col 2-->
            <div class="colomn-2">
              <h5 class="pic-title">比赛中拼抢
              	<c:if test="${(s eq null || s.striveImg eq null) && ACCOUNT.role == 'Admin'}" >
		        	<form action="${ctx}/data/player/import-img" class="upload-form import-img">
		        		<input type="file" name="img" class="uploadify"/>
			          	<input type="hidden" name="entity" value="${entity}"/>
			          	<input type="hidden" name="playerId" value="${playerId}"/>
			          	<input type="hidden" name="period" value="${period}"/>
			          	<input type="hidden" name="date" value="${date}"/>
			          	<input type='hidden' name='attr' value='striveImg'/>
		        	</form>
		        	</c:if>
              </h5>
              <div class="thumbnail larger-margin">
              	<img src="${ctx}${(s eq null || s.striveImg eq null) ? '/static/img/placeholder_2.gif' : s.striveImg}">
              </div>
              <h5 class="pic-title">比赛中赢得拼抢%
              		<c:if test="${(s eq null || s.striveRateImg eq null) && ACCOUNT.role == 'Admin'}" >
		        	<form action="${ctx}/data/player/import-img" class="upload-form import-img">
		        		<input type="file" name="img" class="uploadify"/>
			          	<input type="hidden" name="entity" value="${entity}"/>
			          	<input type="hidden" name="playerId" value="${playerId}"/>
			          	<input type="hidden" name="period" value="${period}"/>
			          	<input type="hidden" name="date" value="${date}"/>
			          	<input type='hidden' name='attr' value='striveRateImg'/>
		        	</form>
		        	</c:if>
              </h5>
              <div class="thumbnail">
              	<img src="${ctx}${(s eq null || s.striveRateImg eq null) ? '/static/img/placeholder_2.gif' : s.striveRateImg}">
              </div>
            </div>
            <!-- \\col 2-->

            <!-- //col 3-->
            <div class="colomn-3">
              <h5 class="pic-title">所有拼抢的地点
              		<c:if test="${(s eq null || s.strivePlaceImg eq null) && ACCOUNT.role == 'Admin'}" >
		        	<form action="${ctx}/data/player/import-img" class="upload-form import-img">
		        		<input type="file" name="img" class="uploadify"/>
			          	<input type="hidden" name="entity" value="${entity}"/>
			          	<input type="hidden" name="playerId" value="${playerId}"/>
			          	<input type="hidden" name="period" value="${period}"/>
			          	<input type="hidden" name="date" value="${date}"/>
			          	<input type='hidden' name='attr' value='strivePlaceImg'/>
		        	</form>
		        	</c:if>
				</h5>
              <div class="thumbnail">
              <img src="${ctx}${(s eq null || s.strivePlaceImg eq null) ? '/static/img/placeholder_2.gif' : s.strivePlaceImg}">
              </div>
            </div>
            <!-- \\col 3-->

          </div>

      </div>
      <!-- \\area 1-->


      <!-- //area 2-->
      <div style="width:200px" class="area-2">
   			<c:if test="${(s eq null || s.pass eq null) && ACCOUNT.role == 'Admin'}" >
              <form action="${ctx}/data/player/import-excel" class="upload-form import-excel">
	          	<input type="file" name="excel" class="uploadify"/>
	          	<input type="hidden" name="entity" value="${entity}"/>
	          	<input type="hidden" name="playerId" value="${playerId}"/>
	          	<input type="hidden" name="period" value="${period}"/>
	          	<input type="hidden" name="date" value="${date}"/>

				<input type='hidden' name='attr' value='pass'/>
				<input type='hidden' name='attr' value='passRate'/>
				<input type='hidden' name='attr' value='normalPass'/>
				<input type='hidden' name='attr' value='attackPass'/>
				<input type='hidden' name='attr' value='threatenPass'/>
				<input type='hidden' name='attr' value='keyPass'/>
				<input type='hidden' name='attr' value='shortPass'/>
				<input type='hidden' name='attr' value='middleDistancePass'/>
				<input type='hidden' name='attr' value='longPass'/>
				<input type='hidden' name='attr' value='passIntoPenalty'/>
				<input type='hidden' name='attr' value='passReceived'/>
				<input type='hidden' name='attr' value='vovledInAttack'/>
				<input type='hidden' name='attr' value='positionalAttack'/>
				<input type='hidden' name='attr' value='counterattack'/>
				<input type='hidden' name='attr' value='setPieceAttack'/>
	         </form>
			</c:if>
          <table class="table  table-striped">
              <tbody>
              <tr>
                <td class="table-title">传球/准确次数</td>
                <td>${s eq null || s.pass eq null ? nullTip : s.pass}</td>
              </tr>
              <tr>
                <td class="table-title">%</td>
                <td>${s eq null || s.passRate eq null ? nullTip : s.passRate}</td>
              </tr>
              <tr>
                <td class="table-title">非进攻性传球/准确次数</td>
                <td>${s eq null || s.normalPass eq null ? nullTip : s.normalPass}</td>
              </tr>
              <tr>
                <td class="table-title">进攻性传球/准确次数</td>
                <td>${s eq null || s.attackPass eq null ? nullTip : s.attackPass}</td>
              </tr>
              <tr>
                <td class="table-title">威胁性传球/准确次数</td>
                <td>${s eq null || s.threatenPass eq null ? nullTip : s.threatenPass}</td>
              </tr>
              <tr>
                <td class="table-title">关键传球/准确次数</td>
                <td>${s eq null || s.keyPass eq null ? nullTip : s.keyPass}</td>
              </tr>
              <tr>
                <td class="table-title">短传/准确次数</td>
                <td>${s eq null || s.shortPass eq null ? nullTip : s.shortPass}</td>
              </tr>
              <tr>
                <td class="table-title">中距离传球/准确次数</td>
                <td>${s eq null || s.middleDistancePass eq null ? nullTip : s.middleDistancePass}</td>
              </tr>
              <tr>
                <td class="table-title">长传/准确</td>
                <td>${s eq null || s.longPass eq null ? nullTip : s.longPass}</td>
              </tr>
              <tr>
                <td class="table-title">进入禁区/准确</td>
                <td>${s eq null || s.passIntoPenalty eq null ? nullTip : s.passIntoPenalty}</td>
              </tr>
              <tr>
                <td class="table-title">接球数</td>
                <td>${s eq null || s.passReceived eq null ? nullTip : s.passReceived}</td>
              </tr>
              <tr>
                <td class="table-title">参与进攻</td>
                <td>${s eq null || s.vovledInAttack eq null ? nullTip : s.vovledInAttack}</td>
              </tr>
              <tr>
                <td class="table-title">阵地进攻</td>
                <td>${s eq null || s.positionalAttack eq null ? nullTip : s.positionalAttack}</td>
              </tr>
              <tr>
                <td class="table-title">反击</td>
                <td>${s eq null || s.counterattack eq null ? nullTip : s.counterattack}</td>
              </tr>
              <tr>
                <td class="table-title">定位球进攻</td>
                <td>${s eq null || s.setPieceAttack eq null ? nullTip : s.setPieceAttack}</td>
              </tr>
              </tbody>
          </table>

          	<h5 class="pic-title">在区域中失球
          			<c:if test="${(s eq null || s.loseBallImg eq null) && ACCOUNT.role == 'Admin'}" >
		        	<form action="${ctx}/data/player/import-img" class="upload-form import-img">
		        		<input type="file" name="img" class="uploadify"/>
			          	<input type="hidden" name="entity" value="${entity}"/>
			          	<input type="hidden" name="playerId" value="${playerId}"/>
			          	<input type="hidden" name="period" value="${period}"/>
			          	<input type="hidden" name="date" value="${date}"/>
			          	<input type='hidden' name='attr' value='loseBallImg'/>
		        	</form>
		        	</c:if>
			</h5>
              <div class="thumbnail">
              	<img src="${ctx}${(s eq null || s.loseBallImg eq null) ? '/static/img/placeholder_2.gif' : s.loseBallImg}">
              </div>
              <h5 class="pic-title">在区域中重夺控球
              		<c:if test="${(s eq null || s.regetBallImg eq null) && ACCOUNT.role == 'Admin'}" >
		        	<form action="${ctx}/data/player/import-img" class="upload-form import-img">
		        		<input type="file" name="img" class="uploadify"/>
			          	<input type="hidden" name="entity" value="${entity}"/>
			          	<input type="hidden" name="playerId" value="${playerId}"/>
			          	<input type="hidden" name="period" value="${period}"/>
			          	<input type="hidden" name="date" value="${date}"/>
			          	<input type='hidden' name='attr' value='regetBallImg'/>
		        	</form>
		        	</c:if>
              </h5>
              <div class="thumbnail">
              	<img src="${ctx}${(s eq null || s.regetBallImg eq null) ? '/static/img/placeholder_2.gif' : s.regetBallImg}">
              </div>
      </div>
      <!-- \\area 2-->

      <!-- //area 3-->
      <div style="width:310px" class="area-3">
              <h5 class="pic-title">传球（上半场）
              		<c:if test="${(s eq null || s.passFImg eq null) && ACCOUNT.role == 'Admin'}" >
		        	<form action="${ctx}/data/player/import-img" class="upload-form import-img">
		        		<input type="file" name="img" class="uploadify"/>
			          	<input type="hidden" name="entity" value="${entity}"/>
			          	<input type="hidden" name="playerId" value="${playerId}"/>
			          	<input type="hidden" name="period" value="${period}"/>
			          	<input type="hidden" name="date" value="${date}"/>
			          	<input type='hidden' name='attr' value='passFImg'/>
		        	</form>
		        	</c:if>
              </h5>
              <div class="thumbnail">
              	<img src="${ctx}${(s eq null || s.passFImg eq null) ? '/static/img/placeholder_2.gif' : s.passFImg}">
              </div>
              <h5 class="pic-title">传球（下半场）
              		<c:if test="${(s eq null || s.passSImg eq null) && ACCOUNT.role == 'Admin'}" >
		        	<form action="${ctx}/data/player/import-img" class="upload-form import-img">
		        		<input type="file" name="img" class="uploadify"/>
			          	<input type="hidden" name="entity" value="${entity}"/>
			          	<input type="hidden" name="playerId" value="${playerId}"/>
			          	<input type="hidden" name="period" value="${period}"/>
			          	<input type="hidden" name="date" value="${date}"/>
			          	<input type='hidden' name='attr' value='passSImg'/>
		        	</form>
		        	</c:if>
              </h5>
              <div class="thumbnail">
              	<img src="${ctx}${(s eq null || s.passSImg eq null) ? '/static/img/placeholder_2.gif' : s.passSImg}">
              </div>
              <h5 class="pic-title">传球路线
              		<c:if test="${(s eq null || s.passRouteImg eq null) && ACCOUNT.role == 'Admin'}" >
		        	<form action="${ctx}/data/player/import-img" class="upload-form import-img">
		        		<input type="file" name="img" class="uploadify"/>
			          	<input type="hidden" name="entity" value="${entity}"/>
			          	<input type="hidden" name="playerId" value="${playerId}"/>
			          	<input type="hidden" name="period" value="${period}"/>
			          	<input type="hidden" name="date" value="${date}"/>
			          	<input type='hidden' name='attr' value='passRouteImg'/>
		        	</form>
		        	</c:if>
              </h5>
              <div class="thumbnail">
              	<img src="${ctx}${(s eq null || s.passRouteImg eq null) ? '/static/img/placeholder_2.gif' : s.passRouteImg}">
              </div>
      </div>
      <!-- \\area 3-->

	<%@ include file="/common/import-js.jsp"%>
    <script type="text/javascript">
    </script>
  </body>
</html>

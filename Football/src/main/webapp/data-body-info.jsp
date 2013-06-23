<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <%@ include file="/common/head-inner.jsp"%>


    <style type="text/css">
          #data-table{width:260px;float:left;}
        #pic-area{width: 680px;
float: left;
margin-left: 45px;}
        .pic-colomn-1,.pic-colomn-2{width: 310px;
float: left;
margin-bottom: 20px;}
        .pic-colomn-1{padding-right:30px;}
        .pic-colomn-2{padding-left:30px;}
        .pic-title{margin:0;min-height:40px;}
        .upload-form{display: inline-block;margin-bottom:10px;margin-left:10px;}
        .thumbnail{height:300px;}
        h4{margin-bottom:20px;}
        .title-tip{font-size:12px;color:#bbb;margin-top: -14px;}
        .speed-chart{height: 200px;margin-bottom: 10px;}
        .thumbnail > img{width:100%;height:100%;}
    </style>
  </head>

  <body>
  <a style="display:none" href="${ctx}" id="app-ctx"></a>
  <c:set var="nullTip" value="<em class='no-data-tip'>未上传</em>" scope="page"></c:set>
  <c:set var="entity" value="BodyInfo"></c:set>

  <div id="data-table">
  		<c:if test="${(info eq null || info.totalDistance eq null) && ACCOUNT.role == 'Admin'}" >
          <form action="${ctx}/data/player/import-excel" class="upload-form import-excel">
          	<input type="file" name="excel" class="uploadify"/>
          	<input type="hidden" name="entity" value="${entity}"/>
          	<input type="hidden" name="playerId" value="${playerId}"/>
          	<input type="hidden" name="period" value="${period}"/>
          	<input type="hidden" name="date" value="${date}"/>

          	<input type='hidden' name='attr' value='totalDistance'/>
			<input type='hidden' name='attr' value='totalDistanceF'/>
			<input type='hidden' name='attr' value='totalDistanceS'/>
			<input type='hidden' name='attr' value='standDistance'/>
			<input type='hidden' name='attr' value='standDistanceF'/>
			<input type='hidden' name='attr' value='standDistanceS'/>
			<input type='hidden' name='attr' value='walkDistance'/>
			<input type='hidden' name='attr' value='walkDistanceF'/>
			<input type='hidden' name='attr' value='walkDistanceS'/>
			<input type='hidden' name='attr' value='slowRunDistance'/>
			<input type='hidden' name='attr' value='slowRunDistanceF'/>
			<input type='hidden' name='attr' value='slowRunDistanceS'/>
			<input type='hidden' name='attr' value='runDistanceAndTimes'/>
			<input type='hidden' name='attr' value='runDistanceAndTimesF'/>
			<input type='hidden' name='attr' value='runDistanceAndTimesS'/>
			<input type='hidden' name='attr' value='highSpeedRunDistanceAndTimes'/>
			<input type='hidden' name='attr' value='highSpeedRunDistanceAndTimesF'/>
			<input type='hidden' name='attr' value='highSpeedRunDistanceAndTimesS'/>
			<input type='hidden' name='attr' value='spurtDistanceAndTimes'/>
			<input type='hidden' name='attr' value='spurtDistanceAndTimesF'/>
			<input type='hidden' name='attr' value='spurtDistanceAndTimesS'/>
			<input type='hidden' name='attr' value='passTimes'/>
			<input type='hidden' name='attr' value='battleTimes'/>
			<input type='hidden' name='attr' value='inTime'/>
			<input type='hidden' name='attr' value='avgSpeed'/>
          </form>
          </c:if>
          <table class="table  table-striped">
              <tbody>
              <tr>
                <td video-type>总距离</td>
                <td>${info eq null || info.totalDistance eq null ? nullTip : info.totalDistance}</td>
              </tr>
              <tr>
                <td video-type>上半场</td>
                <td>${info eq null || info.totalDistanceF eq null ? nullTip : info.totalDistanceF}</td>

              </tr>
              <tr>
                <td video-type>下半场</td>
                <td>${info eq null || info.totalDistanceS eq null ? nullTip : info.totalDistanceS}</td>
              </tr>
              <tr>
                <td video-type>站立距离</td>
                <td>${info eq null || info.standDistance eq null ? nullTip : info.standDistance}</td>
              </tr>
              <tr>
                <td video-type>上半场</td>
                <td>${info eq null || info.standDistanceF eq null ? nullTip : info.standDistanceF}</td>
              </tr>
              <tr>
                <td video-type>下半场</td>
                <td>${info eq null || info.standDistanceS eq null ? nullTip : info.standDistanceS}</td>
              </tr>
              <tr>
                <td video-type>步行距离</td>
                <td>${info eq null || info.walkDistance eq null ? nullTip : info.walkDistance}</td>
              </tr>
              <tr>
                <td video-type>上半场</td>
                <td>${info eq null || info.walkDistanceF eq null ? nullTip : info.walkDistanceF}</td>
              </tr>
              <tr>
                <td video-type>下半场</td>
                <td>${info eq null || info.walkDistanceS eq null ? nullTip : info.walkDistanceS}</td>
              </tr>
              <tr>
                <td video-type>慢跑距离</td>
                <td>${info eq null || info.slowRunDistance eq null ? nullTip : info.slowRunDistance}</td>
              </tr>
              <tr>
                <td video-type>上半场</td>
                <td>${info eq null || info.slowRunDistanceF eq null ? nullTip : info.slowRunDistanceF}</td>
              </tr>
              <tr>
                <td video-type>下半场</td>
                <td>${info eq null || info.slowRunDistanceS eq null ? nullTip : info.slowRunDistanceS}</td>
              </tr>
              <tr>
                <td video-type>奔跑距离/次数</td>
                <td>${info eq null || info.runDistanceAndTimes eq null ? nullTip : info.runDistanceAndTimes}</td>
              </tr>
              <tr>
                <td video-type>上半场</td>
                <td>${info eq null || info.runDistanceAndTimesF eq null ? nullTip : info.runDistanceAndTimesF}</td>
              </tr>
              <tr>
                <td video-type>下半场</td>
                <td>${info eq null || info.runDistanceAndTimesS eq null ? nullTip : info.runDistanceAndTimesS}</td>
              </tr>
              <tr>
                <td video-type>高速奔跑距离/次数</td>
                <td>${info eq null || info.highSpeedRunDistanceAndTimes eq null ? nullTip : info.highSpeedRunDistanceAndTimes}</td>
              </tr>
              <tr>
                <td video-type>上半场</td>
                <td>${info eq null || info.highSpeedRunDistanceAndTimesF eq null ? nullTip : info.highSpeedRunDistanceAndTimesF}</td>
              </tr>
              <tr>
                <td video-type>下半场</td>
                <td>${info eq null || info.highSpeedRunDistanceAndTimesS eq null ? nullTip : info.highSpeedRunDistanceAndTimesS}</td>
              </tr>
              <tr>
                <td video-type>冲刺距离/次数</td>
                <td>${info eq null || info.spurtDistanceAndTimes eq null ? nullTip : info.spurtDistanceAndTimes}</td>
              </tr>
              <tr>
                <td video-type>上半场</td>
                <td>${info eq null || info.spurtDistanceAndTimesF eq null ? nullTip : info.spurtDistanceAndTimesF}</td>
              </tr>
              <tr>
                <td video-type>下半场</td>
                <td>${info eq null || info.spurtDistanceAndTimesS eq null ? nullTip : info.spurtDistanceAndTimesS}</td>
              </tr>
              <tr>
                <td video-type>传球/准确次数</td>
                <td>${info eq null || info.passTimes eq null ? nullTip : info.passTimes}</td>
              </tr>
              <tr>
                <td video-type>对决/成功次数</td>
                <td>${info eq null || info.battleTimes eq null ? nullTip : info.battleTimes}</td>
              </tr>
                <tr>
                <td video-type>上场时间</td>
                <td>${info eq null || info.inTime eq null ? nullTip : info.inTime}</td>
              </tr>
                <tr>
                <td video-type>平均速度</td>
                <td>${info eq null || info.avgSpeed eq null ? nullTip : info.avgSpeed}</td>
              </tr>
              </tbody>
          </table>
  </div>

  <div id="pic-area">
    <h4 class="center">在比赛中球员的运动</h4>
    <div class="pic-colomn-1">
        <h5 class="pic-title">上半场
        	<c:if test="${(info eq null || info.moveImgF eq null) && ACCOUNT.role == 'Admin'}" >
        	<form action="${ctx}/data/player/import-img" class="upload-form import-img">
        		<input type="file" name="img" class="uploadify"/>
	          	<input type="hidden" name="entity" value="${entity}"/>
	          	<input type="hidden" name="playerId" value="${playerId}"/>
	          	<input type="hidden" name="period" value="${period}"/>
	          	<input type="hidden" name="date" value="${date}"/>
	          	<input type='hidden' name='attr' value='moveImgF'/>
        	</form>
        	</c:if>
        </h5>
        <div class="thumbnail">
                <img src="${ctx}${(info eq null || info.moveImgF eq null) ? '/static/img/placeholder_1.gif' : info.moveImgF}">
        </div>
    </div>
    <div class="pic-colomn-2">
        <h5 class="pic-title">下半场
       		<c:if test="${(info eq null || info.moveImgS eq null) && ACCOUNT.role == 'Admin'}" >
        	<form action="${ctx}/data/player/import-img" class="upload-form import-img">
        		<input type="file" name="img" class="uploadify"/>
	          	<input type="hidden" name="entity" value="${entity}"/>
	          	<input type="hidden" name="playerId" value="${playerId}"/>
	          	<input type="hidden" name="period" value="${period}"/>
	          	<input type="hidden" name="date" value="${date}"/>
	          	<input type='hidden' name='attr' value='moveImgS'/>
        	</form>
        	</c:if>
        </h5>
        <div class="thumbnail">
               <img src="${ctx}${(info eq null || info.moveImgS eq null) ? '/static/img/placeholder_1.gif' : info.moveImgS}">
        </div>
    </div>

    <div class="clearfix"></div>

    <h4 class="center">在比赛中球员的高速运动和冲刺</h4>
    <div class="pic-colomn-1">
        <h5 class="pic-title">上半场
        	<c:if test="${(info eq null || info.spurtImgF eq null) && ACCOUNT.role == 'Admin'}" >
        	<form action="${ctx}/data/player/import-img" class="upload-form import-img">
        		<input type="file" name="img" class="uploadify"/>
	          	<input type="hidden" name="entity" value="${entity}"/>
	          	<input type="hidden" name="playerId" value="${playerId}"/>
	          	<input type="hidden" name="period" value="${period}"/>
	          	<input type="hidden" name="date" value="${date}"/>
	          	<input type='hidden' name='attr' value='spurtImgF'/>
        	</form>
        	</c:if>
        </h5>
        <div class="thumbnail">
               <img src="${ctx}${(info eq null || info.spurtImgF eq null) ? '/static/img/placeholder_1.gif' : info.spurtImgF}">
        </div>
    </div>
    <div class="pic-colomn-2">
        <h5 class="pic-title">下半场
        	<c:if test="${(info eq null || info.spurtImgS eq null) && ACCOUNT.role == 'Admin'}" >
			<form action="${ctx}/data/player/import-img" class="upload-form import-img">
        		<input type="file" name="img" class="uploadify"/>
	          	<input type="hidden" name="entity" value="${entity}"/>
	          	<input type="hidden" name="playerId" value="${playerId}"/>
	          	<input type="hidden" name="period" value="${period}"/>
	          	<input type="hidden" name="date" value="${date}"/>
	          	<input type='hidden' name='attr' value='spurtImgS'/>
        	</form>
        	</c:if>
		</h5>
        <div class="thumbnail">
               <img src="${ctx}${(info eq null || info.spurtImgS eq null) ? '/static/img/placeholder_1.gif' : info.spurtImgS}">
        </div>
    </div>

    <div id="chart-area">
          <h4>球员在比赛中的速度</h4>
          <div class="title-tip">在5分钟期间球员的距离/在5分钟期间球员的高速奔跑和冲刺距离</div>
          <div id="chart1" class="speed-chart"></div>
          <div id="chart2" class="speed-chart"></div>
    </div>
  </div>

    <%@ include file="/common/import-js.jsp"%>
	<script type="text/javascript">
        $(function(){
          $('#chart1').highcharts({
            chart: {
                type: 'line',
                marginRight: 130,
                marginBottom: 25
            },
            xAxis: {
                categories: ['0分钟', '5分钟', '10分钟', '15分钟', '20分钟', '25分钟',
                    '30分钟', '35分钟', '40分钟', '45分钟']
            },
            yAxis: {
                title: {
                    text: '速度 (m/s)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: 'm/s'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -10,
                y: 100,
                borderWidth: 0
            },
            series: [{
                name: '张猛',
                data: [7.0, 5.3, 2.1, 7.9, 9.1, 4.3, 4.5, 5.6, 8.0, 2.1]
            }]
        });



    $('#chart2').highcharts({
            chart: {
                type: 'line',
                marginRight: 130,
                marginBottom: 25
            },
            xAxis: {
                categories: ['45分钟', '50分钟', '55分钟', '60分钟', '65分钟', '70分钟',
                    '75分钟', '80分钟', '85分钟', '90分钟']
            },
            yAxis: {
                title: {
                    text: '速度 (m/s)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: 'm/s'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -10,
                y: 100,
                borderWidth: 0
            },
            series: [{
                name: '张猛',
                data: [7.0, 5.3, 2.1, 7.9, 9.1, 4.3, 4.5, 5.6, 8.0, 2.1]
            }]
        });
      });
    </script>
  </body>
</html>

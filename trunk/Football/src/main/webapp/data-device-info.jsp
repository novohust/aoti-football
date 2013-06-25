<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
  <%@ include file="/common/head-inner.jsp"%>
  <style type="text/css">
  		.des{margin-left:10px}
      .area-1{margin-bottom: 20px}
      .speed-chart{width:990px;height:400px;}
      .table{width:300px;float:left;}
      tbody{font-size: 11px!important;}
      .icon-heart,.icon-info-sign{margin: 4px 4px 0 0;}
      h4{margin-left:15px;}
  </style>
  </head>

  <body>
    <a style="display:none" href="${ctx}" id="app-ctx"></a>
  <c:set var="nullTip" value="<em class='no-data-tip'>未上传</em>" scope="page"></c:set>

		<c:if test="${info eq null && ACCOUNT.role == 'Admin'}" >
          <form action="${ctx}/data/player/import-device-info" class="upload-form import-excel">
          	<input type="file" name="excel" class="uploadify"/>
          	<input type="hidden" name="playerId" value="${playerId}"/>
          	<input type="hidden" name="period" value="${period}"/>
          	<input type="hidden" name="date" value="${date}"/>
          </form>
          </c:if>

          <div class="area-1">
          <c:if test ="${info eq null}">
            <span class="des">平均速度:${nullTip}</span>
            <span class="des">最小速度:${nullTip}</span>
            <span class="des">最大速度:${nullTip}</span>
            <span class="des">最小心率:${nullTip}</span>
            <span class="des">最大心率:${nullTip}</span>
            <span class="des">距离(米):${nullTip}</span>
          </c:if>

          <c:if test ="${info ne null}">
            <span class="des">平均心率:<fmt:formatNumber value="${info.avgHr}" maxFractionDigits="1"/></span>
            <span class="des">平均速度:<fmt:formatNumber value="${info.avgSpeed}" maxFractionDigits="1"/></span>
            <span class="des">最小速度:<fmt:formatNumber value="${info.minSpeed}" maxFractionDigits="1"/></span>
            <span class="des">最大速度:<fmt:formatNumber value="${info.maxSpeed}" maxFractionDigits="1"/></span>
            <span class="des">最小心率:<fmt:formatNumber value="${info.minHr}" maxFractionDigits="1"/></span>
            <span class="des">最大心率:<fmt:formatNumber value="${info.maxHr}" maxFractionDigits="1"/></span>
            <span class="des">距离(米):<fmt:formatNumber value="${info.totalDistance}" maxFractionDigits="1"/></span>
            </c:if>
        </div>

<div class="area-2">

  <h4 class=""><i class="icon-heart"></i>心率曲线</h4>
   <div id="chart1" class="speed-chart"></div>
  <table class="table  table-striped hide">
    <thead>
      <th>数值</th>
      <th>强度</th>
      <th>百分比</th>
      <th>跑动距离</th>
    </thead>
              <tbody>
              <tr>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                 <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
               <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
              <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>

              </tbody>
          </table>
</div>

          <div class="clearfix"></div>

<div class="area-3">

  <h4 class=""><i class="icon-info-sign"></i>速度曲线</h4>
   <div id="chart2" class="speed-chart"></div>
  <table class="table  table-striped hide">
    <thead>
      <th>波动类型</th>
      <th>百分比</th>
      <th>跑动距离</th>
      <th>记录次数</th>
    </thead>
              <tbody>
              <tr>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                 <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
               <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
              <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td colspan="4">总距离：<em class="no-data-tip">未上传</em></td>
              </tr>

              </tbody>
          </table>
</div>





    <%@ include file="/common/import-js.jsp"%>
    <script type="text/javascript">
        $(function(){
          $('#chart2').highcharts({
       	  chart:{zoomType: 'x',type:'spline'},
       	  title:{
            		text:null
            	  },
          plotOptions: {
                spline: {
                    lineWidth: 1,
                    states: {
                        hover: {
                            lineWidth: 2
                        }
                    },
                    marker: {
                        enabled: false
                    }
                }
            },
            xAxis: {
                categories: [
						<c:forEach var="r" items="${info.records}" varStatus="status">
							'<fmt:formatDate value="${r.time}" type="date" pattern="hh:mm:ss"/>'${(info.recordSum-1) == status.index?"":","}
						</c:forEach>
                             ],
				tickInterval:parseInt(${info.recordSum/10})
            },
            yAxis: {
                title: {
                	min:0,
                    text: null
                }
            },
             legend: {
               enabled:false
            },
            credits: {
               enabled:false
            },
            series: [{
                name: '${player.name}',
                data: [
					<c:forEach var="r" items="${info.records}" varStatus="status">
					${r.speed}${(info.recordSum-1) == status.index?"":","}
					</c:forEach>
                       ]
            }]
        });



    $('#chart1').highcharts({
    	chart:{zoomType: 'x',type:'spline'},
     	  title:{
          		text:null
          	  },
        plotOptions: {
              spline: {
                  lineWidth: 1,
                  states: {
                      hover: {
                          lineWidth: 2
                      }
                  },
                  marker: {
                      enabled: false
                  }
              }
          },
            xAxis: {
            	categories: [
   						<c:forEach var="r" items="${info.records}" varStatus="status">
   							'<fmt:formatDate value="${r.time}" type="date" pattern="hh:mm:ss"/>'${(info.recordSum-1) == status.index?"":","}
   						</c:forEach>
                                ],
   				tickInterval:parseInt(${info.recordSum/10})
            },
            yAxis: {
                title: {
                    text: null
                }
            },
            legend: {
               enabled:false
            },
            credits: {
               enabled:false
            },
            series: [{
            	name: '${player.name}',
                data: [
					<c:forEach var="r" items="${info.records}" varStatus="status">
					${r.hr}${(info.recordSum-1) == status.index?"":","}
					</c:forEach>
                       ]
            }]
        });
      });
    </script>
  </body>
</html>

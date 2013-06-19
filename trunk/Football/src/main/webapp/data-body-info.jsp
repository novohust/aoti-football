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
        .pic-title{margin:0;}
        .upload-form{display: inline-block;margin-bottom:10px;margin-left:10px;}
        .thumbnail{height:300px;}
        h4{margin-bottom:20px;}
        .title-tip{font-size:12px;color:#bbb;margin-top: -14px;}
        .speed-chart{height: 200px;margin-bottom: 10px;}
    </style>
  </head>

  <body>
  <a style="display:none" href="${ctx}" id="app-ctx"></a>
  <div id="data-table">
          <form action="" class="upload-form">
          	<input id="u_1" type="file" name="excel" class="uploadify"/>
          	<input type="hidden" name="entity" value="BodyInfo"/>
          	<input type="hidden" name="attr" value="BodyInfo"/>
          </form>
          <table class="table  table-striped">
              <tbody>
              <tr>
                <td video-type>总距离</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>上半场</td>
                <td><em class="no-data-tip">未上传</em></td>

              </tr>
              <tr>
                <td video-type>下半场</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>站立距离</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>上半场</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>下半场</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>步行距离</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>上半场</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>下半场</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>慢跑距离</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>上半场</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>下半场</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>奔跑距离/次数</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>上半场</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>下半场</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>高速奔跑距离/次数</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>上半场</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>下半场</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>冲刺距离/次数</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>上半场</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>下半场</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>传球/准确次数</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              <tr>
                <td video-type>对决/成功次数</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
                <tr>
                <td video-type>上场时间</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
                <tr>
                <td video-type>平均速度</td>
                <td><em class="no-data-tip">未上传</em></td>
              </tr>
              </tbody>
          </table>
  </div>

  <div id="pic-area">
    <h4 class="center">在比赛中球员的运动</h4>
    <div class="pic-colomn-1">
        <h5 class="pic-title">上半场<form action="" class="upload-form"><button class="btn">导入</button></form></h5>
        <div class="thumbnail">
                <img src="http://www.placehold.it/310x310/EFEFEF/AAAAAA&text=no+image" alt="">
        </div>
    </div>
    <div class="pic-colomn-2">
        <h5 class="pic-title">下半场<form action="" class="upload-form"><button class="btn">导入</button></form></h5>
        <div class="thumbnail">
                <img src="http://www.placehold.it/310x310/EFEFEF/AAAAAA&text=no+image" alt="">
        </div>
    </div>

    <div class="clearfix"></div>

    <h4 class="center">在比赛中球员的高速运动和冲刺</h4>
    <div class="pic-colomn-1">
        <h5 class="pic-title">上半场<form action="" class="upload-form"><button class="btn">导入</button></form></h5>
        <div class="thumbnail">
                <img src="http://www.placehold.it/310x310/EFEFEF/AAAAAA&text=no+image" alt="">
        </div>
    </div>
    <div class="pic-colomn-2">
        <h5 class="pic-title">下半场<form action="" class="upload-form"><button class="btn">导入</button></form></h5>
        <div class="thumbnail">
                <img src="http://www.placehold.it/310x310/EFEFEF/AAAAAA&text=no+image" alt="">
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


    	// 导入excel
	    $('.uploadify').each(function(i,e){
	    	$(e).uploadify({
	    		'buttonText':'导入',
	    		'width':53,
	    		'height':30,
				'swf'      : $.appCtx + '/static/swf/uploadify.swf',
				'uploader' : ''
				// Put your options here
			});
	    });
      });
    </script>
  </body>
</html>

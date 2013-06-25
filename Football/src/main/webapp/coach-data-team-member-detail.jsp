<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <%@ include file="/common/head-inner.jsp"%>
        <style type="text/css">
    #date-choose-wrapper input,#date-choose-wrapper select{
        margin-bottom: 0;
    }
    iframe{
      width:100%;
      height:2000px;
    }
    .container{width:1000px!important;}
    .datectrl{border-bottom: 0px solid #ddd;}
    </style>
  </head>

  <body>

 		<a style="display:none" href="${ctx}" id="app-ctx"></a>
     	<c:set var="nullTip" value="<em class='no-data-tip'>未上传</em>" scope="page"></c:set>
        <c:set var="entity" value="SkillStatistics"></c:set>

      <div class="container">
       <!-- div 头部介绍以及图片 start-->
        <div class="shadowed-box brief" >
          <div style="width:70%; position:absolute;">
          <ul class="nav  nav-pills">
            <li ><span>出场时间</span></li>
              <li ><span>${info eq null ? nullTip : info.showTime}</span></li>
            <li ><span>出场次数</span></li>
              <li ><span>${info eq null ? nullTip : info.showTimes}</span></li>
            <li ><span>首发</span></li>
              <li ><span>${info eq null ? nullTip : info.firstTimes}</span></li>
            <li ><span>替补</span></li>
              <li ><span>${info eq null ? nullTip : info.backupTimes}</span></li>
           </ul>
         </div>
        	<img height="50" src="images/3.png" alt="武汉卓尔" class="btn" style="float: right;">
      </div>
       <!-- div 头部介绍以及图片 end-->

       <!--三个table -->
      <div style="margin-top: 90px">
      <!--table 1 start-->
      <h5 class="table-title">进攻数据</h5>
      <table class="table  table-bordered table-striped">
            <tr>
                <td class="center">进球</td>
                <td class="center">${info eq null ? nullTip : info.hitTimes}  </td>
                <td class="center">助攻</td>
                <td class="center">${info eq null ? nullTip : info.assistTimes}   </td>
                <td class="center">射门</td>
                <td class="center">${info eq null ? nullTip : info.shoot}   </td>
                <td class="center">射正</td>
                <td class="center">${info eq null ? nullTip : info.shotOT}  </td>
            </tr>
             <tr>
                <td class="center">远射</td>
                <td class="center">${info eq null ? nullTip : info.shotLong}  </td>
                <td class="center">抢点</td>
                <td class="center">${info eq null ? nullTip : info.sightTac}   </td>
                <td class="center">突破成功</td>
                <td class="center">${info eq null ? nullTip : info.breakSucc}  </td>
                <td class="center">突破成功率</td>
                <td class="center">${info eq null ? nullTip : info.breakSuccRate}   </td>
            </tr>
             <tr>
                <td class="center">被犯规</td>
                <td class="center">${info eq null ? nullTip : info.fouled}   </td>
                <td class="center">创造本方点球机会</td>
                <td class="center">${info eq null ? nullTip : info.mkpointSphere}  </td>
                <td class="center">主罚点球</td>
                <td class="center">${info eq null ? nullTip : info.chpointSphere}   </td>
                <td class="center">命中点球</td>
                <td class="center">${info eq null ? nullTip : info.succpointSphere}  </td>
            </tr>
             <tr>
                <td class="center">传中次数</td>
                <td class="center">${info eq null ? nullTip : info.crossTimes}  </td>
                <td class="center">传中成功</td>
                <td class="center">${info eq null ? nullTip : info.crossSucc}   </td>
                <td class="center">传威胁球</td>
                <td class="center">${info eq null ? nullTip : info.passLane}  </td>
                <td class="center">越位</td>
                <td class="center">${info eq null ? nullTip : info.offside}  </td>
            </tr>
      </table>
      <!--table 1 end-->

       <!--table 2 start-->
      <h5 class="table-title">防守数据</h5>
      <table class="table  table-bordered table-striped">

            <tr>
                <td class="center">抢断成功</td>
                <td class="center">${info eq null ? nullTip : info.stealSucc}   </td>
                <td class="center">铲球次数</td>
                <td class="center">${info eq null ? nullTip : info.tackleTimes}  </td>
                <td class="center">铲球成功</td>
                <td class="center">${info eq null ? nullTip : info.tackleSucc}   </td>
                <td class="center">解围</td>
                <td class="center">${info eq null ? nullTip : info.rescue}   </td>
            </tr>
             <tr>
                <td class="center">封堵射门</td>
                <td class="center">${info eq null ? nullTip : info.block}   </td>
                <td class="center">犯规</td>
                <td class="center">${info eq null ? nullTip : info.foul}   </td>
                <td class="center">黄牌</td>
                <td class="center">${info eq null ? nullTip : info.yellowCard}  </td>
                <td class="center">红牌</td>
                <td class="center">${info eq null ? nullTip : info.redCard}  </td>
            </tr>
      </table>
      <!--table 2 end-->

      <!--table 3 start-->
      <h5 class="table-title">技术数据</h5>
      <table class="table  table-bordered table-striped">

            <tr>
                <td class="center">短传</td>
                <td class="center">${info eq null ? nullTip : info.shortpass}  </td>
                <td class="center">长传</td>
                <td class="center">${info eq null ? nullTip : info.longpass} </td>
                <td class="center">传球成功率</td>
                <td class="center">${info eq null ? nullTip : info.passRate}   </td>
                <td class="center">丢球</td>
                <td class="center">${info eq null ? nullTip : info.slip}  </td>
            </tr>
             <tr>
                <td class="center">头球次数</td>
                <td class="center">${info eq null ? nullTip : info.headbulb}   </td>
                <td class="center">头球成功</td>
                <td class="center">${info eq null ? nullTip : info.headSucc}   </td>
                <td class="center">主罚前场左路任意球</td>
                <td class="center">${info eq null ? nullTip : info.leftFree}   </td>
                <td class="center">主罚前场右路任意球</td>
                <td class="center">${info eq null ? nullTip : info.rightFree}   </td>
            </tr>
             <tr>
                <td class="center">主罚左路角球</td>
                <td class="center">${info eq null ? nullTip : info.leftCorner}   </td>
                <td class="center">主罚右路角球</td>
                <td class="center">${info eq null ? nullTip : info.rightCorner}   </td>
                <td class="center">防守队员前插</td>
                <td class="center">${info eq null ? nullTip : info.guardRunf}   </td>
                <td class="center">进攻队员回防</td>
                <td class="center">${info eq null ? nullTip : info.guardRunb}   </td>
            </tr>
             <tr>
                <td class="center">明显失误</td>
                <td class="center">${info eq null ? nullTip : info.obFailure}   </td>
                <td class="center">PPGS平均得分</td>
                <td class="center">${info eq null ? nullTip : info.PPGS}   </td>
                <td class="center"></td>
                <td class="center"></td>
                <td class="center"></td>
                <td class="center"></td>
            </tr>
      </table>
      <!--table 3 end-->
    </div>
      <!--三个table -->


    		</div> <!-- /container -->
  </body>
   <%@ include file="/common/import-js.jsp"%>
</html>

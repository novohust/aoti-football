<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="today"/>

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
        <c:set var="entity" value="CompetetionInfo"></c:set>

      <div class="container">

      <!-- 上传控件 -->
           <c:if test="${info eq null || info.totalShot eq null}" >
	         <form action="${ctx}/data/player/import-excel" class="upload-form import-excel">
	          	<input type="file" name="excel" class="uploadify"/>
	          	<input type="hidden" name="entity" value="${entity}"/>
	          	<input type="hidden" name="playerId" value="${teamId}"/>  <!-- 注意此处palyerId存放的是球队的id号 -->
	          	<input type="hidden" name="period" value="${period}"/>
	          	<input type="hidden" name="date" value="${date}"/>

                <!-- 统计信息字段17个 -->
	          	<input type='hidden' name='attr' value='totalShot'/>
				<input type='hidden' name='attr' value='shotTarget'/>
				<input type='hidden' name='attr' value='shotOut'/>
				<input type='hidden' name='attr' value='shotGate'/>
				<input type='hidden' name='attr' value='throughBall'/>
				<input type='hidden' name='attr' value='offsied'/>
				<input type='hidden' name='attr' value='steal'/>
				<input type='hidden' name='attr' value='free'/>
				<input type='hidden' name='attr' value='foul'/>
				<input type='hidden' name='attr' value='corner'/>
				<input type='hidden' name='attr' value='outBound'/>
				<input type='hidden' name='attr' value='longPass'/>
				<input type='hidden' name='attr' value='passSuccRate'/>
				<input type='hidden' name='attr' value='crossRate'/>
				<input type='hidden' name='attr' value='stealRate'/>
				<input type='hidden' name='attr' value='headRate'/>
				<input type='hidden' name='attr' value='ctrlRate'/>
				<!-- 统计信息字段17个 -->
	          </form>
        </c:if>
      <!-- 上传控件  -->


       <!-- div 头部介绍以及图片 start-->
        <div class="shadowed-box brief" >
          <div style="width:70%; position:absolute;">
           <ul style="margin-left: 10px; ">
            <li class="inli"><span>涂东旭 2号</span></li>
          </ul>
          <ul class="nav  nav-pills">
            <li ><span>出场时间</span></li>
              <li ><span>100</span></li>
            <li ><span>出场次数</span></li>
              <li ><span>100</span></li>
            <li ><span>首发</span></li>
              <li ><span>100</span></li>
            <li ><span>替补</span></li>
              <li ><span>100</span></li>
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
                <td class="center">0 </td>
                <td class="center">助攻</td>
                <td class="center">0 </td>
                <td class="center">射门</td>
                <td class="center">0 </td>
                <td class="center">射正</td>
                <td class="center">0 </td>
            </tr>
             <tr>
                <td class="center">远射</td>
                <td class="center">0 </td>
                <td class="center">抢点</td>
                <td class="center">0 </td>
                <td class="center">突破成功</td>
                <td class="center">0 </td>
                <td class="center">突破成功率</td>
                <td class="center">0 </td>
            </tr>
             <tr>
                <td class="center">被犯规</td>
                <td class="center">0 </td>
                <td class="center">创造本方点球机会</td>
                <td class="center">0 </td>
                <td class="center">主罚点球</td>
                <td class="center">0 </td>
                <td class="center">命中点球</td>
                <td
                class="center">0 </td>
            </tr>
             <tr>
                <td class="center">传中次数</td>
                <td class="center">0 </td>
                <td class="center">传中成功</td>
                <td class="center">0 </td>
                <td class="center">传威胁球</td>
                <td class="center">0 </td>
                <td class="center">越位</td>
                <td class="center">0 </td>
            </tr>
      </table>
      <!--table 1 end-->

       <!--table 2 start-->
      <h5 class="table-title">防守数据</h5>
      <table class="table  table-bordered table-striped">

            <tr>
                <td class="center">抢断成功</td>
                <td class="center">0 </td>
                <td class="center">铲球次数</td>
                <td class="center">0 </td>
                <td class="center">铲球成功</td>
                <td class="center">0 </td>
                <td class="center">解围</td>
                <td class="center">0 </td>
            </tr>
             <tr>
                <td class="center">封堵射门</td>
                <td class="center">0 </td>
                <td class="center">犯规</td>
                <td class="center">0 </td>
                <td class="center">黄牌</td>
                <td class="center">0 </td>
                <td class="center">红牌</td>
                <td class="center">0 </td>
            </tr>
      </table>
      <!--table 2 end-->

      <!--table 3 start-->
      <h5 class="table-title">技术数据</h5>
      <table class="table  table-bordered table-striped">

            <tr>
                <td class="center">短传</td>
                <td class="center">0 </td>
                <td class="center">长传</td>
                <td class="center">0 </td>
                <td class="center">传球成功率</td>
                <td class="center">0 </td>
                <td class="center">丢球</td>
                <td class="center">0 </td>
            </tr>
             <tr>
                <td class="center">头球次数</td>
                <td class="center">0 </td>
                <td class="center">头球成功</td>
                <td class="center">0 </td>
                <td class="center">主罚前场左路任意球</td>
                <td class="center">0 </td>
                <td class="center">主罚前场右路任意球</td>
                <td class="center">0 </td>
            </tr>
             <tr>
                <td class="center">主罚左路角球</td>
                <td class="center">0 </td>
                <td class="center">主罚右路角球</td>
                <td class="center">0 </td>
                <td class="center">防守队员前插</td>
                <td class="center">0 </td>
                <td class="center">进攻队员回防</td>
                <td class="center">0 </td>
            </tr>
             <tr>
                <td class="center">明显失误</td>
                <td class="center">0 </td>
                <td class="center">PPGS平均得分</td>
                <td class="center">0 </td>
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

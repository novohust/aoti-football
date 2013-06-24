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
        <c:set var="entity" value="MatchStatistics"></c:set>

    <div class="container">

         <div position="relative" style="position: relative;">
           <div id="data-table">
           <c:if test="${(info eq null || info.totalShot eq null )&& sessionScope.ACCOUNT.role == 'Admin'}" >
	         <form action="${ctx}/data/player/import-excel" class="upload-form import-excel">
	          	<input type="file" name="excel" class="uploadify"/>
	          	<input type="hidden" name="entity" value="${entity}"/>
	          	<input type="hidden" name="playerId" value="${playerId}"/>  <!-- 注意此处palyerId存放的是球队的id号 -->
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

         <table style="width: 100%;" class="table  table-bordered table-striped" > <!-- 注意表达式的冒号两边的空格 -->
              <tbody>
              <tr>
                <td class="right">总射门</td>
                <td ><a href="#">${info eq null || info.totalShot eq null ? nullTip : info.totalShot}</a></td>
              </tr>
              <tr>
                <td class="right">射正球门</td>
                <td ><a href="#">${info eq null || info.totalShot eq null ? nullTip : info.shotTarget}</a></td>
              </tr>
              <tr>
                <td class="right">射门偏出</td>
                <td ><a href="#">${info eq null || info.totalShot eq null ? nullTip : info.shotOut}</a></td>
              </tr>
              <tr>
                <td class="right">击中门框</td>
                <td ><a href="#">${info eq null || info.totalShot eq null ? nullTip : info.shotGate}</a></td>
              </tr>
              <tr>
                <td class="right">直塞球</td>
                <td ><a href="#">${info eq null || info.totalShot eq null ? nullTip : info.throughBall}</a></td>
              </tr>
              <tr>
                <td class="right">越位</td>
                <td ><a href="#">${info eq null || info.totalShot eq null ? nullTip : info.offsied}</a></td>
              </tr>
              <tr>
                <td class="right">抢断</td>
                <td ><a href="#">${info eq null || info.totalShot eq null ? nullTip : info.steal}</a></td>
              <tr>
                <td class="right">任意球</td>
                <td ><a href="#">${info eq null || info.totalShot eq null ? nullTip : info.free}</a></td>
              </tr>
              <tr>
                <td class="right">犯规</td>
                <td ><a href="#">${info eq null || info.totalShot eq null ? nullTip : info.foul}</a></td>
              </tr>
              <tr>
                <td class="right">角球</td>
                <td ><a href="#">${info eq null || info.totalShot eq null ? nullTip : info.corner}</a></td>
              </tr>
              <tr>
                <td class="right">界外球</td>
                <td ><a href="#">${info eq null || info.totalShot eq null ? nullTip : info.outBound}</a></td>
              </tr>
              <tr>
                <td class="right">超过25码长传</td>
               <td ><a href="#">${info eq null || info.totalShot eq null ? nullTip : info.longPass}</a></td>
              </tr>
              <tr>
                <td class="right">传球成功率</td>
                <td ><a href="#">${info eq null || info.totalShot eq null ? nullTip : info.passSuccRate}</a></td>
              </tr>
              <tr>
                <td class="right">传中成功率</td>
                <td ><a href="#">${info eq null || info.totalShot eq null ? nullTip : info.crossRate}</a></td>
              </tr>
              <tr>
                <td class="right">抢断成功率</td>
               <td ><a href="#">${info eq null || info.totalShot eq null ? nullTip : info.stealRate}</a></td>
              </tr>
              <tr>
                <td class="right">头球成功率</td>
                <td ><a href="#">${info eq null || info.totalShot eq null ? nullTip : info.headRate}</a></td>
              </tr>
              <tr>
                <td class="right">控球率</td>
                <td ><a href="#">${info eq null || info.totalShot eq null ? nullTip : info.ctrlRate}</a></td>
              </tr>
              </tbody>
          </table>
        </div>
        </div>

    </div> <!-- /container -->
  </body>
   <%@ include file="/common/import-js.jsp"%>


</html>


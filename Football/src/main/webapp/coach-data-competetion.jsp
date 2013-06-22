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

    <div class="container">
     	<%@ include file="/common/header.jsp"%>


     	      <ul id="myTab" class="nav nav-tabs datectrl">
              <li class="itemtitle">2013年5月12日上午比赛-卓尔vs鲁能</li>
              <li id="date-choose-wrapper" style="float:right;">
                  <button class="btn">导入</button>
                  <input type="text" placeholder="请选择日期" class="datepicker-dropdown-year-month input-medium">
                  <select name="" id="" class="input-small">
                    <option value="">上午</option>
                    <option value="">下午</option>
                  </select>
              </li>
        </ul>

         <div position="relative" style="position: relative;">
         <table style="width: 100%;" class="table  table-bordered table-striped" >
              <tbody>
              <tr>
                <td class="right">总射门</td>
                <td ><a href="video-player-list.html">3</a></td>
              </tr>
              <tr>
                <td class="right">射正球门</td>
                <td ><a href="video-player-list.html">3</a></td>
              </tr>
              <tr>
                <td class="right">射门偏出</td>
                <td ><a href="#">3</a></td>
              </tr>
              <tr>
                <td class="right">击中门框</td>
                <td ><a href="#">3</a></td>
              </tr>
              <tr>
                <td class="right">直塞球</td>
                <td ><a href="#">3</a></td>
              </tr>
              <tr>
                <td class="right">越位</td>
                <td ><a href="#">3</a></td>
              </tr>
              <tr>
                <td class="right">抢断</td>
                <td ><a href="#">3</a></td>
              <tr>
                <td class="right">任意球</td>
                <td ><a href="#">3</a></td>
              </tr>
              <tr>
                <td class="right">犯规</td>
                <td ><a href="#">3</a></td>
              </tr>
              <tr>
                <td class="right">角球</td>
                <td ><a href="#">3</a></td>
              </tr>
              <tr>
                <td class="right">界外球</td>
                <td ><a href="#">3</a></td>
              </tr>
              <tr>
                <td class="right">超过25码长传</td>
               <td ><a href="#">3</a></td>
              </tr>
              <tr>
                <td class="right">传球成功率</td>
                <td ><a href="#">3</a></td>
              </tr>
              <tr>
                <td class="right">传中成功率</td>
                <td ><a href="#">3</a></td>
              </tr>
              <tr>
                <td class="right">抢断成功率</td>
               <td ><a href="#">3</a></td>
              </tr>
              <tr>
                <td class="right">头球成功率</td>
                <td ><a href="#">3</a></td>
              </tr>
              <tr>
                <td class="right">控球率</td>
                <td ><a href="#">3</a></td>
              </tr>
              </tbody>
          </table>
        </div>

    </div> <!-- /container -->
  </body>

  <%@ include file="/common/import-js.jsp"%>
</html>

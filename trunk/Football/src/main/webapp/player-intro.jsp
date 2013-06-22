<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <%@ include file="/common/head-inner.jsp"%>
        <style type="text/css">
          .intro-title{text-align: center;}
          .avatar{max-width: 150px;float: left;
			border: solid 1px #ddd;
			border-radius: 5px;
			box-shadow: 0px 0px 7px #ddd;
			margin: 0 60px 0 185px;}

          .table-title{text-align: center;}
          h5{margin-top: 40px;}

          @media (min-width: 768px) and (max-width: 979px) {
              .avatar{margin-left:75px;}
          }
          @media (max-width: 767px){
              .avatar{margin-left:30px;}
          }
    </style>
  </head>

   <body>

    <div class="container">

     <%@ include file="/common/header.jsp"%>

    <h3 class="intro-title">张猛</h3>
      <div>
        <img src="http://photocdn.sohu.com/20090321/Img262928699.jpg" class="avatar" alt="">
        <table style="width: 400px;" class="table  table-bordered table-striped">
              <tbody>
              <tr>
                <td class="right">场上位置</td>
                <td >中场</td>
              </tr>
              <tr>
                <td class="right">现效力球队</td>
                <td >辽宁鸿运</td>
              </tr>
              <tr>
                <td class="right">球衣号码</td>
                <td >7</td>
              </tr>
              <tr>
                <td class="right">国籍</td>
                <td >中国</td>
              </tr>
              <tr>
                <td class="right">出生地</td>
                <td >沈阳</td>
              </tr>
              <tr>
                <td class="right">出生日期</td>
                <td >1966-4-26</td>
              </tr>
              <tr>
                <td class="right">身高</td>
                <td >166cm</td>
              </tr>
              <tr>
                <td class="right">体重</td>
                <td >76kg</td>
              </tr>
              </tbody>
          </table>
      </div>

      <h5 class="table-title">2013赛季技术统计</h5>
      <table class="table  table-bordered table-striped">
          <thead>
            <tr>
                <th class="center"></th>
                <th class="center">中超</th>
                <th class="center">足协杯</th>
                <th class="center">联赛杯</th>
                <th class="center">亚洲冠军杯</th>
                <th class="center">国家队</th>
                <th class="center">合计</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="center">出场场数</td>
              <td class="center">1</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
            </tr>
              <tr>
              <td class="center">出场场数</td>
              <td class="center">1</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
            </tr>
              <tr>
              <td class="center">出场时间</td>
              <td class="center">1</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
            </tr>
              <tr>
              <td class="center">进球</td>
              <td class="center">1</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
            </tr>
              <tr>
              <td class="center">首发</td>
              <td class="center">1</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
            </tr>
              <tr>
              <td class="center">替补未上</td>
              <td class="center">1</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
            </tr>
              <tr>
              <td class="center">替换上场</td>
              <td class="center">1</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
            </tr>
              <tr>
              <td class="center">黄牌</td>
              <td class="center">1</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
            </tr>
              <tr>
              <td class="center">红牌</td>
              <td class="center">1</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
              <td class="center">-</td>
            </tr>
          </tbody>
      </table>

      <h5 class="table-title">职业生涯一览</h5>
      <table class="table  table-bordered table-striped">
          <thead>
            <tr>
                <th class="center">赛季</th>
                <th class="center">效力球队 </th>
                <th class="center">出场次数/首发</th>
                <th class="center">出场时间</th>
                <th class="center">进球</th>
                <th class="center">助攻</th>
                <th class="center">黄牌</th>
                <th class="center">红牌</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="center">2013</td>
              <td class="center">辽宁宏运</td>
              <td class="center">12/12</td>
              <td class="center">1080</td>
              <td class="center">10</td>
              <td class="center">10</td>
              <td class="center">2</td>
              <td class="center">-</td>
            </tr>
            <tr>
              <td class="center">2012</td>
              <td class="center">武汉卓尔</td>
              <td class="center">12/12</td>
              <td class="center">987</td>
              <td class="center">12</td>
              <td class="center">8</td>
              <td class="center">-</td>
              <td class="center">-</td>
            </tr>
          </tbody>
      </table>
     </div> <!-- /container -->
  </body>

  <%@ include file="/common/import-js.jsp"%>
</html>
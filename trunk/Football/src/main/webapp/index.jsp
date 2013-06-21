<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<%@ include file="/common/head-inner.jsp"%>
</head>
  <body onload="load()">
    <%@ include file="/common/import-js.jsp"%>
     <script type="text/javascript">
     	function load(){
     		//var context = ${ctx}/init;
     		location.href = "init";
     	}
     </script>
  </body>
</html>

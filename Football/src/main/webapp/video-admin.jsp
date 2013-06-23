<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="today"/>
<c:set var="curTab" value="video"></c:set>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
<%@ include file="/common/head-inner.jsp"%>
<style type="text/css">
	.uploadify-queue{display:block;}
	.form-horizontal .control-label{width:100px;}
	.form-horizontal .controls{margin-left:120px;}
	.form-horizontal{margin:0};
</style>
  </head>

  <body>

    <div class="container">

      <%@ include file="/common/header.jsp"%>

        <input id="date" type="text" placeholder="请选择日期"  value="${today}" class="datepicker-dropdown-year-month input-medium" onchange="$('#upload-date').val($('#date').val());refresh();">
        <select name="" id="period" class="input-small" onchange="$('#upload-period').val($('#period').val());refresh();">
          <option value="Morning">上午</option>
          <option value="Afternoon">下午</option>
        </select>
        <select name="" id="playerId" class="input-small" onchange="refresh();">
          <option value="">全部球员</option>
          <c:forEach var="p" items="${players}">
	          <option value="${p.id}">${p.name}</option>
          </c:forEach>
        </select>

		<div id="list">
		</div>

		<!-- Modal -->
		<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		 	<div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h3 id="myModalLabel">上传视频&nbsp;-&nbsp;<strong></strong></h3>
		  </div>
	    	<form class="form-horizontal" id="upload-form" action="${ctx}/video/upload">
	    		<input type="hidden" name="date" id="upload-date" value="${today}"/>
	    		<input type="hidden" name="period" id="upload-period" value="Morning"/>
	    		<input type="hidden" name="videoType" id="upload-type" />
			  	<div class="modal-body">
			    	<p>
				    	<div class="control-group">
			              <label class="control-label">选择文件</label>
			              <div class="controls">
				    		<input type="file" name="video" id="file_upload"></input>
			              </div>
		              	</div>
		              	<div class="control-group">
			              <label class="control-label" for="inputEmail">球员</label>
			              <div class="controls">
				    		<select name="playerId" class="input-small" id="upload-playerId">
					          <c:forEach var="p" items="${players}">
						          <option value="${p.id}">${p.name}</option>
					          </c:forEach>
					        </select>
			              </div>
		              	</div>
			    </p>
			  </div>
			  <div class="modal-footer">
			    <input class="btn btn-primary" value="确定" type="submit"/>
			  </div>
	    	</form>
		</div>

    </div> <!-- /container -->

       <script type="text/html" id="tmp">
		<@ $.each(types,function(type,des){ @>
			<div class="video-type-wrapper">
				<div class="video-type <@=data[type]==0?'video-disabled':''@>" href='<@= href + "&type=" + type @>'>
					<span class="type-name"><@=des@><span>
					<a href="#" onclick="event.stopPropagation();$('#myModalLabel strong').text('<@=des@>');$('#upload-type').val('<@=type@>');$('#myModal').modal();">上传</a>
					<span class="label <@=data[type]>0?'label-success':'label-important'@>"><@=data[type]@></span>
				</div>
			</div>
		<@ }); @>
    </script>

    <%@ include file="/common/import-js.jsp"%>

    <script type="text/javascript">
		var teamId = ${teamId};
		var types;
		function refresh(){
			var date = $("#date").val();
			var period = $("#period option:selected").val();
			var playerId = $('#playerId option:selected').val();
			$.get($.appCtx+"/video/admin-video-list",{
				"playerId":playerId,
				"teamId":teamId,
				"date":date,
				"period":period
			},function(data){
				var href = $.appCtx + "/video/watch?teamId="+teamId+"&date="+date+"&period="+period+"&playerId="+playerId;
				$('#list').html(template.render("tmp",{"types":types,"$":$,"data":data,"href":href}));
				$(".video-type").click(function(){
					if($(this).is('.video-disabled'))return;
					window.open($(this).attr('href'),"_blank");
				});
			});
		}
		$(function(){
			$.get($.appCtx+"/video/allTypes",function(data){
				types = data;
				refresh();
			});

			$("#file_upload").uploadify({
				'auto':false,
				'uploadLimit':20,
				'fileSizeLimit':'500MB',
	    		'fileObjName':'video',
	    		'fileTypeExts':'*.flv',
	    		'buttonText':'选择文件 ...',
	    		'width':90,
	    		'height':30,
				'swf'      : $.appCtx + '/static/swf/uploadify.swf',
				'uploader' : $('#upload-form').attr('action'),
				'onQueueComplete':function(file,data,response){
					$('#myModal').modal('hide');
					$('#upload-form input[type=submit]').removeAttr('disabled').text('确定');
					$('#upload-form select').removeAttr('disabled');
					$('#file_upload').uploadify('disable', false);
					refresh();
				},
				'onUploadStart':function(file){
					// dynamic form data
					 $("#file_upload").uploadify("settings", 'formData', $('#upload-form').serializeJson());

					$('#file_upload').uploadify('disable', true);
					$('#upload-form input[type=submit]').attr('disabled',true).text('上传中...');
					$('#upload-form select').attr('disabled',true);
				}
				// Put your options here
			});

			$('#upload-form').submit(function(){
				$("#file_upload").uploadify('upload','*');
				return false;
			});
		});
	</script>
  </body>
</html>

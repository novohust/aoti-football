$(document).ready(function(){
	//other things to do on document ready, seperated for ajax calls
	docReady();
});

$.fn.serializeJson=function(){
	var serializeObj={};
	var array=this.serializeArray();
	var str=this.serialize();
	$(array).each(function(){
	if(serializeObj[this.name]){
	if($.isArray(serializeObj[this.name])){
	serializeObj[this.name].push(this.value);
	}else{
	serializeObj[this.name]=[serializeObj[this.name],this.value];
	}
	}else{
	serializeObj[this.name]=this.value;
	}
	});
	return serializeObj;
	};

function docReady(){
	$.extend({"appCtx":$("#app-ctx").attr('href')});

	//prevent # links from moving to top
	$('a[href="#"][data-top!=true]').click(function(e){
		e.preventDefault();
	});

	//datepicker
	$('.datepicker').datepicker();
	$('.datepicker-dropdown-year-month').datepicker({changeYear:true,changeMonth:true});
	$.datepicker.setDefaults($.datepicker.regional['zh-CN']);

	//notifications
	$('.noty').click(function(e){
		e.preventDefault();
		var options = $.parseJSON($(this).attr('data-noty-options'));
		noty(options);
	});

	//tabs
	$('#myTab a:first').tab('show');
	$('#myTab a').click(function (e) {
	  e.preventDefault();
	  $(this).tab('show');
	});

	//tooltip
	$('[rel="tooltip"],[data-rel="tooltip"],[data-toggle="tooltip"]').tooltip();

	//popover
	$('[rel="popover"],[data-rel="popover"],[data-toggle="popover"]').popover();

	// 导入excel、图片
    $('.uploadify').each(function(i,e){
    	$(e).attr("id","uploadify_"+i).uploadify({
    		'fileObjName':$(e).attr('name'),
    		'formData':$(e).closest('form').serializeJson(),
    		'buttonText':'导入',
    		'width':53,
    		'height':30,
			'swf'      : $.appCtx + '/static/swf/uploadify.swf',
			'uploader' : $(e).closest('form').attr('action'),
			'onUploadSuccess':function(file,data,response){
				var form = $(this.button[0]).closest('form');
				if(form.is(".import-excel")){
					location.reload();
					return;
				}
				if(form.is(".import-img")){
					data = $.parseJSON(data);
					form.parent().next().find('img').attr('src',data.result);
					form.remove();
				}
			},
			'onUploadStart':function(file){
				$(this.button[0]).attr('disabled',true).text('0%');
			},
			'onUploadProgress':function(file,bytesUploaded, bytesTotal, totalBytesUploaded, totalBytesTotal){
				$(this.button[0]).attr('disabled',true).text(Math.round((bytesUploaded/bytesTotal) * 100)+'%');
			}
			// Put your options here
		});
    });
}

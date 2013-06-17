$(document).ready(function(){	
	//other things to do on document ready, seperated for ajax calls
	docReady();
});
		
		
function docReady(){	
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

	//uploadify - multiple uploads
	$('#file_upload').uploadify({
		'swf'      : 'uploadify.swf',
		'uploader' : '/',
		'buttonText':'选择文件'
		// Put your options here
	});
}

$(function(){
	//로그인폼
	$(document).on("click", "#admin-login", function(event){	
		 $("#admin-dialog").dialog({
			 modal:true,
			 width:"500px",
			 open:function(){
				     $('#login-cancel').bind('click', function(){
					 $('#admin-dialog').dialog('close');
				 })
			 }
		 }).parent(".ui-dialog").removeClass("ui-widget ui-widget-content ui-corner-all ui-draggable ui-resizable")
		 .children(".wrapper").removeClass("ui-dialog-content ui-widget-content")
		 .parents(".ui-dialog")
		 .children(".ui-dialog-titlebar").remove();
	});
});

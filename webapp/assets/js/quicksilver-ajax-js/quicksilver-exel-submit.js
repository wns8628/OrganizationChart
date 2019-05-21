//엑셀저장하는 js
$(function(){	
	$("#btn-excel").on("click", function() {
		var $preparingFileModal = $("#preparing-file-modal");
		$preparingFileModal.dialog({
			modal : true
		});
		$("#progressbar").progressbar({
			value : false
		});
		$.fileDownload("/quicksilver/excel.do", {
			successCallback : function(url) {
				$preparingFileModal.dialog('close');
			},
			failCallback : function(responseHtml, url) {
				$preparingFileModal.dialog('close');
				$("#error-modal").dialog({
					modal : true
				});
			}
		});
		return false;
	});
});
var contextPath = "${pageContext.servletContext.contextPath }";

var getCompInfo = function(compSeq) {
//	$.ajax({
//		url : contextPath + "/admin/getCompInfo/" + compSeq,
//		type : "get",
//		dataType : "json",
//		data : "",
//		success : function(response) {
//			$(response.data).each(function(index, vo) {
//				deptRender(vo)
//			});
//		},
//		error : function(xhr, status, e) {
//			console.error(status + ":" + e);
//		}
//
//	});
//	$("#company-content-table").DataTable({
//		ajax : {
//			"type" : "get",
//			"url" : contextPath + "/admin/getCompInfo/" + compSeq,
//			"dataType" : "JSON"
//		},
//		columns : [ {
//			data : "compSeq"
//		}, {
//			data : ""
//		}, {
//			data : "ownerName"
//		}, ]
//	});
}

$(function() {
	$("div.parent-menu").click(function() {
		$this = $(this);
		$icon1 = $this.children().next();
		$icon2 = $this.children().next().next();
		if ($this.next().css("display") == "none") {
			$this.addClass("active");
			$this.next().show();
			$icon1.hide();
			$icon2.show();
		} else {
			$this.removeClass("active");
			$this.next().hide();
			$icon1.show();
			$icon2.hide();
		}
	});

	// $("#company-table tbody tr").click(function(){
	// console.log("ddd");
	// var compSeq = $(this).children();
	// console.log(compSeq);
	// });
});
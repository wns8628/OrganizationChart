let search = position => { // 검색 클릭
	console.log("검색");

	// 검색키워드 저장
	kwd = empName.value;
	
	// 검색버튼을 눌렀으니 data-check true로 변경
	$("input[data-check='false']").attr("data-check", "true");
	
	$('#statusTable').DataTable().destroy();
	
	$('#statusTable').dataTable({
         pageLength: 3,
         bPaginate: true,
         bLengthChange: true,
         lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
         bAutoWidth: false,
         processing: true,
         ordering: true,
         serverSide: false,
         searching: false,
         scrollY: false,
         ajax : {
             "url": contextPath + "/moveStatus/search/" + document.getElementsByClassName('selectBoxStyle')[0].value + "/" +
             							   document.getElementById('startDate').value + "/" +
             							   document.getElementById('endDate').value + "/" +
             							   document.getElementById('empName').value,
             "type":"GET",
             "data": "",
             "dataFilter": function(response){
            	 console.log(typeof response);
            	 return response;
             }
         },
         columns : [
             {data: "regDate"},
             {data: "compName"},
             {data: "empName"},
             {data: "workStatus"},
             {data: "nextDeptName"},
             {data: "nextDutyName"},
             {data: "nextPositionName"},
             {data: "previousDeptName"},
             {data: "previousDutyName"},
             {data: "previousPositionName"},
         ]

     });
	
};

let messageBox = function(title, message){
	$("#dialog-message").attr({
		title: title
	});
	$("#dialog-message p").text(message);
	$("#dialog-message").dialog({
		modal: true,
		buttons: {
			"확인": function(){
				$(this).dialog("close");
			}
		},
	});
};
let search = position => { // 검색 클릭
	console.log("검색");

	// 검색키워드 저장
	kwd = empName.value;
	
	// 검색버튼을 눌렀으니 data-check true로 변경
	$("input[data-check='false']").attr("data-check", "true");
	
	if( $('#empName').val() == ""){
		messageBox("사원명", "사원명 입력은 필수입니다");
		return;
	}
	
	if( $('#startDate'))
	
	$('#statusTable').DataTable().destroy();
	
let table =	$('#statusTable').dataTable({
         pageLength: 10,
         bPaginate: true,
         info:false,
         pagingType:"numbers",
         bLengthChange: true,
         lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
         bAutoWidth: false,
         processing: true,
         ordering: true,
         serverSide: false,
         searching: false,
         scrollY: false,
         ajax : {
             "url": contextPath + "/moveStatus/search",
             "type":"POST",
             data: {
            	compName:  document.getElementsByClassName('selectBoxStyle')[0].value,
            	startDate: document.getElementById('startDate').value,
            	endDate: document.getElementById('endDate').value,
            	empName: document.getElementById('empName').value
             },
             /*"dataSrc": function(json) {
            	 console.log(json);
            	 let data = new Object();
            	 let jsonData = new Array();
            	 
            	 for(let i = 0; i < json.data.length; i++) {
            		 
            		 if( json.data[i].nextDeptName == ''){
            			 console.log(json.data[i]);
            			 delete json.data[i];
            		 } else {
            			 jsonData.push(json.data[i]);
            		 }
            		 
            	 }
            	 data.result = "success";
            	 data.message = null;
            	 data.data = jsonData;
            	 
            	 console.log(data);
            	 return data;
             }*/
             
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
             {data: "previousPositionName"}
         ]

     });
	
/*	table.on( 'draw.dt', () => {
		 $(".table tbody tr td").each( (index, item) => {
		    if( item.innerHTML == 'remove'){
		    	item.parentNode.remove().draw();
		    }
		  });
	})*/
	
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
//엑셀저장하는 js
var getForExel = function(seq){
	let url;
	if(seq){
		url = contextPath + "/exel/" + seq + "/d"; 
	}else{
		url = contextPath + "/exel/"; 	
	}
	$.ajax({
		url: url,
		type:"get",
		dataType:"json",
		data:"",
		success: function(response){	
			let data = response.data
			
	      	$("#dvjson").excelexportjs({
	            containerid: "dvjson"
	               , datatype: 'json'
	               , dataset: data					//ajax으로 가져온 jsonData
	               , columns: getColumns(data)     
	        });
		},
		error: function(xhr, status, e){
			console.error(status+":"+e);
		}
	});
}

$(function(){	
	$(document).on("click", ".exel-submit", function(event){
			if(pageFlag==1){																//pageFlag ==1 : 검색이면 				
				getForExel();				
			}else{																			//그냥 조직도 부서클릭이면
				var seq = $("tbody > tr.row > td").get(1).innerHTML;	
				getForExel(seq);
			}
	});
});
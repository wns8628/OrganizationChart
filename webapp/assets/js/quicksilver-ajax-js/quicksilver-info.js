let compName;
let totalEmp;
let totalBiz;
let totalDept;
let age10;
let age20;
let age30;
let age40;
let age50;
let age60;

let compInfo = new Array();

let getCompInfo = function(CompSeq){
	$.ajax({
		url: contextPath + "/getBizInfo/"+CompSeq,
	      type:"get",
	      dataType:"json",
	      data:"",
	      async: false,
	      success: function(response){
	    	  compName = response.data.compName
	    	  totalBiz = response.data.totalBiz
	    	  totalDept = response.data.totalDept
	    	  totalEmp = response.data.totalEmp
	    	  age10 = response.data.age10
	    	  age20 = response.data.age20
	    	  age30 = response.data.age30
	    	  age40 = response.data.age40
	    	  age50 = response.data.age50
	    	  age60 = response.data.age60
	    	  insertCompInfo();
	    	  makePieInfo();
	      },
	      error: function(xhr, status, e){
	         console.error(status+":"+e);
	      }
	});
}

let insertCompInfo = function(){
	
	$(".Info").eq(0).html(compName);

	$(".Info").eq(1).html("● 사업장 : " + totalBiz + " 개");
	$(".Info").eq(2).html("● 부서 : " + totalDept + " 개");
	$(".Info").eq(3).html("");
	
	$(".Info").eq(4).html("● 총 직원 수 : "+ totalEmp +" 명");

	$(".Info").eq(5).html("10대:"+age10);
	$(".Info").eq(6).html("20대:"+age20);
	$(".Info").eq(7).html("30대:"+age30);
	$(".Info").eq(8).html("40대:"+age40);
	$(".Info").eq(9).html("50대:"+age50);
	$(".Info").eq(10).html("60대:"+age60);	
}







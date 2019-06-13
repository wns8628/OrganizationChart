let groupName;
let compName;
let totalComp;
let totalEmp;
let totalBiz;
let totalDept;
let age10;
let age20;
let age30;
let age40;
let age50;
let age60;

let fCount;
let mCount;

let ownerName;
let allEmp;

let compInfo = new Array();

let getCompInfo = function(CompSeq){
	$.ajax({
		url: contextPath + "/getBizInfo/"+CompSeq,
	      type:"get",
	      dataType:"json",
	      data:"",
	      async: false,
	      success: function(response){
	    	  compName = response.data.compChart.compName
	    	  totalBiz = response.data.compChart.totalBiz
	    	  totalDept = response.data.compChart.totalDept
	    	  totalEmp = response.data.compChart.totalEmp
	    	  age10 = response.data.compChart.age10
	    	  age20 = response.data.compChart.age20
	    	  age30 = response.data.compChart.age30
	    	  age40 = response.data.compChart.age40
	    	  age50 = response.data.compChart.age50
	    	  age60 = response.data.compChart.age60
	    	  ownerName = response.data.compChart.ownerName
	    	  allEmp = response.data.compChart.allEmp
	    	  
	    	  if(response.data.compChartFm.length == 0){
	    		  fCount = 0;
	    		  mCount = 0;
	    	  }else{
	    		  fCount = response.data.compChartFm[0].genderCount
	    		  mCount = response.data.compChartFm[1].genderCount	    		  
	    	  }
	    			  

	    	  insertCompInfo();
	    	  makePieInfo();
	    	  makePieInfoFm();
	    	  
	      },
	      error: function(xhr, status, e){
	         console.error(status+":"+e);
	      }
	});
}

let insertCompInfo = function(group){
	
	if(group){
		$(".Info").eq(0).html("- 자회사 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: "+ totalComp + " 개");	
		$(".Info-label").html("Quick Silver 그룹");
		$(".chart-labe-owner").html("대표 : Quick Silver")
	}else{
		$(".chart-labe-owner").html("대표 : " + ownerName)
		$(".Info-label").html(compName);	
		$(".Info").eq(0).html("");	
	}

		$(".Info").eq(1).html("- 사업장  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: " + totalBiz + " 개");
		$(".Info").eq(2).html("- 부서 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: " + totalDept + " 개");
		
		$(".Info").eq(3).html("- 총 사원 수 : "+ totalEmp +" 명 (사원:"+ allEmp +"명 + 겸직:" + (totalEmp-allEmp) + "명)");
	
	//	$(".Info").eq(4).html("10대:"+age10);
		$(".Info").eq(4).html("20대:"+age20);
		$(".Info").eq(5).html("30대:"+age30);
		$(".Info").eq(6).html("40대:"+age40);
		$(".Info").eq(7).html("50대:"+age50);
		$(".Info").eq(8).html("60대:"+age60);

		//성별
		$(".Info").eq(9).html("남자:"+fCount);
		$(".Info").eq(10).html("여자:"+mCount);	
}







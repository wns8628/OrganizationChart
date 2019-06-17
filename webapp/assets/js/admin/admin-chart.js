let groupInfo = () => {
	 $.ajax({
	      url: contextPath+"/chartGroup",
	      type:"get",
	      dataType:"json",
	      data:"",
	      success: function(response){
	    	  groupName = response.data.mainInfo.compName
	    	  totalBiz = response.data.mainInfo.totalBiz
	    	  totalDept = response.data.mainInfo.totalDept
	    	  totalEmp = response.data.mainInfo.totalEmp
	    	  totalComp = response.data.mainInfo.totalComp
	    	  age10 = response.data.mainInfo.age10
	    	  age20 = response.data.mainInfo.age20
	    	  age30 = response.data.mainInfo.age30
	    	  age40 = response.data.mainInfo.age40
	    	  age50 = response.data.mainInfo.age50
	    	  age60 = response.data.mainInfo.age60
	    	  allEmp = response.data.mainInfo.allEmp

	    	  
	    	  if(response.data.mainInfoFm.length == 0){
	    		  fCount = 0;
	    		  mCount = 0;
	    	  }else{		  
	    		  fCount = response.data.mainInfoFm[0].genderCount
	    		  mCount = response.data.mainInfoFm[1].genderCount
	    	  }
	    	  
	    	  
	    	  insertCompInfo("group");
	    	  InfoBar();
	    	  makePieInfo();
	    	  makePieInfoFm();
	      },
	      error: function(xhr, status, e){
	         console.error(status+":"+e);
	      }
	   });
}

let RenderChart = (seq) => {
	
	if(seq == 'all'){ 																     //전체면 전체렌더
		groupInfo();
		return;
	}
	
	getCompInfo(seq);																	//아니면 회사정보렌더 
	InfoBar(seq); 	
}

$(function(){
//	$(document).on("click", ".button-css-search", function(event){
//		let type = $("#compSelect option:selected").val();		
//		RenderChart(type); 																//콤보박스 클릭 차트렌더
//	});
	
	$(document).on("click", "#chart-company-table tr", function(event){
		
		$("#chart-company-table tr").css("background-color","");
		$(this).css("background-color","rgb(230, 244, 254)");
		
		let type = $(this).children()[0].outerText;
		
		RenderChart(type); 																//차트렌더
	});
	
})
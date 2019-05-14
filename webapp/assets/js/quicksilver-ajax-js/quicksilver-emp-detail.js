var empDetailRender = function(vo, alldept){
	$(".container-detail").children().remove();
	
	let htmls ="    <table class=\"detail\">\r\n" + 
				"                <tr>\r\n" + 
				"                    <th>사원명(ID)</th>\r\n" + 
				"                    <td>"+ vo.empName + "("+vo.loginId+")</td>\r\n" + 
				"                    <th>생년월일</th>\r\n" + 
				"                    <td>"+ vo.bDay +"</td>\r\n" + 
				"                <tr>\r\n" + 
				"                <tr>\r\n" + 
				"                    <th>직급</th>\r\n" + 
				"                    <td>"+vo.positionCode+"</td>\r\n" + 
				"                    <th>직책</th>\r\n" + 
				"                    <td>"+ vo.dutyCode +"</td>\r\n" + 
				"                </tr>\r\n" + 
				"                <tr>\r\n" + 
				"                    <th>전체부서</th>\r\n" + 
				"                    <td colspan=\"3\">"+ vo.compName +" > "+ alldept + vo.deptName+"</td>\r\n" + 
				"                </tr>\r\n" + 
				"                <tr>\r\n" + 
				"                    <th>휴대전화</th>\r\n" + 
				"                    <td colspan=\"3\">"+vo.mobileTelNum+"</td>\r\n" + 
				"                </tr>\r\n" + 
				"                <tr>\r\n" + 
				"                    <th>전화번호</th>\r\n" + 
				"                    <td>"+vo.homeTelNum+"</td>\r\n" + 
				"                    <th>팩스번호</th>\r\n" + 
				"                    <td>"+vo.faxNum+"</td>\r\n" + 
				"                </tr>\r\n" + 
				"                <tr>\r\n" + 
				"                    <th>회사 홈페이지</th>\r\n" + 
				"                    <td colspan=\"3\">"+vo.compDomain+"</td>\r\n" + 
				"                </tr>\r\n" + 
				"                <tr>\r\n" + 
				"                    <th>개인메일</th>\r\n" + 
				"                    <td colspan=\"3\">"+vo.emailAddr+"</td>\r\n" + 
				"                </tr>\r\n" + 
				"                <tr>\r\n" + 
				"                    <th>담당업무</th>\r\n" + 
				"                    <td colspan=\"3\">"+vo.mainWork+"</td>\r\n" + 
				"                </tr>\r\n" + 
				"            </table>\r\n" + 
				"            <div class=\"pic\">\r\n" + 
				"            <!-- 사원 사진 칸-->    \r\n" + 
				"                <div class=\"photo\">\r\n" + 
				"                    \r\n" + 
				"                    <img src=\'"+ contextPath + vo.picFileID +"'/>    \r\n" + 
				"                     \r\n" + 
				"                </div>    \r\n" + 
				"            </div>\r\n" + 
				"            \r\n" + 
				"        </div>";
	
	let html2 = "<form action='" + contextPath + "/profileImageUpload' method='POST' enctype='multipart/form-data'>" +
			"<input type='hidden' name='empSeq' value='" + vo.empSeq + "'/>" +
			"<input type='file' name='profilePicture' accept='image/jpeg, image/png, image/jpg\' />" +
			"<input type='submit' value='수정'/>" +
			"</form>";
	
	$(".container-detail").append(htmls);
	$(".container-detail").append(html2);
}

let deptInfoList = [];

var getparents = function(deptSeq){
	
	$.ajax({
		url: contextPath + "/getdetailNavPointParents/" + deptSeq, 
		type:"get",
		dataType:"json", 
		data:"",
		async: false, //핵심임 상위가 무조건먼저 렌더되야지 밑에부서가 나오니 무조건 동기로 해야함 
		success: function(response){
		
			 let parentDeptSeq = response.data.parentDeptSeq;
			 let deptName = response.data.deptName; //전체부서표시용
			 let bizName = response.data.bizName; //전체부서표시용
			 
			 console.log(parentDeptSeq+": parentDeptSeq")
			
			 var str;
			 
			 if(parentDeptSeq < 100000 && parentDeptSeq != null ){
				 
				 deptInfoList.push(deptName);
			
				 getparents(parentDeptSeq); //재귀로 맨위에부터 펼쳐지게함 
				 
				 str = $("li[data-no='"+parentDeptSeq+"']").children(".prev").html();
				 getListSearch(parentDeptSeq, "true", str, deptSeq);	
				 
				 $("li[data-no='"+parentDeptSeq+"']").children(".wrap").children(".close-btn ").show();
				 $("li[data-no='"+parentDeptSeq+"']").children(".wrap").children(".open-btn ").hide();
				 console.log("여가나중이고");
			 }else{
				 
				 console.log("여기가먼저일거아녀");
				 
				 deptInfoList.push(bizName);
				 getListSearch(parentDeptSeq, "false" , null, deptSeq);
				 $("li[data-no='"+parentDeptSeq+"']").children(".wrap").children(".close-btn ").show();
				 $("li[data-no='"+parentDeptSeq+"']").children(".wrap").children(".open-btn ").hide();
				
			 }
			},
	      error: function(xhr, status, e){
	         console.error(status+":"+e);
	      }
	});
}
$(function(){
	$(document).on("click", "tbody tr[role='row']", function(event){	
		deptInfoList=[];
		let empSeq = this.children[0].innerHTML;
		let deptSeq = this.children[1].innerHTML;

		console.log(deptSeq)
		
		$.ajax({
			  url: contextPath + "/getdetailNavPoint/" + empSeq + "/" + deptSeq,
		      type:"get",
		      dataType:"json",
		      data:"",
		      success: function(response){
		    	  
		    	  let deptSeq = response.data.deptSeq;
		    	  let compSeq = response.data.compSeq;

		    	//  console.log(response.data);
		    	  
		    	 $("ul[c-no='" + compSeq + "']").empty();
//		    	 $("div[data-no!='"+ compSeq +"']").next("ul").attr('class','dropdown-menu');
//		    	  $("div[data-no='"+ compSeq +"']").next("ul").attr('class','dropdown-menu show');
//		    	  
		    	  getBizList(compSeq);
		    	  getparents(deptSeq);
		      },
		      error: function(xhr, status, e){
		         console.error(status+":"+e);
		      }
		});

		$.ajax({
			url: contextPath + "/getdetailEmployeeInfo/" + empSeq + "/" + deptSeq,
		      type:"get",
		      dataType:"json",
		      data:"",
		      success: function(response){
		    	  console.log($(response.data)[0]);
		    	  
		    	  console.log(deptInfoList);
		    	  
		    	  let alldept = "";
		    	  
		    	  for(let i=0; i<deptInfoList.length; i++){
		    		  console.log(deptInfoList[deptInfoList.length-(i+1)]);
		    		  alldept = alldept.concat((deptInfoList[deptInfoList.length-(i+1)] + " > ")); 
		    	  }
		    	  console.log(alldept);
		    	  
		    	  empDetailRender($(response.data)[0], alldept);
//		    	  empDetailScroll();
		      },
		      error: function(xhr, status, e){
		         console.error(status+":"+e);
		      }
		});

	});
});

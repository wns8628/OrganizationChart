//사원 디테일 렌더링
var empDetailRender = function(vo, alldept){
   $(".container-detail").children().remove();
   
   let htmls ="    <table class=\"detail\">\r\n" + 
            "                <tr>\r\n" + 
            "                    <th class='lang' data-lang='empName'>사원명(ID)</th>\r\n" + 
            "                    <td><span class='lang emp' data-lang='"+vo.empSeq+"'>"+vo.empName+"</span><span>("+ vo.loginId+")</span></td>\r\n" + 
            "                    <th class='lang' data-lang='birth'>생년월일</th>\r\n" + 
            "                    <td>"+ vo.bDay +"</td>\r\n" + 
            "                <tr>\r\n" + 
            "                <tr>\r\n" + 
            "                    <th class='lang' data-lang='position'>직급</th>\r\n" + 
            "                    <td class='lang dp' data-val='"+vo.compSeq+"' data-lang='"+vo.positionCode+"'></td>\r\n" + 
            "                    <th class='lang' data-lang='duty'>직책</th>\r\n" + 
            "                    <td class='lang dp' data-val='"+vo.compSeq+"' data-lang='"+vo.dutyCode+"'></td>\r\n" + 
            "                </tr>\r\n" + 
            "                <tr>\r\n" + 
            "                    <th class='lang' data-lang='totalDept'>전체부서</th>\r\n" + 
//            "                    <td colspan=\"3\">"+ vo.compName +" > "+ alldept + vo.deptName+"</td>\r\n" + 
            "                    <td colspan=\"3\"><span id='total' class='lang comp' data-lang='"+vo.compSeq+"'></span><span> > </span><span class='lang dept' data-lang='"+vo.deptSeq+"'></span></td>\r\n" + 
            "                </tr>\r\n" + 
            "                <tr>\r\n" + 
            "                    <th class='lang' data-lang='phone'>휴대전화</th>\r\n" + 
            "                    <td colspan=\"3\">"+vo.mobileTelNum+"</td>\r\n" + 
            "                </tr>\r\n" + 
            "                <tr>\r\n" + 
            "                    <th class='lang' data-lang='call'>전화번호</th>\r\n" + 
            "                    <td>"+vo.homeTelNum+"</td>\r\n" + 
            "                    <th class='lang' data-lang='fax'>팩스번호</th>\r\n" + 
            "                    <td>"+vo.faxNum+"</td>\r\n" + 
            "                </tr>\r\n" + 
            "                <tr>\r\n" + 
            "                    <th class='lang' data-lang='compDomain'>회사 홈페이지</th>\r\n" + 
            "                    <td colspan=\"3\">"+vo.compDomain+"</td>\r\n" + 
            "                </tr>\r\n" + 
            "                <tr>\r\n" + 
            "                    <th class='lang' data-lang='email'>개인메일</th>\r\n" + 
            "                    <td colspan=\"3\">"+vo.emailAddr+"</td>\r\n" + 
            "                </tr>\r\n" + 
            "                <tr>\r\n" + 
            "                    <th class='lang' data-lang='work'>담당업무</th>\r\n" + 
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

//부모찾아서 상위부터 펼치기 ajax
let deptInfoList = []; 																					//전체부서표시용
var getparents = function(deptSeq){
   $.ajax({
      url: contextPath + "/getdetailNavPointParents/" + deptSeq, 
      type:"get",
      dataType:"json", 
      data:"",
      async: false, 																					//핵심임 상위가 무조건먼저 렌더되야지 밑에부서가 나오니 무조건 동기로 해야함 
      success: function(response){
      
          let parentDeptSeq = response.data.parentDeptSeq;
          let deptSeq2 = response.data.deptSeq;													    //전체부서표시용
          let bizSeq2 = response.data.bizSeq; 															//전체부서표시용
          var str;
          
          if(parentDeptSeq < 100000 && parentDeptSeq != null ){
             
             deptInfoList.push(deptSeq2); 																//전체부서표시용
             getparents(parentDeptSeq); 																//재귀로 맨위에부터 펼쳐지게함 
             
             str = $("li[data-no='"+parentDeptSeq+"']").children(".prev").html();
             
             if($("li[data-no='"+parentDeptSeq+"'").children(".wrap").children('.last').length == 0){
                getListNavPoint(parentDeptSeq, "false", str, deptSeq); 									//quicksilver-nav에있다 nav탭관련이라.
             }else{
                getListNavPoint(parentDeptSeq, "true", str, deptSeq);
             }
             $("li[data-no='"+parentDeptSeq+"']").children(".wrap").children(".close-btn ").show();
             $("li[data-no='"+parentDeptSeq+"']").children(".wrap").children(".open-btn ").hide();
          }else{
             deptInfoList.push(bizSeq2);
             if($("li[data-no='"+parentDeptSeq+"'").children(".wrap").children('.last').length == 0){
                getListNavPoint(parentDeptSeq, "false", null, deptSeq);
             }else{
                getListNavPoint(parentDeptSeq, "true", null, deptSeq);
             }
             $("li[data-no='"+parentDeptSeq+"']").children(".wrap").children(".close-btn ").show();
             $("li[data-no='"+parentDeptSeq+"']").children(".wrap").children(".open-btn ").hide();  
          }
         },
         error: function(xhr, status, e){
            console.error(status+":"+e);
         }
   });
}

let fixScroll=0;																					   //스크롤위해
$(function(){
	//테이블 행 클릭
	$(document).on("click", "tbody tr.row", function(event){   
		$("li.comp").next().children().remove();
		$.lang.kr.biz = {};
		$.lang.en.biz = {};
//		$.lang.kr.dept = {};
//		$.lang.en.dept = {};
      deptInfoList=[];
      let empSeq = this.children[0].innerHTML;
      let deptSeq = this.children[1].innerHTML;
      //조직도 부서 펼치기
      $.ajax({
           url: contextPath + "/getdetailNavPoint/" + empSeq + "/" + deptSeq,
            type:"get",
            dataType:"json",
            data:"",
            async: false,
            success: function(response){
               let deptSeq = response.data.deptSeq;
               let compSeq = response.data.compSeq;
        
              $("ul[c-no='" + compSeq + "']").empty();
              	console.log("Dd");
               getBizList(compSeq); 																    //quicksilver-nav에있다 nav탭관련이라.
               getparents(deptSeq); 
            },
            error: function(xhr, status, e){
               console.error(status+":"+e);
            }
      });

      //사원 디테일표시 시  : "QS전자 -> 사업장1 -> 부서1" 이거 표시용 ajax
      $.ajax({
         url: contextPath + "/getdetailEmployeeInfo/" + empSeq + "/" + deptSeq,
            type:"get",
            dataType:"json",
            data:"",
            async: false,
            success: function(response){         
               let alldept = "";
               console.log($(response.data)[0]);
               for(let i=0; i<deptInfoList.length; i++){
                  alldept = alldept.concat((deptInfoList[deptInfoList.length-(i+1)] + " > ")); 
               }
               
               for(var key in $(response.data)[0]){ 
	    		 if($(response.data)[0][key] == null) {
	    			 $(response.data)[0][key] = "";
				 }
               }
               
               empDetailRender($(response.data)[0], alldept);
               
               if(deptInfoList.length > 1){
            	   var htmls = "";
            	   for(var i=deptInfoList.length-1; i>=0; i--){
            		   if(i==1){
            			   htmls += "<span> > </span><span class='lang biz' data-lang='"+deptInfoList[i]+"'></span>";
            		   }else{
            			   htmls += "<span> > </span><span class='lang dept' data-lang='"+deptInfoList[i]+"'></span>";
            		   }
            	   }
            	   $("#total").after(htmls);
               }else{
            	  var htmls = "<span> > </span><span class='lang biz' data-lang='"+deptInfoList[0]+"'></span>";
               	  $("#total").after(htmls);
               }
            	   
               //부서번호다를떄만
               if(fixScroll != deptSeq){
            	   fixScroll = deptSeq;
            	   empDetailScroll(fixScroll);
               }
               
               $("table.detail .lang").each(function(){
  	        	 if($(this).attr("class") == "lang dept"){
  	        		 var text = $.lang[mainLangCode]["dept"][$(this).data("lang")];
  	        	 }else if($(this).attr("class") == "lang dp"){
  	        		 var seq = $(this).data("lang");
  	        		 var text = $.lang[mainLangCode]["dp"][seq];
  	        	 }else if($(this).attr("class") == "lang emp"){
  	        		 var seq = $(this).data("lang");
  	        		 var text = $.lang[mainLangCode]["emp"][seq];
  	        	 }else{
  	        		var text = $.lang[mainLangCode]["etc"][$(this).data('lang')];
	  	      		if (text == null){
	  	      			text = $.lang['kr']["etc"][$(this).data('lang')]
	  	      		}
	  	      		$(this).text(text);
  	        	 }
  	        	 
  	        	 
  	        	 $(this).text(text);
  	         });
              
               
            },
            error: function(xhr, status, e){
               console.error(status+":"+e);
            }
      });
      langChange(mainLangCode);
   });
});
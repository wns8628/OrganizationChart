var empDetailRender = function(vo){
	$(".container").children().remove();
	
	let htmls =
		"				    <div class=\"view-account\">\r\n" + 
		"				        <section class=\"module\">\r\n" + 
		"				            <div class=\"module-inner\">\r\n" + 
		"				                <div class=\"side-bar\">\r\n" + 
		"				                    <div class=\"user-info\">\r\n" + 
		"				                        <img class=\"img-profile img-circle img-responsive center-block\" src=\"" + contextPath + vo.picFileID + "\" alt=\"\">\r\n" + 
		"				                        <ul class=\"meta list list-unstyled\">\r\n" + 
		"				                            <li style=\"display: block;\" class=\"name\">" + vo.empName + "\r\n" + 
		"				                                <label style=\"display: block; class=\"label label-info\">" + vo.mainWork + "</label>\r\n" + 
		"				                            </li>\r\n" + 
		"				                            <li style=\"font-size: 0.8em;\" class=\"email\"><a href=\"#\">" + vo.emailAddr + "</a></li>\r\n" + 
		"				                            <li class=\"activity\"></li>\r\n" + 
		"				                        </ul>\r\n" + 
		"				                    </div>\r\n" + 
		"				            		<nav class=\"side-menu\">\r\n" + 
		"				        				<ul class=\"nav\">\r\n" + 
		"				        					<li class=\"active\"><a href=\"#\"><span class=\"fa fa-user\"></span> Profile</a></li>\r\n" + 
		"				        					<li><a href=\"#\"><span class=\"fa fa-cog\"></span> Settings</a></li>\r\n" + 
		"				        					<li><a href=\"#\"><span class=\"fa fa-credit-card\"></span> Billing</a></li>\r\n" + 
		"				        					<li><a href=\"#\"><span class=\"fa fa-envelope\"></span> Messages</a></li>\r\n" + 
		"				        					\r\n" + 
		"				        					<li><a href=\"user-drive.html\"><span class=\"fa fa-th\"></span> Drive</a></li>\r\n" + 
		"				        					<li><a href=\"#\"><span class=\"fa fa-clock-o\"></span> Reminders</a></li>\r\n" + 
		"				        				</ul>\r\n" + 
		"				        			</nav>\r\n" + 
		"				                </div>\r\n" + 
		"				                <div class=\"content-panel\">\r\n" + 
		"				                    <h2 class=\"title\">Profile<span class=\"pro-label label label-warning\">PRO</span></h2>\r\n" + 
		"				                    <form class=\"form-horizontal\">\r\n" + 
		"				                        <fieldset class=\"fieldset\">\r\n" + 
		"				                            <h3 class=\"fieldset-title\">Personal Info</h3>\r\n" + 
		"				                            <div class=\"form-group avatar\">\r\n" + 
		"				                                <figure class=\"figure col-md-2 col-sm-3 col-xs-12\">\r\n" + 
		"				                                    <img class=\"img-rounded img-responsive\" src=\"" + contextPath + vo.picFileID + "\" alt=\"\">\r\n" + 
		"				                                </figure>\r\n" + 
		" 												<form style=\"display: none;\"action=\"profileImageUpload\"  method=\"POST\" enctype=\"multipart/form-data\">\r\n" +
			"				                                <div class=\"form-inline col-md-10 col-sm-9 col-xs-12\">\r\n" + 
			"				                                    <input type=\"hidden\" name=\"profilePicture\" accept=\"image/jpg, image/png\" class=\"file-uploader pull-left\">\r\n" + 
			"				                                    <button style=\"display: none;\" type=\"hidden\" class=\"btn btn-sm btn-default-alt pull-left\">Update Image</button>\r\n" + 
			"				                                </div>\r\n" + 
		"												</form>\r\n" + 
		"				                            </div>\r\n" +
		" 												<form action=\"" + contextPath + "/profileImageUpload\"  method=\"POST\" th:object=\"${spitter}\" enctype=\"multipart/form-data\">\r\n" +
		"				                                    <input type=\"hidden\" name=\"empSeq\" value=\"" + vo.empSeq + "\">\r\n" + 
		"				                                    <input type=\"file\" name=\"profilePicture\" class=\"file-uploader pull-left\">\r\n" + 
		"				                                    <button type=\"submit\" class=\"btn btn-sm btn-default-alt pull-left\">Update Image</button>\r\n" + 
		"												</form>\r\n" + 
		"				                            <div class=\"form-group\">\r\n" + 
		"				                                <div style=\"display: inline-block\" class=\"make\">\r\n" + 
		"				                             		<label style=\"display: inline\" class=\"col-md-2 col-sm-3 col-xs-12 control-label make\">이름</label>\r\n" + 
		"				                                    <input style=\"width: 200px; display: block;\"type=\"text\" readonly class=\"form-control inputSize\" value=\"" + vo.empName + "\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                                <div style=\"display: inline-block\" class=\" make\">\r\n" + 
		"				                               		 <label style=\"display: inline\" class=\"col-md-2 col-sm-3 col-xs-12 control-label make\">나이</label>\r\n" + 
		"				                                    <input style=\"width: 200px; display: block;\" type=\"text\" readonly class=\"form-control\" value=\"" + vo.age + "\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                                <div style=\"display: inline-block\" class=\" make\">\r\n" + 
		"				                               		 <label style=\"display: inline\" class=\"col-md-2 col-sm-3 col-xs-12 control-label make\">성별</label>\r\n" + 
		"				                                    <input style=\"width: 200px; display: block;\" type=\"text\" readonly class=\"form-control\" value=\"" + vo.genderCode + "\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                            </div>\r\n" + 
		"				        \r\n" + 
		"				                            <div class=\"form-group\">\r\n" + 
		"				                                <div style=\"display: inline-block\" class=\"make\">\r\n" + 
		"				                             		<label style=\"display: inline\" class=\"col-md-2 col-sm-3 col-xs-12 control-label make\">그룹</label>\r\n" + 
		"				                                    <input style=\"width: 200px; display: block;\"type=\"text\" readonly class=\"form-control inputSize\" value=\"" + vo.groupSeq + "\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                                <div style=\"display: inline-block\" class=\" make\">\r\n" + 
		"				                               		 <label style=\"display: inline\" class=\"col-md-2 col-sm-3 col-xs-12 control-label make\">회사</label>\r\n" + 
		"				                                    <input style=\"width: 200px; display: block;\" type=\"text\" readonly class=\"form-control\" value=\"" + vo.mainCompSeq + "\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                                <div style=\"display: inline-block\" class=\" make\">\r\n" + 
		"				                               		 <label style=\"display: inline\" class=\"col-md-2 col-sm-3 col-xs-12 control-label make\">사업장</label>\r\n" + 
		"				                                    <input style=\"width: 200px; display: block;\" type=\"text\" readonly class=\"form-control\" value=\"" + vo.bizName + "\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                            </div>\r\n" + 
		"				                            <div class=\"form-group\">\r\n" + 
		"				                                <div style=\"display: inline-block\" class=\"make\">\r\n" + 
		"				                             		<label style=\"display: inline\" class=\"col-md-2 col-sm-3 col-xs-12 control-label make\">결혼유무</label>\r\n" + 
		"				                                    <input style=\"width: 200px; display: block;\"type=\"text\" readonly class=\"form-control inputSize\" value=\"" + vo.weddingYn + "\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                                <div style=\"display: inline-block\" class=\" make\">\r\n" + 
		"				                               		 <label style=\"display: inline\" class=\"col-md-2 col-sm-3 col-xs-12 control-label make\">생일</label>\r\n" + 
		"				                                    <input style=\"width: 200px; display: block;\" type=\"text\" readonly class=\"form-control\" value=\"" + vo.bDay + "\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                                <div style=\"display: inline-block\" class=\" make\">\r\n" + 
		"				                               		 <label style=\"display: inline\" class=\"col-md-2 col-sm-3 col-xs-12 control-label make\">입사일</label>\r\n" + 
		"				                                    <input style=\"width: 200px; display: block;\" type=\"text\" readonly class=\"form-control\" value=\"" + vo.joinDay + "\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                            </div>\r\n" +
		"				                            <div class=\"form-group\">\r\n" + 
		"				                                <div style=\"display: inline-block\" class=\"make\">\r\n" + 
		"				                             		<label style=\"display: inline\" class=\"col-md-2 col-sm-3 col-xs-12 control-label make\">직책</label>\r\n" + 
		"				                                    <input style=\"width: 200px; display: block;\"type=\"text\" readonly class=\"form-control inputSize\" value=\"" + vo.dutyCode + "\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                                <div style=\"display: inline-block\" class=\" make\">\r\n" + 
		"				                               		 <label style=\"display: inline\" class=\"col-md-2 col-sm-3 col-xs-12 control-label make\">직급</label>\r\n" + 
		"				                                    <input style=\"width: 200px; display: block;\" type=\"text\" readonly class=\"form-control\" value=\"" + vo.positionCode + "\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                                <div style=\"display: inline-block\" class=\" make\">\r\n" + 
		"				                               		 <label style=\"display: inline\" class=\"col-md-2 col-sm-3 col-xs-12 control-label make\">담당업무</label>\r\n" + 
		"				                                    <input style=\"width: 200px; display: block;\" type=\"text\" readonly class=\"form-control\" value=\"" + vo.mainWork + "\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                            </div>\r\n" + 
		"				                            <div class=\"form-group\">\r\n" + 
		"				                                <label class=\"col-md-2 col-sm-3 col-xs-12 control-label make\">주소</label>\r\n" + 
		"				                                <div class=\"col-md-10 col-sm-9 col-xs-12 make\">\r\n" + 
		"				                                    <input type=\"text\" class=\"form-control\" readonly value=\"" + vo.detailAddr + "\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                            </div>\r\n" +
		"				                        </fieldset>\r\n" + 
		"				                        <fieldset class=\"fieldset\">\r\n" + 
		"				                            <h3 class=\"fieldset-title\">Contact Info</h3>\r\n" + 
		"				                            <div class=\"form-group\">\r\n" + 
		"				                                <label class=\"col-md-2  col-sm-3 col-xs-12 control-label\">Email</label>\r\n" + 
		"				                                <div class=\"col-md-10 col-sm-9 col-xs-12\">\r\n" + 
		"				                                    <input type=\"email\" class=\"form-control\" readonly value=\"" + vo.emailAddr + "\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                            </div>\r\n" + 
		"				                            <div class=\"form-group\">\r\n" + 
		"				                                <label class=\"col-md-2  col-sm-3 col-xs-12 control-label\">폰번호</label>\r\n" + 
		"				                                <div class=\"col-md-10 col-sm-9 col-xs-12\">\r\n" + 
		"				                                    <input type=\"text\" class=\"form-control\" readonly value=\"" + vo.mobileTelNum + "\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                            </div>\r\n" + 
		"				                        </fieldset>\r\n" + 
		"				                        <hr>\r\n" + 
		"				                        <div class=\"form-group\">\r\n" + 
		"				                            <div class=\"col-md-10 col-sm-9 col-xs-12 col-md-push-2 col-sm-push-3 col-xs-push-0\">\r\n" + 
		"				                                <input class=\"btn btn-primary\" type=\"submit\" value=\"Update Profile\">\r\n" + 
		"				                            </div>\r\n" + 
		"				                        </div>\r\n" + 
		"				                    </form>\r\n" + 
		"				                </div>\r\n" + 
		"				            </div>\r\n" + 
		"				        </section>\r\n" + 
		"				    </div>";
	$(".container").append(htmls);
}

var getparents = function(deptSeq){
	let langCode = 'kr';
	console.log(deptSeq +"asdasdasdsada");
	$.ajax({
		url: contextPath + "/getdetailNavPointParents/" + deptSeq + "/" + langCode,
		type:"get",
		dataType:"json",
		data:"",
		async: false, //핵심임 상위가 무조건먼저 렌더되야지 밑에부서가 나오니 무조건 동기로 해야함
		success: function(response){
			 if(response.data < 100000 && response.data != null ){
				 getparents(response.data); //재귀로 맨위에부터 펼쳐지게함 
				 getListSearch(response.data,deptSeq);	
				 console.log("여가나중이고");
			 }else{
				 console.log("여기가먼저일거아녀");
				 getListSearch(response.data,deptSeq);								 
			 }
			},
	      error: function(xhr, status, e){
	         console.error(status+":"+e);
	      }
	});
}
$(function(){
	$(document).on("click", "tbody tr", function(event){	
		let empNum = this.children[0].innerHTML;
		let empPath= $(this).children().children("img").attr("src");
		let langCode = 'kr';
		
		$.ajax({
			  url: contextPath + "/getdetailNavPoint/" + empNum + "/" + langCode,
		      type:"get",
		      dataType:"json",
		      data:"",
		      success: function(response){
		    	  
		    	  let deptSeq = response.data.deptSeq;
		    	  let compSeq = response.data.compSeq;
		    	  
		    	//  console.log(response.data);
		    	  
		    	 $("ul[c-no='" + compSeq + "']").empty();
		    	 $("div[data-no!='"+ compSeq +"']").next("ul").attr('class','dropdown-menu');
		    	  $("div[data-no='"+ compSeq +"']").next("ul").attr('class','dropdown-menu show');
		    	  
		    	  getBizList(compSeq);
		    	  getparents(deptSeq);
		    	  console.log("언제??")
		    	  
		      },
		      error: function(xhr, status, e){
		         console.error(status+":"+e);
		      }
		});

		$.ajax({
			url: contextPath + "/getdetailEmployeeInfo/" + empNum + "/" + langCode,
		      type:"get",
		      dataType:"json",
		      data:"",
		      success: function(response){
		    	  console.log($(response.data)[0]);
		    	  empDetailRender($(response.data)[0]);
		      },
		      error: function(xhr, status, e){
		         console.error(status+":"+e);
		      }
		});

	});
});

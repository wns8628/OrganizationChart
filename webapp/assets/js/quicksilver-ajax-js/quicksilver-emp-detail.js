var empDetailRender = function(empPath){
	$(".container").children().remove();				
	let htmls =
		"				    <div class=\"view-account\">\r\n" + 
		"				        <section class=\"module\">\r\n" + 
		"				            <div class=\"module-inner\">\r\n" + 
		"				                <div class=\"side-bar\">\r\n" + 
		"				                    <div class=\"user-info\">\r\n" + 
		"				                        <img class=\"img-profile img-circle img-responsive center-block\" src=\"" + empPath + "\" alt=\"\">\r\n" + 
		"				                        <ul class=\"meta list list-unstyled\">\r\n" + 
		"				                            <li class=\"name\">Rebecca Sanders\r\n" + 
		"				                                <label class=\"label label-info\">UX Designer</label>\r\n" + 
		"				                            </li>\r\n" + 
		"				                            <li class=\"email\"><a href=\"#\">Rebecca.S@website.com</a></li>\r\n" + 
		"				                            <li class=\"activity\">Last logged in: Today at 2:18pm</li>\r\n" + 
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
		"				                                    <img class=\"img-rounded img-responsive\" src=\"" + empPath + "\" alt=\"\">\r\n" + 
		"				                                </figure>\r\n" + 
		"				                                <div class=\"form-inline col-md-10 col-sm-9 col-xs-12\">\r\n" + 
		"				                                    <input type=\"file\" class=\"file-uploader pull-left\">\r\n" + 
		"				                                    <button type=\"submit\" class=\"btn btn-sm btn-default-alt pull-left\">Update Image</button>\r\n" + 
		"				                                </div>\r\n" + 
		"				                            </div>\r\n" + 
		"				                            <div class=\"form-group\">\r\n" + 
		"				                                <label class=\"col-md-2 col-sm-3 col-xs-12 control-label\">User Name</label>\r\n" + 
		"				                                <div class=\"col-md-10 col-sm-9 col-xs-12\">\r\n" + 
		"				                                    <input type=\"text\" class=\"form-control\" value=\"Rebecca\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                            </div>\r\n" + 
		"				        \r\n" + 
		"				                            <div class=\"form-group\">\r\n" + 
		"				                                <label class=\"col-md-2 col-sm-3 col-xs-12 control-label\">First Name</label>\r\n" + 
		"				                                <div class=\"col-md-10 col-sm-9 col-xs-12\">\r\n" + 
		"				                                    <input type=\"text\" class=\"form-control\" value=\"Rebecca\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                            </div>\r\n" + 
		"				                            <div class=\"form-group\">\r\n" + 
		"				                                <label class=\"col-md-2 col-sm-3 col-xs-12 control-label\">Last Name</label>\r\n" + 
		"				                                <div class=\"col-md-10 col-sm-9 col-xs-12\">\r\n" + 
		"				                                    <input type=\"text\" class=\"form-control\" value=\"Sanders\">\r\n" + 
		"				                                </div>\r\n" + 
		"				                            </div>\r\n" + 
		"				                        </fieldset>\r\n" + 
		"				                        <fieldset class=\"fieldset\">\r\n" + 
		"				                            <h3 class=\"fieldset-title\">Contact Info</h3>\r\n" + 
		"				                            <div class=\"form-group\">\r\n" + 
		"				                                <label class=\"col-md-2  col-sm-3 col-xs-12 control-label\">Email</label>\r\n" + 
		"				                                <div class=\"col-md-10 col-sm-9 col-xs-12\">\r\n" + 
		"				                                    <input type=\"email\" class=\"form-control\" value=\"Rebecca@website.com\">\r\n" + 
		"				                                    <p class=\"help-block\">This is the email </p>\r\n" + 
		"				                                </div>\r\n" + 
		"				                            </div>\r\n" + 
		"				                            <div class=\"form-group\">\r\n" + 
		"				                                <label class=\"col-md-2  col-sm-3 col-xs-12 control-label\">Twitter</label>\r\n" + 
		"				                                <div class=\"col-md-10 col-sm-9 col-xs-12\">\r\n" + 
		"				                                    <input type=\"text\" class=\"form-control\" value=\"SpeedyBecky\">\r\n" + 
		"				                                    <p class=\"help-block\">Your twitter username</p>\r\n" + 
		"				                                </div>\r\n" + 
		"				                            </div>\r\n" + 
		"				                            <div class=\"form-group\">\r\n" + 
		"				                                <label class=\"col-md-2  col-sm-3 col-xs-12 control-label\">Linkedin</label>\r\n" + 
		"				                                <div class=\"col-md-10 col-sm-9 col-xs-12\">\r\n" + 
		"				                                    <input type=\"url\" class=\"form-control\" value=\"https://www.linkedin.com/in/lorem\">\r\n" + 
		"				                                    <p class=\"help-block\">eg. https://www.linkedin.com/in/yourname</p>\r\n" + 
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

$(function(){
	$(document).on("click", "tbody tr", function(event){	
		let empPath= $(this).children().children("img").attr("src");  
		empDetailRender(empPath);
	});
});

//부서펼치기 스크롤이동
let empDetailScroll = function(deptSeq){
	console.log(deptSeq);
	
	var scmove = $('span.dept[data-lang='+deptSeq+']').offset().top;
	console.log(scmove);
	$('#main-tree').animate( { scrollTop : (scmove) }, 600 );
}
$(function(){

});
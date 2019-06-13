let menuActive = function(){
	var menuList = $("div.menu li");
	for (var i = 0; i < menuList.length; i++) {
		if ($(menuList[i]).text() === $("#contents-header span:last")
				.text()) {
			$(menuList[i]).parent().parent().show().prev().addClass(
					"active");
			$(menuList[i]).children().css("color", "#328CF5").css(
					"font-weight", "bold");
		}
	}
}

let ArrowChange = () => {
	$(".active").each( (index, item) => {
		item.children[2].classList.toggle('icon2');
		item.children[1].classList.toggle('icon2');
	});
};


$(function(){
	menuActive();
	ArrowChange();
	
	$("div.parent-menu").click(function(){
		$this = $(this);
		$icon1 = $this.children().next();
		$icon2 = $this.children().next().next();
		if($this.next().css("display") == "none"){
			$this.addClass("active");
			$this.next().show();
			$icon1.hide();
			$icon2.show();
		}else{
			$this.removeClass("active");
			$this.next().hide();
			$icon1.show();
			$icon2.hide();
		}
	});
   	
	$("div.meun ul li a").click(function(){
		var htmls = "<img alt='' src='/quicksilver/assets/images/next.png'>"+
					"<span>"+$(this).text()+"</span>";
		$("div#contents-header").append(htmls);
	});

});
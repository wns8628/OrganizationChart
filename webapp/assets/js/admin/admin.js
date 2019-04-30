$(function(){
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
});
let oneOpenYn;
let twoOpenYn;

let menuActive = function(){
	var menuList = $("div.menu li");
	for (var i = 0; i < menuList.length; i++) {
		if ($(menuList[i]).text() === $("#contents-header span:last").text()) {
//			$(menuList[i]).parent().parent().show().prev().addClass(
//					"active");
			$(menuList[i]).children().css("color", "#328CF5").css(
					"font-weight", "bold");
		}
	}
	
	console.log($(".oneOpenYn").html());
	console.log($(".twoOpenYn").html());
	
	if($(".oneOpenYn").html() == 'true' ){
		$(".parent-menu").eq(0).addClass("active").next().show();
		oneOpenYn = true;
	}else{
		oneOpenYn = false;	
	};
	if($(".twoOpenYn").html() == 'true' ){
		$(".parent-menu").eq(1).addClass("active").next().show();
		twoOpenYn = true;
	}else{
		twoOpenYn = false;	
	};
	
}

let ArrowChange = () => {
	$(".active").each( (index, item) => {
		console.log(item);
		item.children[2].classList.toggle('icon2');
		item.children[1].classList.toggle('icon2');
	});
};

//모달창위해
let messageBox = function(title, message){
	$("#dialog-message").attr({
		title: title
	});
	$("#dialog-message p").text(message);
	$("#dialog-message").dialog({
		modal: true,
		buttons: {
			"확인": function(){
				$(this).dialog("close");
			}
		},
	});
};

let questionBox = function(title, message){
	
	let def = $.Deferred();
	
	$("#dialog-message").attr({
		title: title
	});
	$("#dialog-message p").text(message);
	$("#dialog-message").dialog({
		modal: true,
		buttons: {
			"예": function(){
				$(this).dialog("close");
				def.resolve("Yes");
			},
			"아니요": function(){
				$(this).dialog("close");
				def.resolve("No");
			}
		},
	});
	return def.promise();
};
//



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
		
		oneOpenYn = $(".parent-menu").eq(0).hasClass("active");
		twoOpenYn =	$(".parent-menu").eq(1).hasClass("active");
		
		console.log(oneOpenYn);
		console.log(twoOpenYn);

	});
   	
	$("div.meun ul li a").click(function(){
		var htmls = "<img alt='' src='/quicksilver/assets/images/next.png'>"+
					"<span>"+$(this).text()+"</span>";
		$("div#contents-header").append(htmls);
	});

});
let totalAge = new Array();	
let ageName = new Array();	
let token = new Array();	
let myPieChart;

let gender = new Array();
let genderCount = new Array();


//연령대 차트
let makePieInfo = function(){
	ageName = [];
	totalAge = [];
	for(let i = 0; i<5; i++){ //20대부터 60대라서 < 5
		token = $("div[data-age='"+(i+1)+"']").html().split(':');
		ageName.push(token[0]);
		totalAge.push(token[1]);
	}	
	makePie();
}
let makePie = function(){

	if(myPieChart != null){
		resetCanvasPie();
	}
	
	// Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontColor = '#292b2c';
		
	// Pie Chart Example
    let ctx = document.getElementById("myPieChart");

    myPieChart = new Chart(ctx, {
	  type: 'pie',
	  data: {
	    labels: ageName,
	    datasets: [{
	      data: totalAge,
	      backgroundColor: ['#3A86D2','#85C1E9', '#D5DBDB', '#EFF6FE','white'],
	      borderColor: "rgba(2,117,216,1)",
	      borderWidth: 1
	    }],
	  },
	  
	  options: {
	  	 plugins:{
	  		 labels: [{
	  		    render: 'percentage',
	  		  },{
	  			render: 'label',
	  		    position:'outside'
	  		  }]
	  	  },
	  }
	});
}
//남여 차트
let makePieInfoFm = function(){
	gender = [];
	genderCount = [];
	for(let i = 6; i<8; i++){ //20대부터 60대라서 < 5
		token = $("div[data-age='"+(i)+"']").html().split(':');
		gender.push(token[0]);
		genderCount.push(token[1]);
	}	
	makePieFm();
}
let makePieFm = function(){

	if(myPieChartFm != null){
		resetCanvasPieFm();
	}
	
	// Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontColor = '#292b2c';
		
	// Pie Chart Example
    let ctx = document.getElementById("myPieChartFm");

    myPieChartFm = new Chart(ctx, {
	  type: 'pie',
	  data: {
	    labels: gender,
	    datasets: [{
	      data: genderCount,
	      backgroundColor: ['#66a9dd','#ef859b'],
	      borderColor: "lightgrey",
	      borderWidth: 1
	    }],
	  },
	  
     options: {
	  	 plugins:{
	  		 labels:
  			 [
	  			  {
		  		    render: 'percentage',
		  		  },
		  		  {
		  			render: 'label',
		  		    position:'outside'
		  		  },
//		  		  {
//		  			 render:'image',
//		  			position:'outside',
//		  			 images:[
//			  			      { src: contextPath + '/assets/images/boy.png', width: 40, height: 22 },
//			  			      { src: contextPath + '/assets/images/girl.png', width: 40, height: 22 }
//		  			      	 ]
//		  		  }
	  		  ]
	  	  },
	  }
	  
	});
}


//지우기
var resetCanvasPie = function(){
	  $('#myPieChart').remove(); // this is my <canvas> element
	  $('#graph-container-pie').append('<canvas id="myPieChart" width="100%" height="50"><canvas>');
	  canvas = document.querySelector('#myPieChart');
	  ctx = canvas.getContext('2d');
	  console.log(ctx);
//	  ctx.canvas.width = $('#graph').width(); // resize to parent width
//	  ctx.canvas.height = $('#graph').height(); // resize to parent height
	  var x = canvas.width/2;
	  var y = canvas.height/2;
	  ctx.font = '10pt Verdana';
	  ctx.textAlign = 'center';
	  ctx.fillText('This text is centered on the canvas', x, y);
};
//남여 지우기
var resetCanvasPieFm = function(){
	  $('#myPieChartFm').remove(); // this is my <canvas> element
	  $('#graph-container-pie-fm').append('<canvas id="myPieChartFm" width="100%" height="50"><canvas>');
	  canvas = document.querySelector('#myPieChartFm');
	  ctx = canvas.getContext('2d');
	  console.log(ctx);
//	  ctx.canvas.width = $('#graph').width(); // resize to parent width
//	  ctx.canvas.height = $('#graph').height(); // resize to parent height
	  var x = canvas.width/2;
	  var y = canvas.height/2;
	  ctx.font = '10pt Verdana';
	  ctx.textAlign = 'center';
	  ctx.fillText('This text is centered on the canvas', x, y);
};

$(function(){
	
	makePieInfo();
	makePieInfoFm();
});

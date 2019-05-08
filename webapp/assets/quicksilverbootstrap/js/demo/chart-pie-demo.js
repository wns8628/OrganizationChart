let totalAge = new Array();	
let ageName = new Array();	
let token = new Array();	
let myPieChart;
let makePieInfo = function(){
	ageName = [];
	totalAge = [];
	for(let i = 0; i<6; i++){
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
	Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#292b2c';
		
	// Pie Chart Example
    let ctx = document.getElementById("myPieChart");

    myPieChart = new Chart(ctx, {
	  type: 'pie',
	  data: {
	    labels: ageName,
	    datasets: [{
	      data: totalAge,
	      backgroundColor: ['#7A7979','#007bff', '#dc3545', '#ffc107', '#28a745', '#0B0909'],
	    }],
	  },
	  
	  options: {
		 
	  }
	});
	
    
}

var resetCanvasPie = function(){
	  $('#myPieChart').remove(); // this is my <canvas> element
	  $('#graph-container-pie').append('<canvas id="myPieChart" width="100%" height="30"><canvas>');
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


$(function(){
	makePieInfo();
});

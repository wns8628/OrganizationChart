$(function(){
	// Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#292b2c';
	
	
	let totalAge = new Array();	
	let ageName = new Array();	
	let token = new Array();	
	for(let i = 0; i<6; i++){
		token = $("div[data-age='"+(i+1)+"']").html().split(':');
		ageName.push(token[0]);
		totalAge.push(token[1]);
	}
	
	// Pie Chart Example
	var ctx = document.getElementById("myPieChart");
	var myPieChart = new Chart(ctx, {
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
});

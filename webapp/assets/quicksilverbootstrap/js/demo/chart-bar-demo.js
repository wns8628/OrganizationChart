let labelsArray = new Array();
let compEmpCountArray = new Array();
let myLineChart;

let InfoBar = function(seq, mode){

	labelsArray = [];
	compEmpCountArray = [];
	
	if(seq && mode == "biz"){
		$.ajax({
			url: contextPath + "/getBizChart/"+seq,
			type:"get",
			dataType:"json",
			data:"",
			async: false,
			success: function(response){
				console.log(response.data);
				$(response.data).each(function(index, vo){
					labelsArray.push(vo.bizName);
					compEmpCountArray.push(vo.bizEmpCount);
					
					$(".card-header .fa-chart-bar").html(" 사업장별 직원 수")
				});
				console.log(labelsArray);
				console.log(compEmpCountArray);
				
			},
			error: function(xhr, status, e){
				console.error(status+":"+e);
			}
		});
	}else{	
		$.ajax({
			url: contextPath + "/getMainChart",
			type:"get",
			dataType:"json",
			data:"",
			async: false,
			success: function(response){
				console.log(response.data);
				$(response.data).each(function(index, vo){
					labelsArray.push(vo.compName);
					compEmpCountArray.push(vo.compEmpCount);
				});
				console.log(labelsArray);
				console.log(compEmpCountArray);
				
			},
			error: function(xhr, status, e){
				console.error(status+":"+e);
			}
		});
	}
	//캔버스 hover방지
	if(myLineChart != null){
		resetCanvasBar();		
	}
	//각 유형별 최댓값으로 유동적인 max값으로 차트를 보기편하게함
	let maxData = Math.max.apply(null, compEmpCountArray);
	
	console.log(maxData);
	// Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#292b2c';
	
	// Bar Chart Example
	var ctx = document.getElementById("myBarChart");
	myLineChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: labelsArray,
	    datasets: [{
	      label: "직원 수(명)",
	      backgroundColor: "rgba(2,117,216,1)",
	      borderColor: "rgba(2,117,216,1)",
	      data: compEmpCountArray,
	    }],
	  },
	  options: {
	    scales: {
	      xAxes: [{
	        time: {
//	          unit: 'month'
	        },
	        gridLines: {
	          display: true
	        },
	        ticks: {
	          maxTicksLimit: 6
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          min: 0,
	          max: maxData + (maxData/7),
	          maxTicksLimit: 5
	        },
	        gridLines: {
	          display: true
	        }
	      }],
	    },
	    legend: {
	      display: true
	    }
	  }
	});
}

var resetCanvasBar = function(){
	console.log("dasdd wㅈ워져라");
	  $('#myBarChart').remove(); // this is my <canvas> element
	  $('#graph-container-bar').append('<canvas id="myBarChart" width="100%" height="50"><canvas>');
	  canvas = document.querySelector('#myBarChart');
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
	//InfoBar();
});

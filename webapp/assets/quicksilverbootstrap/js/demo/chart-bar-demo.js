
let labelsArray = new Array();
let compEmpCountArray = new Array();

$(function(){

	$.ajax({
		url: contextPath + "/getMainChart",
		type:"get",
		dataType:"json",
		data:"",
		async: false, //핵심임 상위가 무조건먼저 렌더되야지 밑에부서가 나오니 무조건 동기로 해야함
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
	
	// Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#292b2c';
	
	// Bar Chart Example
	var ctx = document.getElementById("myBarChart");
	var myLineChart = new Chart(ctx, {
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
	          max: 12000,
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
});

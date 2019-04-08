var renderTableDepartmentName = function(departmentName){
	   $(".card-header").empty();
	   let htmls = "<h6 class='m-0 font-weight-bold text-primary'>" + 
	   					departmentName + 
	   				"</h6>";
	   $(".card-header").append(htmls);
	}

var makeTable = function(url) {	
	$("#dataTable").dataTable().fnDestroy();
	
	$('#dataTable').dataTable({
          pageLength: 5,
          bPaginate: true,
          bLengthChange: true,
          lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
          bAutoWidth: false,
          processing: true,
          ordering: true,
          serverSide: false,
          searching: true,
          scrollY: 250,
          scrollCollapse: false,
         
          ajax : {
              "url": contextPath + url,
              "type": "GET",
              "data": '',
          },
          columns : [
              {data: "no"},
              {data: "name"},
              {data: "age"},
              {data: "gender"},
              {data: "grade"},
              {data: "departments"},
              {data: "company"},
              {data: "masterGroup"},
              {data: "phone"}
          ]

      });	
};

//메인 - 부서클릭시 : 테이블뿌려주기 
$(function(){
      $('#dataTable').dataTable();

      //부서 목록
      $(document).on("click", "#departments", function(event){

      // * 부서 클릭시 테이블에 사원 출력	       	   
	  let departmentNo = $(this).attr('data-no');
	  let departmentName = $(this).html();

	  makeTable("/boot/getDepartmentEmployeeInfo/" + departmentNo);
	  renderTableDepartmentName(departmentName);
   });
});


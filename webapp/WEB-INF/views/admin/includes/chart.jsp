<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	 <!-- Icon Cards-->
	 			<div class="chart-body-right">
			        <span class="chart-body-right-label">● 정보</span>	
			        <div class="row chart-body-right-in">
		 			    
		 			   <div style="display:flex"> 
				        <div class="info-bar-chart-mma">
		         		       <div class="chart-label chart-labe-owner">대표 : Quick Silver </div>
					           <ul class="info-chart-ul">
				                    <li><div class="mr-5 Info">- 자회사 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ${mainInfo.totalComp} 개</div></li>
					                <li><div class="mr-5 Info">- 사업장 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ${mainInfo.totalBiz} 개</div></li>
					                <li><div class="mr-5 Info">- 부서 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ${mainInfo.totalDept} 개</div></li>
			               			<li><div class="mr-5 Info">- 총 사원 수 : ${mainInfo.totalEmp} 명 (사원:${mainInfo.allEmp}명  + 겸직:${mainInfo.totalEmp - mainInfo.allEmp }명)</div></li>	    
				               </ul> 
				               
				               
	               		  	   <div style="display:none">
					                <%-- <div class="mr-5 Info" data-age="1">10대:${mainInfo.age10}</div> --%>
					                <div class="mr-5 Info" data-age="1">20대:${mainInfo.age20}</div>	
					                <div class="mr-5 Info" data-age="2">30대:${mainInfo.age30}</div>	
					                <div class="mr-5 Info" data-age="3">40대:${mainInfo.age40}</div>	
					                <div class="mr-5 Info" data-age="4">50대:${mainInfo.age50}</div>	
					                <div class="mr-5 Info" data-age="5">60대:${mainInfo.age60}</div>
						            <div class="mr-5 Info" data-age="6">남자:${mainInfoFm[0].genderCount}</div>
						            <div class="mr-5 Info" data-age="7">여자:${mainInfoFm[1].genderCount}</div>
							   </div>
				        </div> 
		 				<!-- chart bar -->
		 				<div class="col-xl-6 info-bar-chart">
				          <div class="">
				            <div class="card mb-3">
				              <div class="card-header chart-label">
				                <span class="">자회사별 직원 수</span>
				                </div>
				              <div class="card-body" id="graph-container-bar">
				                <canvas id="myBarChart" width="100%" height="60"></canvas>
				              </div>
				            </div>
				          </div>
				        </div> 
				        <!--  -->
       			 	 </div> 
			 	     <div style="display:flex"> 
				         <!-- 원차트  -->
	                   	 <div class="col-sm-12 info-pie-chart">
				            <div class="card mb-3">
				              <div class="card-header chart-label"> 
				                <span class="">연령대별 직원 비율</span>
				                </div>
				              <div class="card-body" id="graph-container-pie">
				                <canvas id="myPieChart" width="100%" height="50"></canvas>
				              </div>
				            </div>
			             </div>
			             <div class="info-pie-chart-fm">
	   			            <div class="card mb-3">
				              <div class="card-header chart-label"> 
				                <span class="">남/여 비율</span>
				                </div>
				              <div class="card-body" id="graph-container-pie-fm">
				                <canvas id="myPieChartFm" width="100%" height="50"></canvas>
				              </div>
				            </div>
				         </div> 
				         <!--  -->
			         </div>
			         
			        </div>
		        </div>
		        
		        
		        
		        
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	 <!-- Icon Cards-->
		        <div class="row" style="margin-left: 0px;">
		        	<div class="col-xl-6 row">
 			          <div class="col-sm-6" 
			          	   style="height: 160px;">
			            <div class="card text-white bg-primary o-hidden h-100">
			              <div class="card-body">
			                <div class="card-body-icon">
			                  <i class="fas fa-fw fa-list"></i>
			                </div>
			          		 
			               <ul style="padding-left: 20px;">
				                <li><div class="mr-5">자회사 : ${mainInfo.totalComp} 개</div></li>
				                <li><div class="mr-5">사업장 : ${mainInfo.totalBiz} 개</div></li>
				                <li><div class="mr-5">부서 : ${mainInfo.totalDept} 개</div></li>
			                </ul> 
			               
			                    <div class="mr-5 Info">● 자회사 : ${mainInfo.totalComp} 개</div>
				                <div class="mr-5 Info">● 사업장 : ${mainInfo.totalBiz} 개</div>
				                <div class="mr-5 Info">● 부서 : ${mainInfo.totalDept} 개</div>
			                
			              </div>
			              
						           
					     <a class="card-footer text-white clearfix small z-1" href="#">
			                <span class="float-left">View Details</span>
			                <span class="float-right">
			                  <i class="fas fa-angle-right"></i>
			                </span>
			              </a>
			            
			             
			            </div>
			          </div>
			          
			           <div class="col-sm-6"
				           style="height: 160px;">
			            <div class="card text-white bg-danger o-hidden h-100">
			              <div class="card-body">
			                <div class="card-body-icon">
			                  <i class="fas fa-fw fa-life-ring"></i>
			                </div>
			                  <div class="mr-5 Info">● 총 직원 수 : ${mainInfo.totalEmp} 명</div>
			               
							  <div style="display:none">
				                <div class="mr-5 Info" data-age="1">10대:${mainInfo.age10}</div>	
				                <div class="mr-5 Info" data-age="2">20대:${mainInfo.age20}</div>	
				                <div class="mr-5 Info" data-age="3">30대:${mainInfo.age30}</div>	
				                <div class="mr-5 Info" data-age="4">40대:${mainInfo.age40}</div>	
				                <div class="mr-5 Info" data-age="5">50대:${mainInfo.age50}</div>	
				                <div class="mr-5 Info" data-age="6">60대:${mainInfo.age60}</div>
							  </div>
			              </div>
			              <!-- <a class="card-footer text-white clearfix small z-1" href="#">
			                <span class="float-left">View Details</span>
			                <span class="float-right">
			                  <i class="fas fa-angle-right"></i>
			                </span>
			              </a> -->
			            </div>
			          </div> 
			          
			          <!-- 원차트  -->
                   	 <div class="col-sm-12" style="margin-top: 15px;">
			            <div class="card mb-3">
			              <div class="card-header"> 
			                <i class="fas fa-chart-pie"> 연령대별 직원 비율</i>
			                </div>
			              <div class="card-body" id="graph-container-pie">
			                <canvas id="myPieChart" width="100%" height="30"></canvas>
			              </div>
			              <div class="card-footer small text-muted">Quick Silver / douzone</div>
			            </div>
			          </div> 
			          <!--  -->
		          </div>
				    <!-- chart bar -->
	 				 <div class="col-xl-6" style="margin-top: 15px;">
			          <div class="">
			            <div class="card mb-3">
			              <div class="card-header">
			                <i class="fas fa-chart-bar"> 자회사별 직원 수</i>
			                </div>
			              <div class="card-body" id="graph-container-bar">
			                <canvas id="myBarChart" width="100%" height="50"></canvas>
			              </div>
			              <div class="card-footer small text-muted">Quick Silver / douzone</div>
			            </div>
			          </div>
			        </div> 
		        </div>
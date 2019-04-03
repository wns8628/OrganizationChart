<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<style type="text/css">
li{display: none;}

/* reset */
*            { margin:0; padding:0 }
body         { font:0.75em "맑은 고딕", 돋움, 굴림; color:#111 }
ul, ol         { list-style-type: none }
fieldset      { border:none }

a:link          { color:#696969; text-decoration:none; font-weight:bold; }
a:visited       { color:#696969F; text-decoration:none; font-weight:bold; }
a:active       { color:#696969; text-decoration:none; font-weight:bold; }
a:hover       { color:#dc143c; text-decoration:none; font-weight:bold; } 

/* header */
div#header ul      { height:20px } 
div#header li      { float:right; margin-right:10px; }
div#header li a    { color:#fff; font-weight:bold; text-decoration:none; }

div.header-wrapper { width: 100%; height: 30px; background-color: #111111; vertical-align: middle; /* padding: 5px 10px;  */}
div.header-wrapper span {color : white; font-size: 20px;}
div.header-menubar { background: transparent; width: 40%; height: 30px; display: inline; float: right;}
div.header-menubar button {background: transparent; color:white; font-size: 20px; float: right;}
div.navi{ background-color: #119999; height:500px; width: 30%; display: inline-block;}
div.result-wrapper{ background-color: #999900; height:500px; width: 70%; float: right;}

</style>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<%-- 
<link href="${pageContext.servletContext.contextPath }/assets/css/main.css" rel="stylesheet" type="text/css">
 --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">

var render = function(vo){
   var htmls = "<h2 data-no='"+vo.no+"'>"+vo.name+"</h2><ul data-no='"+vo.no+"'></ul>";
   $("div.navi").append(htmls);
}

var render2 = function(vo){
   var htmls = "<li data-no='"+vo.no+"' g-no='"+vo.gNo+"' p-no='"+vo.parents+"' depth='"+vo.depth+"' style='padding-left:"+vo.depth*10+"px'>"+vo.name+"</li>";
   $("ul[data-no='"+vo.companyNo+"']").append(htmls);
}

var getList = function(){
   $.ajax({
      url:"${pageContext.servletContext.contextPath }/getlist",
      type:"get",
      dataType:"json",
      data:"",
      success: function(response){
         console.log(response.data);
         $(response.data.companyVoList).each(function(index, vo){
            render(vo);
         });
         $(response.data.departmentsVoList).each(function(index, vo){
            render2(vo);
         });
      },
      error: function(xhr, status, e){
         console.error(status+":"+e);
      }
      
   });
}

$(function(){
   getList();
   
   //자회사 목록
   $(document).on("click", "h2", function(event){
      var cno = $(this).attr("data-no");
      $list = $("ul[data-no='"+cno+"'] li[depth='1']");
      if($list.css("display")==="none"){
         $list.show();
      }else{
         $("ul[data-no='"+cno+"'] li").hide();
      }
      
   });
   
   //부서 목록
   $(document).on("click", "li", function(event){
      var no = $(this).attr("data-no");
      var gno = $(this).attr("g-no");
      var depth = ($(this).attr("depth")*1)+1;
      $list = $("li[p-no='"+no+"']");
      if($list.css("display")==="none"){
         $list.show();
      }else{
         var f = function($li){
            console.log($li.length);
            $li.hide();
            for(var i=0; i<$li.length; i++){
               if($li[i].getAttribute('data-no') != undefined){
                   f($("li[p-no='"+$li[i].getAttribute('data-no')+"']"));
                }
            }
         }
         f($list);
      }
   });
});
</script>
</head>
<body>
   <div id="header">
      <div class="header-wrapper">
         <span>quicksilver</span>
         <div class="header-menubar">
            <button>login</button>      
         </div>
      </div>
   </div>
   <div class="navi">
   </div>
   <div class="result-wrapper">
   </div>
</body>
</html>